package com.team4.project1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShoppingBasketController {
	
	@RequestMapping("/shoppingBasket")
	public void inShoppingBasket() {
		System.out.println("장바구니로 이동");
	}
}
