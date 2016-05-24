package com.essamine.controllers;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;
import java.util.Random;

import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
	
	@RequestMapping(value = "/photo", method = RequestMethod.GET, params = "edit")
	public String editPhotoForm(@RequestParam long id, Model model) {

		model.addAttribute("personne", personneRepository.findOne(id));
	
		return "photo/edit";
	}
	
	@RequestMapping(value = "/photo", method = RequestMethod.POST, params = "delete")
	public String deletePhoto(@RequestParam long id) {
		Photo photo=photoRepository.findOne(id);
		
		photoRepository.delete(photo);
		
		return "redirect:personne?id="+photo.getPersonne().getId()+"&view";
	}

	@RequestMapping(value = "/photo", method = RequestMethod.POST, params = "add")
	public String addPhoto(@RequestParam(required = false) String personne_id,
			@ModelAttribute(value = "photo") @Valid Photo photo, BindingResult bResult, Model model) {

		Personne p = personneRepository.findOne(Long.parseLong(personne_id));
		model.addAttribute("personne", p);

		if (bResult.hasErrors()) {
			System.out.println("Error");
			System.out.println(bResult);
			return "photo/add";
		}

		StringBuilder uniqueFileName = new StringBuilder(uniqueFileName(photo.getFile().getOriginalFilename()));
		StringBuilder newFileName = new StringBuilder(path + uniqueFileName);
		photo.setPersonne(p);
		photo.setNomPhoto(uniqueFileName.toString());
		photo.setUrlPhoto(newFileName.toString());

		try {
			uploadFile(photo.getFile(), newFileName.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		photoRepository.save(photo);
		return "redirect:personne?id=" + photo.getPersonne().getId() + "&view";
	}

	public String uniqueFileName(String fileName) {
		Random random = new Random();
		int randomNumber = random.nextInt(100 - 1) + 1;
		String fileExtention = null;
		if (fileName != null)
			fileExtention = fileName.substring(fileName.length() - 3);
		Calendar cal = Calendar.getInstance();

		Long uniqueNumber = cal.getTimeInMillis() / 10000;
		String uniqueFileName = (uniqueNumber + randomNumber) + "." + fileExtention;

		return uniqueFileName;
	}

	public void uploadFile(MultipartFile file, String desti) throws IOException {

		InputStream in = file.getInputStream();
		File fileDesti = new File(desti);
		FileUtils.copyInputStreamToFile(in, fileDesti);
	}
	
	
	// for (int i = 0; i < photos.size(); i++) {
	// photo = personne.getPhotos().get(i);
	// // upload photo
	// StringBuilder uniqueFileName = new StringBuilder(
	// uniqueFileName(photos.get(i).getFile().getOriginalFilename()));
	// StringBuilder newFileName = new StringBuilder(path +
	// uniqueFileName);
	// photo.setNomPhoto(uniqueFileName.toString());
	// photo.setUrlPhoto(newFileName.toString());
	// System.out.println("getOriginalFilename : " +
	// photos.get(i).getFile().getOriginalFilename());
	// System.out.println("name : " +
	// photos.get(i).getFile().getName());
	//
	// uploadFile(photos.get(i).getFile(), newFileName.toString());
	// //
	// photo.setPersonne(personne);
	// photoRepository.save(photo);
	// }
}
