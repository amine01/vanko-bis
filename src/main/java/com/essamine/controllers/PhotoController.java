package com.essamine.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.essamine.entities.Personne;
import com.essamine.entities.Photo;
import com.essamine.repositories.PersonneRepository;
import com.essamine.repositories.PhotoRepository;

@Controller
public class PhotoController {
	@Value("${path}")
	String path;

	@Autowired
	PersonneRepository personneRepository;

	@Autowired
	PhotoRepository photoRepository;

	@RequestMapping(value = "/photo", method = RequestMethod.GET, params = "add")
	public String addPhotoForm(@RequestParam long id, Model model) {
		model.addAttribute("personne", personneRepository.findOne(id));
		model.addAttribute("photo", new Photo());
		return "photo/add";
	}

	@RequestMapping(value = "/photo", method = RequestMethod.POST, params = "add")
	public String addPhoto(@RequestParam(required = false) String personne_id,
			@ModelAttribute(value = "photo") @Valid Photo photo, BindingResult bResult, Model model) {
		System.out.println("photo POST");
		Personne p = personneRepository.findOne(Long.parseLong(personne_id));
		model.addAttribute("personne", p);
		
		if (bResult.hasErrors()) {
			System.out.println("Error");
			System.out.println(bResult);
			return "photo/add";
		}
		System.out.println("is empty file -> " + photo.getFile().isEmpty());
		System.out.println("photo GO");
		photo.setPersonne(p);
		return "redirect:personne?id=" + photo.getPersonne().getId() + "&view";
	}
}
