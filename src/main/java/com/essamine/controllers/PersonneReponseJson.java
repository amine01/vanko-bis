/*
 * Copyright (C) 2012, Excilys
 */
package com.essamine.controllers;

import java.util.ArrayList;
import java.util.List;

import com.essamine.entities.Personne;

public class PersonneReponseJson {

    /* Paramètre de controle */
    private Integer sEcho;

    /* Nombre total de résultats correspondant aux critères de recherche */
    private Integer iTotalDisplayRecords;

    /* Liste des resultats
       Par défaut dataTable cherche les résultats dans une propriété nommée aaData.
       On peut configurer le nom de la propriété.
     */
    private List<Personne> aaData = new ArrayList<Personne>();

    public PersonneReponseJson() {
        super();
    }

    public Integer getsEcho() {
        return sEcho;
    }

    public void setsEcho(Integer sEcho) {
        this.sEcho = sEcho;
    }

    public Integer getiTotalDisplayRecords() {
        return iTotalDisplayRecords;
    }

    public void setiTotalDisplayRecords(Integer iTotalDisplayRecords) {
        this.iTotalDisplayRecords = iTotalDisplayRecords;
    }

    public List<Personne> getAaData() {
        return aaData;
    }

    public void setAaData(List<Personne> aaData) {
        this.aaData = aaData;
    }

}
