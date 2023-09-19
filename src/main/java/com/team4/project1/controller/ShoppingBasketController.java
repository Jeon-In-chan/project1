package com.team4.project1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shoppingBasket")
public class ShoppingBasketController {
	
	@GetMapping({"/", ""})
	public void inShoppingBasket() {
		System.out.println("장바구니로 이동");
	}
}
	