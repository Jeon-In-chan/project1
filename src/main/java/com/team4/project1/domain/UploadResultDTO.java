package com.team4.project1.domain;


import lombok.Data;
@Data
public class UploadResultDTO {
	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;

}
