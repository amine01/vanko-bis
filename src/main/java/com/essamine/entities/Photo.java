package com.essamine.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.Valid;
import javax.validation.constraints.AssertTrue;

import org.springframework.web.multipart.MultipartFile;

@Entity
public class Photo extends UrlEntity {
	
	@Column
	private String nomPhoto;
	@Column
	private String urlPhoto;
	
	@ManyToOne
	@Valid
	private Personne personne;
	
	//
	
	//@NotBlank
	@Transient
	 MultipartFile file;
	
	 @AssertTrue(message = "File must be provided")
	  public boolean isFileProvided() {
	    return (file != null) && ( ! file.isEmpty());
	  }
	//

	// Getters & Setters

	public String getNomPhoto() {
		return nomPhoto;
	}

	public void setNomPhoto(String nomPhoto) {
		this.nomPhoto = nomPhoto;
	}

	public String getUrlPhoto() {
		return urlPhoto;
	}

	public void setUrlPhoto(String urlPhoto) {
		this.urlPhoto = urlPhoto;
	}

	public Personne getPersonne() {
		return personne;
	}

	public void setPersonne(Personne personne) {
		this.personne = personne;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}


	
	

}
