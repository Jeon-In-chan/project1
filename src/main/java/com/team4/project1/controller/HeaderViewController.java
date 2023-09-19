package com.team4.project1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mall")
public class HeaderViewController {
	
	@GetMapping("/header")
	public String headertest() {
		return "/header/header";
	}
}
