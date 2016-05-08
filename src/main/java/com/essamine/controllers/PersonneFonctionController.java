package com.essamine.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.essamine.entities.Fonction;
import com.essamine.entities.Personne;
import com.essamine.entities.PersonneFonction;
import com.essamine.repositories.FonctionRepository;
import com.essamine.repositories.PersonneFonctionRepository;
import com.essamine.repositories.PersonneRepository;

@Controller
@PropertySource("classpath:info.properties")
public class PersonneFonctionController {

	 @Autowired
	 PersonneRepository personneRepository;
	 
	 @Autowired
	 FonctionRepository fonctionRepository;

	@Autowired
	PersonneFonctionRepository personneFonctionRepository;

	@RequestMapping(value = "/personnefonction", method = RequestMethod.GET, params = "edit")
	public String getpersonneFonctionToEdit(@RequestParam long id, Model model) {
		PersonneFonction personnefonction = personneFonctionRepository.findOne(id);
		System.out.println(personnefonction.getFonction().getFonction());
		System.out.println(personnefonction.getDateDebut());
		System.out.println(personnefonction.getDateFin());
		model.addAttribute("personnefonction", personnefonction);
		return "personnefonction/edit";

	}

	@RequestMapping(value = "/personnefonction", method = RequestMethod.POST, params = "edit")
	public ModelAndView editSelectedpersonneFonction(
			@ModelAttribute(value = "personnefonction") @Valid PersonneFonction personnefonction,
			BindingResult bResult) {
		PersonneFonction pf = personneFonctionRepository.findOne(personnefonction.getId());
		if (bResult.hasErrors()) {
			return new ModelAndView("personnefonction/edit");
		}
		pf.getFonction().setFonction(personnefonction.getFonction().getFonction());
		pf.setDateFin(personnefonction.getDateDebut());
		pf.setDateDebut(personnefonction.getDateFin());

		personneFonctionRepository.save(pf);
		return new ModelAndView("redirect:personne?id=" + pf.getPersonne().getId() + "&view");
	}
	//
	//
	//
	 @RequestMapping(value = "/personnefonction", method = RequestMethod.GET, params ="add")
	 public String addfonctionpersonneForm(@RequestParam long id, Model model) {
		 model.addAttribute("personne", personneRepository.findOne(id));
		 model.addAttribute("personnefonction", new PersonneFonction());
	 return "personnefonction/add";
	 }
	//
	 @RequestMapping(value = "/personnefonction", method = RequestMethod.POST, params ="add")
	 public ModelAndView addfonctionPersonne(@RequestParam(required = false) String
	 personne_id,@ModelAttribute(value = "personnefonction") @Valid PersonneFonction personnefonction,
	 BindingResult bResult, Model model) {
	
	Personne p = personneRepository.findOne(Long.parseLong(personne_id));	
	 
	 model.addAttribute("personne", p);
	 if (bResult.hasErrors()) {
	 return new ModelAndView("personnefonction/add");
	 }
	 Fonction f=fonctionRepository.save(personnefonction.getFonction());
	 personnefonction.setFonction(f);
	 personnefonction.setPersonne(p);
	
	 
	 personneFonctionRepository.save(personnefonction);
	 return new ModelAndView("personne/view");
	
	 }

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("dd/MM/yyyy"), true, 10));
	}
}
