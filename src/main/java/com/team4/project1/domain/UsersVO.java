package com.team4.project1.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UsersVO {
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_p_number;
	private String u_email;
	private String u_address;
	private Date regDate;
	private Date modDate;
}
