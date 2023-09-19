package com.team4.project1.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BasketVO {

	private String b_no;
	private String u_id;
	private String p_no;
	private int quantity;
	private int price;
	private Date b_regDate;
	private boolean image;
	
	private ProductVO productVO;

}
