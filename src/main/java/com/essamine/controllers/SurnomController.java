package com.essamine.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.essamine.entities.Surnom;
import com.essamine.repositories.PersonneRepository;
import com.essamine.repositories.SurnomRepository;

@Controller
@PropertySource("classpath:info.properties")
public class SurnomController {
	
	@Autowired
	PersonneRepository personneRepository;
	
	@Autowired
	SurnomRepository surnomRepository;

	@RequestMapping(value = "/surnom", method = RequestMethod.GET, params = "edit")
	public String getSurnomtoEdit(@RequestParam long id, Model model) {
		Surnom surnom=surnomRepository.findOne(id);
		System.out.println("Get function : "+surnom);
		model.addAttribute("surnom", surnom);
		return "surnom/edit";
	}

	@RequestMapping(value = "/surnom", method = RequestMethod.POST, params = "edit")
	public ModelAndView editSelectedSurnom(@Valid Surnom surnom, BindingResult bResult) {
		Surnom s=surnomRepository.findOne(surnom.getId());
		if(bResult.hasErrors()){
			System.out.println("Failed  = "+surnom.getSurnom()+" ID personne = "+surnom.getPersonne().getId());
		return new ModelAndView("surnom/edit");
		}
		s.setSurnom(surnom.getSurnom());

		surnomRepository.save(s);
		return new ModelAndView("redirect:personne?id="+s.getPersonne().getId()+"&view");

//		}
	}

}
