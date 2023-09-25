package com.team4.project1.mapper;

import java.util.List;


import com.team4.project1.domain.ProductImageVO;

public interface ProductImageMapper {
	public void insert(ProductImageVO vo);

	public void delete(String uuid);

	public List<ProductImageVO> findByp_no(Long p_no);

	public void deleteAll(Long p_no);

	public List<ProductImageVO> getOldFiles();

}
