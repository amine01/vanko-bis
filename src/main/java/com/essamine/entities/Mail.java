package com.essamine.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

@Entity
public class Mail extends UrlEntity {
	@Column
	@NotBlank
	@Email(message="Adresse mail n'est pas valide")
	private String email;
	
	@Column
	private Boolean pola;
	
	@ManyToOne(optional=false)
	private Personne personne;
	
	public Mail() {
		
	}

	
	
	
	// Getters & Setters

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Boolean getPola() {
		return pola;
	}

	public void setPola(Boolean pola) {
		this.pola = pola;
	}

	public Personne getPersonne() {
		return personne;
	}

	public void setPersonne(Personne personne) {
		this.personne = personne;
	}
	
	

}
