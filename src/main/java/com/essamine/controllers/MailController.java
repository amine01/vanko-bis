package com.essamine.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.essamine.entities.Mail;
import com.essamine.entities.Personne;
import com.essamine.repositories.EmailRepository;
import com.essamine.repositories.PersonneRepository;

@Controller
@PropertySource("classpath:info.properties")
public class MailController {

	@Autowired
	PersonneRepository personneRepository;

	@Autowired
	EmailRepository emailRepository;



	@RequestMapping(value = "/mail", method = RequestMethod.GET, params = "edit")
	public String getEmailToEdit(@RequestParam long id, Model model) {
		Mail m = emailRepository.findOne(id);
		model.addAttribute("mail", m);
		model.addAttribute("personne", m.getPersonne());
		return "mail/edit";

	}

	@RequestMapping(value = "/mail", method = RequestMethod.POST, params = "edit")
	public ModelAndView editSelectedMail(@RequestParam(required = false) String personne_id,@Valid Mail mail, BindingResult bResult,Model model) {
		
		Mail m = emailRepository.findOne(mail.getId());
		Personne p = personneRepository.findOne(Long.parseLong(personne_id));
		
		model.addAttribute("personne", p);
		
		if (bResult.hasErrors()) {
			return new ModelAndView("mail/edit");
		}
		m.setEmail(mail.getEmail());
		m.setPolar(mail.getPolar());
		m.setPersonne(p);

		emailRepository.save(m);
		return new ModelAndView("redirect:personne?id=" + m.getPersonne().getId() + "&view");
	}
	
	
	
	 @RequestMapping(value = "/mail", method = RequestMethod.GET, params = "add")
	 public String addEmailForm(@RequestParam long id, Model model) {
	 model.addAttribute("personne", personneRepository.findOne(id));
	 model.addAttribute("mail", new Mail());
	 return "mail/add";
	 }

	@RequestMapping(value = "/mail", method = RequestMethod.POST, params = "add")
	public ModelAndView addMail(@RequestParam(required = false) String personne_id,@ModelAttribute(value = "mail") @Valid Mail mail, BindingResult bResult, Model model) {
		Personne p = personneRepository.findOne(Long.parseLong(personne_id));
		model.addAttribute("personne", p);
		if (bResult.hasErrors()) {
			System.out.println("mail has errors");
			return new ModelAndView("mail/add");
		}
		mail.setPersonne(p);
		emailRepository.save(mail);
		return new ModelAndView("personne/view");

	}

}
