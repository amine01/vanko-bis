package com.essamine.entities;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class PersonneFonction extends UrlEntity {

	// date d Engagement
	@Column
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Temporal(TemporalType.DATE)
//	@NotNull(message="Cette valeur ne doit pas être vide.")
	private Date dateDebut;

	@ManyToOne
	@Valid
	private Personne personne;

	@ManyToOne(optional=false,cascade=CascadeType.REMOVE)
	@Valid
	private Fonction fonction;

	// pas important
	@Column
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Temporal(TemporalType.DATE)
//	@NotNull(message="Cette valeur ne doit pas être vide.")
	private Date dateFin;
	

	public PersonneFonction() {
	}

	// Getters & Setters
	public Date getDateDebut() {
		return dateDebut;
	}

	public void setDateDebut(Date dateDebut) {
		this.dateDebut = dateDebut;
	}

	public Date getDateFin() {
		return dateFin;
	}

	public void setDateFin(Date dateFin) {
		this.dateFin = dateFin;
	}

	public Personne getPersonne() {
		return personne;
	}

	public void setPersonne(Personne personne) {
		this.personne = personne;
	}

	public Fonction getFonction() {
		return fonction;
	}

	public void setFonction(Fonction fonction) {
		this.fonction = fonction;
	}


}
