package com.essamine.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class Personne extends UrlEntity {

	@Column
	@NotBlank
	private String nom;
	@Column
	@NotBlank
	private String prenom;
	@Column
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Temporal(TemporalType.DATE)
	@NotNull
	private Date dateNaissance;

	@OneToMany(mappedBy="personne")
	@Valid
	private List<Surnom> surnoms;
	
	@OneToMany(mappedBy="personne")
	@Valid
	private List<Mail> emails;
	
	@OneToMany(mappedBy="personne")
	@Valid
	private List<PersonneFonction> personneFonctions;

	// Getters & Setters

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public Date getDateNaissance() {
		return dateNaissance;
	}

	public void setDateNaissance(Date dateNaissance) {
		this.dateNaissance = dateNaissance;
	}

	public List<Surnom> getSurnoms() {
		return surnoms;
	}

	public void setSurnoms(List<Surnom> surnoms) {
		this.surnoms = surnoms;
	}

	public List<Mail> getEmails() {
		return emails;
	}

	public void setEmails(List<Mail> emails) {
		this.emails = emails;
	}


	public List<PersonneFonction> getPersonneFonctions() {
		return personneFonctions;
	}

	public void setPersonneFonctions(List<PersonneFonction> personneFonctions) {
		this.personneFonctions = personneFonctions;
	}

}