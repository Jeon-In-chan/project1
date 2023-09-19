package com.team4.project1.service;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.project1.domain.BasketVO;
import com.team4.project1.mapper.BasketMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class BasketServiceImpl implements BasketService {

	@Setter(onMethod_ = @Autowired)
	private BasketMapper mapper;
	
	@Override
	public List<BasketVO> getList() {
		log.info("basket list");
		return mapper.getList();
}
}
