package com.team4.project1.repository;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.team4.project1.domain.BasketVO;

@Repository
public class BasketRepositoryImpl implements BasketRepository {

	private Map<String, BasketVO> listOfBaskets;

	public BasketRepositoryImpl() {
		listOfBaskets = new HashMap<String, BasketVO>();
	}
	
	@Override
	public BasketVO create(BasketVO vo) {
		if (listOfBaskets.keySet().contains(vo.getB_no())) {
			throw new IllegalArgumentException(String.format("장바구니를 생성할 수 없습니다. 장바구니 ID(%)가 존재합니다", vo.getB_no()));
		}

		listOfBaskets.put(vo.getB_no(), vo);
		return vo;
	}

	@Override
	public BasketVO read(String b_no) {
		return listOfBaskets.get(b_no);
	}
}
