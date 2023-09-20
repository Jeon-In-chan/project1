package com.team4.project1.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ProductVO {
		private Long p_no;
		private String p_name;
		private String p_type;
		private String p_producer;
		private Long p_size;
		private int price;
		private String p_content;
		private String image;
		private Long stock;
		private String sale;
		private Date regdate;
		private String fileName;
}
