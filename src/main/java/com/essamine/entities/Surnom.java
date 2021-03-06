package com.essamine.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.Valid;

@Entity
public class Surnom extends UrlEntity {

	@Column
//	@NotBlank(message="Cette valeur ne doit pas �tre vide.")
	private String surnom;
	@ManyToOne
	@Valid
	private Personne personne;
	
	public Surnom() {
	
	}

	// Getters & Setters
	public String getSurnom() {
		return surnom;
	}

	public void setSurnom(String surnom) {
		this.surnom = surnom;
	}

	public Personne getPersonne() {
		return personne;
	}

	public void setPersonne(Personne personne) {
		this.personne = personne;
	}

}
