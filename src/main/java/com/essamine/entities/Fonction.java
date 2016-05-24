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
	@NotBlank(message="Cette valeur ne doit pas être vide.")
	private String fonction;

	//ajouter+
	//@Cascade(org.hibernate.annotations.CascadeType.DELETE_ORPHAN)
	@OneToMany(mappedBy="fonction",cascade=CascadeType.REMOVE,orphanRemoval=true)
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


	@Override
	public String toString() {
		return fonction;
	}
	
	

}
