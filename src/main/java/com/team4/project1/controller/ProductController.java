package com.team4.project1.controller;

import java.io.File;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team4.project1.domain.ProductVO;
import com.team4.project1.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.net.aso.p;

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
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {
	}
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(ProductVO productVO, RedirectAttributes attributes, @RequestParam("p_type") String p_type, @RequestParam("p_size") Long p_size) {
		log.info("========================================================");
		log.info("register: " + productVO);
		if(productVO.getImageVO() != null) {
			productVO.getImageVO().forEach(image -> log.info(image));
		}
		log.info("=========================================================");
		productService.register(productVO);
		productVO.setP_type(p_type);
		productVO.setP_size(p_size);
		attributes.addFlashAttribute("result", productVO.getP_no()); //일회성
		return "redirect:/home/product";
		
	}
		
}
