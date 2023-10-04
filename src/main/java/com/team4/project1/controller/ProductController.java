package com.team4.project1.controller;


import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.team4.project1.domain.ProductImageVO;
import com.team4.project1.domain.ProductVO;
import com.team4.project1.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/home/*")
@AllArgsConstructor
public class ProductController {
	
	private ProductService productService;
	
	@GetMapping("/list")
	public void list(Model model, Long p_no) {
		log.info("list");
		model.addAttribute("p_no", productService.getP_no(p_no));
		model.addAttribute("list", productService.getList());
	}

	
	@GetMapping("/register")
//	@PreAuthorize("isAuthenticated()")
	public void register() {
	}
	@PostMapping("/register")
	@PreAuthorize("permitAll")
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
		
	@GetMapping(value = "/getImageList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProductImageVO>> getImageList(Long p_no) {
		log.info("getImageList : "+p_no);
		return new ResponseEntity<>(productService.getImageList(p_no), HttpStatus.OK);
	}
	
}
