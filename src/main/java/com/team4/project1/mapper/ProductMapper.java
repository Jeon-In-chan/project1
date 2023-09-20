package com.team4.project1.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.team4.project1.domain.ProductVO;

public interface ProductMapper {
	
	public void insert(ProductVO productVO);
	
	public void insertSelectKey(ProductVO productVO);
	
	//@Select("select * from product where p_no >0")
	public List<ProductVO> getList();
	
}
