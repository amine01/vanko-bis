package com.essamine.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

import org.hibernate.validator.constraints.NotBlank;

@Entity
public class Fonction extends UrlEntity {
	@Column
	@NotBlank
	private String fonction;

	//ajouter
	@OneToMany(mappedBy="fonction", cascade = CascadeType.REMOVE, orphanRemoval = false)
	private List<PersonneFonction> personneFonctions;
	
	
	public Fonction() {
		
	}
	
	
	// Getters & Setters
	public String getFonction() {
		return fonction;
	}

	public void setFonction(String fonction) {
		this.fonction = fonction;
	}

	public List<PersonneFonction> getPersonneFonctions() {
		return personneFonctions;
	}

	public void setPersonneFonctions(List<PersonneFonction> personneFonctions) {
		this.personneFonctions = personneFonctions;
	}

}
