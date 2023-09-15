package com.team4.project1.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


public class ProductVO {
		private Long p_no;
		private String p_name;
		private String p_type;
		private String p_producer;
		private Long p_size;
		private Long price;
		private String p_content;
		private MultipartFile image;
		private Long stock;
		private String sale;
		private Date regdate;
		public Long getP_no() {
			return p_no;
		}
		public void setP_no(Long p_no) {
			this.p_no = p_no;
		}
		public String getP_name() {
			return p_name;
		}
		public void setP_name(String p_name) {
			this.p_name = p_name;
		}
		public String getP_type() {
			return p_type;
		}
		public void setP_type(String p_type) {
			this.p_type = p_type;
		}
		public String getP_producer() {
			return p_producer;
		}
		public void setP_producer(String p_producer) {
			this.p_producer = p_producer;
		}
		public Long getP_size() {
			return p_size;
		}
		public void setP_size(Long p_size) {
			this.p_size = p_size;
		}
		public Long getPrice() {
			return price;
		}
		public void setPrice(Long price) {
			this.price = price;
		}
		public String getP_content() {
			return p_content;
		}
		public void setP_content(String p_content) {
			this.p_content = p_content;
		}
		public MultipartFile getImage() {
			return image;
		}
		public void setImage(MultipartFile image) {
			this.image = image;
		}
		public Long getStock() {
			return stock;
		}
		public void setStock(Long stock) {
			this.stock = stock;
		}
		public String getSale() {
			return sale;
		}
		public ProductVO(Long p_no, String p_name, Long price) {
			super();
			this.p_no = p_no;
			this.p_name = p_name;
			this.price = price;
		}
		public void setSale(String sale) {
			this.sale = sale;
		}
		public Date getRegdate() {
			return regdate;
		}
		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}
		public ProductVO() {
			super();
			// TODO Auto-generated constructor stub
		}
		
}
