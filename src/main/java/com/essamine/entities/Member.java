package com.essamine.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
public class Member extends UrlEntity {

	@Column
	private String username;
	@Column
	private String password;
	@Column
	private boolean enabled;
	
	@OneToMany(mappedBy="member", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Member_Role> member_roles;

	public Member() {

	}

	public List<Member_Role> getMember_roles() {
		return member_roles;
	}

	public void setMember_roles(List<Member_Role> member_roles) {
		this.member_roles = member_roles;
	}


	public Member(String username, String password) {

		this.username = username;
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

}
