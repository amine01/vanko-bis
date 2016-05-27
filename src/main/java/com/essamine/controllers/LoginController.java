package com.essamine.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(Model model) {
		return "user/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET, params = "error")
	public String loginPageError(Model model) {
		return "user/login";
	}

}
