package com.team4.project1.domain;



import lombok.Data;

@Data
public class ProductImageVO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private Long p_no;
	    
	
}
