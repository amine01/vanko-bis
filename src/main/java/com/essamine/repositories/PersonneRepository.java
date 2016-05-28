package com.essamine.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.essamine.entities.Personne;

public interface PersonneRepository extends JpaRepository<Personne, Long>{
	
	
	@Query("SELECT p FROM Personne p "
			+ "INNER JOIN p.personneFonctions pf "
			+ "JOIN p.mails mls "
			+ "JOIN p.surnoms srms "
			+ "where lower(mls.email) like lower(CONCAT('%',:key,'%')) "
			+ "OR lower(p.nom) like lower(CONCAT('%',:key,'%')) "
			+ "OR lower(p.prenom) like lower(CONCAT('%',:key,'%')) "
			+ "OR lower(pf.fonction.fonction) like lower(CONCAT('%',:key,'%'))") 
    Page<Personne> findPersonneByKey(@Param("key") String key,Pageable pageable);

}
