package com.team4.project1.repository;

import com.team4.project1.domain.BasketVO;

public interface BasketRepository {
	BasketVO create(BasketVO vo);
	BasketVO read(String b_no);
}
