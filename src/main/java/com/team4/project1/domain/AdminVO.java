package com.team4.project1.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AdminVO {
	private String a_id;
	private String a_pw;
	private String a_name;
	private String a_p_number;
	private String a_email;
	private String a_authority;
	private Date regDate;
	private Date modDate;
}
