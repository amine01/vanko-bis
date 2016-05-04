package com.essamine.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.essamine.entities.Mail;

public interface EmailRepository extends JpaRepository<Mail, Long> {

}
