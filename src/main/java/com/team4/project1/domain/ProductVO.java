package com.team4.project1.domain;

import java.util.Date;
import java.util.List;



import lombok.Data;

@Data
public class ProductVO {
		private Long p_no;
		private String p_name;
		private String p_type;
		private String p_producer;
		private Long p_size;
		private int price;
		private String p_content;
		private Long stock;
		private String sale;
		private Date regdate;
		
		private List<ProductImageVO> imageVO;
		
}
