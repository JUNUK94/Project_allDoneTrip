package org.adt.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.adt.domain.AttachVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/upload/*")
public class UploadController {

	//에디터 이미지 업로드
	@PostMapping(value = "/imageInput", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> imageInput(@RequestParam("upload") MultipartFile[] uploadFile, HttpSession session, HttpServletRequest request){
		System.out.println("시작한다");
		log.info("----------------이미지 업로드 시작한다~~----------------");
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		System.out.println("일일일일");
		
		String contextPath = request.getContextPath();
		String serverFolder = "/var/lib/tomcat8/webapps";
		String webFolder = "https://alldonetrip.shop/resources";
		String nonUser = "/img/nonUser/imgUpload/";
		String user = "/img/user/imgUpload/";
		
		if(session.getAttribute("email") == null && session.getAttribute("email").equals("")){
			log.info("이이이이이");
			serverFolder = serverFolder+nonUser;
			webFolder = webFolder + nonUser;
		}else {
			log.info("삼삼삼삼");
			serverFolder = serverFolder+user;
			webFolder = webFolder + user;
		}
		log.info("사사사사사");
		String dailyFolder="";
		try {
			log.info("hello!!!!!");
			dailyFolder = (String)getFolder();
			log.info("안녕 = ");
			log.info("dailyFolder = "+dailyFolder);
		} catch (Exception e) {
			log.info(e);
		}
		log.info("오오오오");
		
		//make Folder--------
		File uploadPath = new File(serverFolder, dailyFolder);
		log.info("uploadPath = "+uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		//파일 업로드--------
		for(MultipartFile multipartFile : uploadFile) {
			String uploadFileName = multipartFile.getOriginalFilename();
			
			
			//IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only File Name = " + uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				//check image type File
				if(checkImageType(saveFile)) {
				}
				
				
				//add to Hashmap
				map.put("uploaded", 1);	// 1로 고정(업로드 성공 시 1)
				map.put("fileName", uploadFileName);	//파일명
				map.put("url", webFolder+dailyFolder+"\\"+uploadFileName);	//업로드경로 + 파일명
				log.info("URL = "+map.get("url"));
				
			} catch (Exception e) {
				e.printStackTrace();
				map.put("uploaded", 0);
				map.put("error", "{'message:'"+e.getMessage()+"'}");
			}
		} // end for
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	
	//에디터에 드래그&드롭 한 이미지 서버에 저장
	@PostMapping(value = "/dragImage", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> dragImage(@RequestParam("upload") MultipartFile[] uploadFile, HttpSession session){
		
		log.info("----------------드래그&드롭 업로드 시작한다~~----------------");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String uploadFolder = "";
		
		if(session.getAttribute("email") == null && session.getAttribute("email").equals("")){
			uploadFolder = "/img/nonUser/drag";
		}else {
			uploadFolder = "/img/user/drag";
		}
		
		String uploadFolderPath = getFolder();
		
		//make Folder--------
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		//make yyyy/MM/dd Folder--------
		for(MultipartFile multipartFile : uploadFile) {
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only File Name = " + uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				//check image type File
				if(checkImageType(saveFile)) {
					//add to Hashmap
					map.put("uploaded", 1);	// 1로 고정(업로드 성공 시 1)
					map.put("fileName", uploadFileName);	//파일명
					map.put("url", uploadPath+"\\"+uploadFileName);	//업로드경로 + 파일명
				}
			} catch (Exception e) {
				e.printStackTrace();
				map.put("uploaded", 0);
				map.put("error", "{'message:'"+e.getMessage()+"'}");
			}
		} // end for
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	
	
	//연,월,일로 폴더 만들기
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	
	//파일타입 체크하기
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	
}
