package com.team4.project1.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team4.project1.domain.BasketVO;
import com.team4.project1.repository.BasketRepository;
import com.team4.project1.service.BasketService;

@Controller
@RequestMapping("/shoppingBasket")
public class ShoppingBasketController {
	
	@Autowired
	private BasketRepository basketRepository;
	
	@Autowired
	private BasketService basketService;
	
	@GetMapping({"/", ""})
	public void inShoppingBasket() {
		System.out.println("장바구니로 이동");
	}
	
	@GetMapping
	public String requestBasketNumber(HttpServletRequest request) {
		String sessionno = request.getSession(true).getId();
		return "redirect://shoppingBasket/" + sessionno;
	}

	@PostMapping
	public @ResponseBody BasketVO create(@RequestBody BasketVO vo) {
		return basketService.create(vo);
	}

	@GetMapping("/{b_no}")
	public String requestBasketList(@PathVariable("b_no") String b_no, Model model) {
		BasketVO vo = basketService.read(b_no);
		model.addAttribute("vo", vo);
		return "vo";
	}

	@PutMapping("/{b_no}")
	public @ResponseBody BasketVO read(@PathVariable("b_no") String b_no) {
		return basketService.read(b_no);
	}
}
	