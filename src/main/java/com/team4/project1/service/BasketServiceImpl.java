package com.team4.project1.service;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.project1.domain.BasketVO;
import com.team4.project1.repository.BasketRepository;

@Service
public class BasketServiceImpl implements BasketService {
	@Autowired
	private BasketRepository basketRepository;
	
	@Override
	public BasketVO create(BasketVO vo) {
		// TODO Auto-generated method stub
		return basketRepository.create(vo);
	}

	@Override
	public BasketVO read(String b_no) {
		// TODO Auto-generated method stub
		return basketRepository.read(b_no);
}
}
