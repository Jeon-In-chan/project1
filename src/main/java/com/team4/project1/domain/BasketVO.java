package com.team4.project1.domain;

import java.util.Date;

import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BasketVO {

	private String b_no;
	private String u_id;
	private String p_no;
	@Size(min = 1, max = 99999)
	private int quantity;
	@DateTimeFormat(pattern="yyyy/mm/dd")
	private Date b_regDate;
	
	private ProductVO productVO;
	
	private int totalPrice;
	
	public int getTotalPrice() {
		this.totalPrice = this.productVO.getPrice() * this.quantity;
		return totalPrice;
	}
	
	    
}
