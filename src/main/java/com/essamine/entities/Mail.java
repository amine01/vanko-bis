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
	@NotBlank
	private String polar;
	
	@ManyToOne
	private Personne personne;
	
	public Mail() {
		
	}

	

	public String getPolar() {
		return polar;
	}



	public void setPolar(String polar) {
		this.polar = polar;
	}



	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Personne getPersonne() {
		return personne;
	}

	public void setPersonne(Personne personne) {
		this.personne = personne;
	}



	@Override
	public boolean equals(Object arg0) {
		// TODO Auto-generated method stub
		return super.equals(arg0);
	}
	
	

}
