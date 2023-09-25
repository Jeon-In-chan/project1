package com.team4.project1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team4.project1.domain.ProductImageVO;
import com.team4.project1.domain.ProductVO;
import com.team4.project1.mapper.ProductImageMapper;
import com.team4.project1.mapper.ProductMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImpl implements ProductService {
	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	@Setter(onMethod_ = @Autowired)
	private ProductImageMapper imageMapper;
	@Override
	public List<ProductVO> getList() {
		log.info("get list");
		return mapper.getList();
	}
	@Transactional
	@Override
	public void register(ProductVO productVO) {
		log.info("register : "+productVO);
		mapper.insertSelectKey(productVO);
		if(productVO.getImageVO() == null || productVO.getImageVO().size() <= 0) {
			return;
		}
		productVO.getImageVO().forEach(image -> {
			image.setP_no(productVO.getP_no());
			imageMapper.insert(image);
			log.info(image);
		});
	}
	
	@Override
	public List<ProductImageVO> getImageList(Long p_no) {
		log.info("get image list by p_no"+p_no);
		return imageMapper.findByp_no(p_no);
	}

}
