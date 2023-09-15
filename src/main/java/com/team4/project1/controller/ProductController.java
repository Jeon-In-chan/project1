package com.team4.project1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team4.project1.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/home/*")
@AllArgsConstructor
public class ProductController {
	private ProductService productService;
	
	@GetMapping("/product")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", productService.getList());
	}
}
