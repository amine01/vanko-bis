package com.essamine.controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.support.StringMultipartFileEditor;

import com.essamine.entities.Fonction;
import com.essamine.entities.Mail;
import com.essamine.entities.Personne;
import com.essamine.entities.PersonneFonction;
import com.essamine.entities.Surnom;
import com.essamine.helps.ErrorMessage;
import com.essamine.helps.ValidationResponse;
import com.essamine.repositories.EmailRepository;
import com.essamine.repositories.FonctionRepository;
import com.essamine.repositories.PersonneFonctionRepository;
import com.essamine.repositories.PersonneRepository;
import com.essamine.repositories.SurnomRepository;

@Controller
@PropertySource("classpath:info.properties")
public class PersonneController {

	@Value("${path}")
	String path;

	@Value("${recordPerPage}")
	int recordPerPage;

	@Autowired
	PersonneRepository personneRepository;

	@Autowired
	SurnomRepository surnomRepository;

	@Autowired
	EmailRepository emailRepository;

	@Autowired
	FonctionRepository fonctionRepository;

	@Autowired
	PersonneFonctionRepository personneFonctionRepository;

	//
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("dd/MM/yyyy"), true, 10));
		binder.registerCustomEditor(String.class, new StringMultipartFileEditor());
	}

	// Debut Datatabel

	@RequestMapping(value = "/personness", method = RequestMethod.GET)
	public String getPersonnes(Model model) {

		List<Personne> personnes = personneRepository.findAll();
		model.addAttribute("personnes", personnes);
		return "personne/listt";
	}
	// Fin Datatabel

	// i am here
	@RequestMapping(value = "/personnes", method = RequestMethod.GET)
	public String getPersons(Model model, @RequestParam(required = false) Integer page) {

		int pageR = 1;

		if (page != null) {
			if (page <= 0)
				page = 1;
			pageR = page;
		}

		Page<Personne> personnes = personneRepository.findAll(new PageRequest(pageR - 1, recordPerPage));

		// Number Of Records
		int noOfRecords = personneRepository.findAll().size();
		// Number Of Pages
		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordPerPage);

		model.addAttribute("personnes", personnes.getContent());
		model.addAttribute("currentPage", pageR);
		model.addAttribute("recordPerPage", recordPerPage);
		model.addAttribute("noOfPages", noOfPages);
		model.addAttribute("keywordsearch", "");

		return "personne/list";
	}

	@RequestMapping(value = "/personnes", params = "search", method = RequestMethod.POST)
	public String searchPersonne(Model model, @RequestParam(required = false) Integer page,
			@RequestParam(required = false) String keywordsearch) {

		if (keywordsearch.equals("") || keywordsearch.equals(null))
			return "redirect:personnes";

		// System.out.println("search --> " +keywordsearch);

		int pageR = 1;

		if (page != null) {
			if (page <= 0)
				page = 1;
			pageR = page;
		}

		// System.out.println(personneRepository.findPersonneByKey(keywordsearch,new
		// PageRequest(pageR - 1, recordPerPage)).getSize());
		int noOfRecords = personneRepository.findPersonneByKey(keywordsearch, new PageRequest(pageR - 1, recordPerPage))
				.getSize();
		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordPerPage);

		// Page<Personne> personnes = personneRepository.findAll(new
		// PageRequest(pageR - 1, recordPerPage));

		Page<Personne> personnes = personneRepository.findPersonneByKey(keywordsearch,
				new PageRequest(pageR - 1, recordPerPage));

		model.addAttribute("personnes", personnes.getContent());
		model.addAttribute("currentPage", pageR);
		model.addAttribute("recordPerPage", recordPerPage);
		model.addAttribute("noOfPages", noOfPages);
		model.addAttribute("keywordsearch", keywordsearch);

		return "personne/list";
	}

	@RequestMapping(value = "/personne", method = RequestMethod.POST)
	public String processFormAjax(@ModelAttribute(value = "personne") @Valid Personne personne, BindingResult bResult) {

		if (bResult.hasErrors()) {
			return "personne/add";
		} else {
			return "redirect:personnes";
		}

	}

	@RequestMapping(value = "/personne", params = "add", method = RequestMethod.GET)
	public String addPersonne(Model model) {
		model.addAttribute("personne", new Personne());

		return "personne/add";
	}

	@RequestMapping(value = "/personne.json", method = RequestMethod.POST, params = "add")
	public @ResponseBody ValidationResponse addPersonne(@ModelAttribute(value = "personne") @Valid Personne personne,
			BindingResult bResult) throws IOException {

		ValidationResponse res = new ValidationResponse();
		if (bResult.hasErrors()) {
			res.setStatus("FAIL");

			List<FieldError> allErrors = bResult.getFieldErrors();
			List<ErrorMessage> errorMesages = new ArrayList<ErrorMessage>();
			for (FieldError objectError : allErrors) {
				errorMesages.add(new ErrorMessage(objectError.getField(), objectError.getDefaultMessage()));

			}
			res.setErrorMessageList(errorMesages);
		} else {
			res.setStatus("SUCCESS");

			// //
			personne.setId(personneRepository.save(personne).getId());
			Surnom surnom;
			Mail email;
			PersonneFonction personneFonction;
			Fonction fonction;
			//
			for (int i = 0; i < personne.getSurnoms().size(); i++) {
				surnom = personne.getSurnoms().get(i);
				surnom.setPersonne(personne);
				surnomRepository.save(surnom);
				surnom = null;
			}
			//
			for (int i = 0; i < personne.getMails().size(); i++) {
				email = personne.getMails().get(i);
				email.setPersonne(personne);
				emailRepository.save(email);
				email = null;
			}

			for (int i = 0; i < personne.getPersonneFonctions().size(); i++) {
				personneFonction = personne.getPersonneFonctions().get(i);
				fonction = fonctionRepository.save(personneFonction.getFonction());

				personneFonction.setFonction(fonction);
				personneFonction.setPersonne(personne);

				personneFonctionRepository.save(personneFonction);
				personneFonction = null;

			}
		}
		return res;

	}

	@RequestMapping(value = "/personne", method = RequestMethod.GET, params = "view")
	public String personneView(@RequestParam long id, Model model) {
		model.addAttribute("personne", personneRepository.findOne(id));
		return "personne/view";
	}

	@RequestMapping(value = "/personne", method = RequestMethod.POST, params = "delete")
	public String deletePersonne(@RequestParam(required = false) long id) {
		Personne p = personneRepository.findOne(id);
		personneRepository.delete(p);
		return "redirect:personnes";
	}

}
