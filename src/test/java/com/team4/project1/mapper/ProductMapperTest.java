package com.team4.project1.mapper;


import org.junit.Test;

import lombok.extern.log4j.Log4j;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductMapperTest {

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(product -> log.info(product));
	}
}
