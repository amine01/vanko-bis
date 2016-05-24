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
			+ "where mls.email like CONCAT('%',:key,'%') "
			+ "OR p.nom like CONCAT('%',:key,'%') "
			+ "OR p.prenom like CONCAT('%',:key,'%') "
			+ "OR pf.fonction.fonction like CONCAT('%',:key,'%')") 
    Page<Personne> findPersonneByKey(@Param("key") String key,Pageable pageable);

}
