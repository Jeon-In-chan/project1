package com.team4.project1.repository;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.team4.project1.domain.ProductVO;

public interface ProductRepository {
	 List<ProductVO> getAllProductList();
	 List<ProductVO> getProductListByCategory(String category);
	 Set<ProductVO> getBookListByFilter(Map<String, List<String>> filter);
	 ProductVO getProductByNo(Long p_no);
	 void setNewProdict(ProductVO vo);
	 void setUpdateProduct(ProductVO vo);
	 void setDeleteProduct(String p_no);
}
