package com.essamine.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class Member_Role extends UrlEntity {
	@Column
	private String role;

	@ManyToOne
	private Member member;

	public Member_Role() {

	}

	public Member_Role(String role, Member member) {
		this.role = role;
		this.member = member;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

}
