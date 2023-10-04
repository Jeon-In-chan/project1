package com.team4.project1.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team4.project1.domain.BasketVO;
import com.team4.project1.domain.ProductVO;
import com.team4.project1.service.BasketService;

@Controller
@RequestMapping("/home/*")
public class ShoppingBasketController {
	
	
	@Autowired
	private BasketService basketService;
	
	@GetMapping({"/shoppingBasket", "/shoppingBasket/"})
	public void inShoppingBasket(@PathVariable("b_no") String b_no,Model model) {
		System.out.println("장바구니로 이동");
		BasketVO vo = basketService.read(b_no);

		model.addAttribute("list", basketService.getList());
	}
	


}
	