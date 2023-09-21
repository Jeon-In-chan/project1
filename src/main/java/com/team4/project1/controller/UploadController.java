package com.team4.project1.controller;

import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.team4.project1.domain.UploadResultDTO;

import lombok.extern.log4j.Log4j;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@RestController
@Log4j
public class UploadController {
	
	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}

	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		String uploadFolder = "c:\\upload";

		for (MultipartFile multipartFile : uploadFile) {
			log.info("-----------------------------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());

			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}

		}
	}

	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload Ajax");
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<UploadResultDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("upload ajax post..................");

		List<UploadResultDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";
		String uploadFolderPath = getFolder();

		// make folder-------------
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("upload path: " + uploadPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		// make yyyy/MM/dd-------------

		for (MultipartFile multipartFile : uploadFile) {
			UploadResultDTO uploadResultDTO = new UploadResultDTO();

			log.info("-----------------------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());

			String uploadFileName = multipartFile.getOriginalFilename();

			uploadResultDTO.setFileName(uploadFileName);

			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

			String extensionName = uploadFileName.substring(uploadFileName.lastIndexOf("."));
			String pureFileName = uploadFileName.substring(0, uploadFileName.lastIndexOf("."));

			log.info("only file name: " + uploadFileName);

			UUID uuid = UUID.randomUUID();

			uploadFileName = pureFileName + "_" + uuid.toString() + extensionName;

//			File saveFile = new File(uploadFolder, uploadFileName);
			File saveFile = new File(uploadPath, uploadFileName);

			try {
				multipartFile.transferTo(saveFile);

				uploadResultDTO.setUuid(uuid.toString());
				uploadResultDTO.setUploadPath(uploadFolderPath);
				// check image type file
				if (checkImageType(saveFile)) {

					uploadResultDTO.setImage(true);

					FileOutputStream thumbnail = new FileOutputStream(
							new File(uploadPath, pureFileName + "_" + uuid.toString() + "_s" + extensionName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
				}
				// add to list
				list.add(uploadResultDTO);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("fileName: "+fileName);
		File file = new File("C:\\upload\\" + fileName);
		log.info("file: "+file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFileFile(@RequestHeader("User-Agent")String userAgent, String fileName) {
		log.info("fileName: "+fileName);
		
		Resource resource = new FileSystemResource("C:\\upload\\" + fileName);
		log.info("resource: "+resource);
		
		String resourceName = resource.getFilename();
		
		String extensionName = resourceName.substring(resourceName.lastIndexOf("."));
		String resourceOriginalName = resourceName.substring(0, resourceName.lastIndexOf("_")) + extensionName;

		HttpHeaders headers = new HttpHeaders();
		
		try {
			String downloadName = null;
			if(userAgent.contains("Trident")) {
				log.info("IE browser");
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replace("\\+", " ");
			} else if(userAgent.contains("Edge")) {
				log.info("Edge browser");
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
			} else {
				log.info("Chrome browser");
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}
			log.info("downloadName: "+downloadName);
			
			headers.add("Content-Disposition", "attachment; fileName="+ new String(resourceName.getBytes("UTF-8"), "ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		log.info("deleteFile: " + fileName);
		
		File file;
		
		try {
			fileName = "C:\\upload\\"+ URLDecoder.decode(fileName, "UTF-8");
		//	file = new File("C:\\upload\\"+ URLDecoder.decode(fileName, "UTF-8"));
			file = new File(fileName);
			file.delete();
			if(type.equals("image")) {
				String extensionName = fileName.substring(fileName.lastIndexOf("."));
				String largeFileName = fileName.substring(0, fileName.lastIndexOf(".")-2)+extensionName;
			//	String largeFileName = file.getAbsolutePath().replace("_s", "");
				log.info("LargeFileName: " +largeFileName);
				
			//	file = new File("C:\\upload\\"+URLDecoder.decode(largeFileName, "UTF-8"));
				file = new File(largeFileName);
				file.delete();

			}
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}

	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
}
