package com.team4.project1;

import javax.servlet.http.HttpServletRequest;

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
	@GetMapping
	public String requestCartId(HttpServletRequest request) {
		String sessionid = request.getSession(true).getId();
		return "redirect:/mall/" + sessionid;
	}
}
