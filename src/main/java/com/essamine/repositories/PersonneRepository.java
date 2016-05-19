package com.essamine.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.essamine.entities.Personne;

public interface PersonneRepository extends JpaRepository<Personne, Long>{
	
	
	@Query("SELECT p FROM Personne p join p.mails mls join p.surnoms srms where mls.email like CONCAT('%',:key,'%') OR p.nom like CONCAT('%',:key,'%') OR "
			+ " p.prenom like CONCAT('%',:key,'%')") 
    Page<Personne> findPersonneByKey(@Param("key") String key,Pageable pageable);
}
