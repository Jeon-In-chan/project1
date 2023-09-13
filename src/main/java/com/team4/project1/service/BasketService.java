package com.team4.project1.service;

import com.team4.project1.domain.BasketVO;

public interface BasketService {
	BasketVO create(BasketVO vo);
	BasketVO read(String b_no);
}
