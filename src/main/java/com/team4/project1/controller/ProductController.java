package com.team4.project1.controller;

import java.io.File;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.team4.project1.domain.ProductVO;
import com.team4.project1.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/home/*")
@AllArgsConstructor
@MapperScan(basePackages = "com.team4.project1.mapper")
public class ProductController {
	private ProductService productService;
	
	@GetMapping("/product")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", productService.getList());
	}
	
	@GetMapping("/register")
	public void register() {
	}
	@PostMapping("/register")
	public String register(@ModelAttribute("NewProduct") ProductVO productVO,  BindingResult result) {
			if(result.hasErrors()) {
				return "NewProduct";
			}
			MultipartFile image = productVO.getImage();
			String saveName = image.getOriginalFilename();
			File saveFile = new File("C:\\upload", saveName);
			if(image != null && !image.isEmpty()) {
				try {
					image.transferTo(saveFile);
					productVO.setFileName(saveName);
				} catch (Exception e) {
					throw new RuntimeException("이미지 업로드 실패");
				}
			}
			productService.register(productVO);
		return "redirect:/product";
	}
}
