package org.adt.controller;

import java.io.*;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

@Controller
@Log4j
@RequestMapping("/upload/*")
public class UploadController {
	
	//에디터 이미지 업로드
	@PostMapping(value = "/imageInput", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> imageInput(@RequestParam("upload") MultipartFile[] uploadFile, HttpSession session){
		log.info("----------------이미지 업로드 시작----------------");
		
		HashMap<String, Object> map = new HashMap<String, Object>();

//		String serverFolder = "C:\\upload";
//		String webFolder = "C:\\upload";
		String serverFolder = "/var/lib/tomcat8/webapps";
		String webFolder = "https://alldonetrip.shop/resources";
		String nonUser = "/img/nonUser/imgUpload/";
		String user = "/img/user/imgUpload/";
		
		//세션값으로 회원인지, 비회원인지 판단
		if(session.getAttribute("email") == null && session.getAttribute("email").equals("")){
			serverFolder = serverFolder+nonUser;
			webFolder = webFolder + nonUser;
		}else {
			serverFolder = serverFolder+user;
			webFolder = webFolder + user;
		}

		//파일 업로드--------
		for(MultipartFile multipartFile : uploadFile) {
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//IE는 파일명이 전체 파일경로로 나와서 파일명만 얻도록 split
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only File Name = " + uploadFileName);
			
			//랜덤문자열 붙이기
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(serverFolder, uploadFileName);
				multipartFile.transferTo(saveFile);
			
				
				//check image type File
				if(checkImageType(saveFile)) {
					//Hashmap에 넣어 값 리턴하기
					map.put("uploaded", 1);	// 1로 고정(업로드 성공 시 1)
					map.put("fileName", uploadFileName);	//파일명
					map.put("url", webFolder+"\\"+uploadFileName);	//업로드경로 + 파일명
					log.info("URL = "+map.get("url"));
				}
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
		log.info("----------------드래그&드롭 업로드 시작----------------");
			
		HashMap<String, Object> map = new HashMap<String, Object>();

//			String serverFolder = "C:\\upload";
//			String webFolder = "C:\\upload";
			String serverFolder = "/var/lib/tomcat8/webapps";
			String webFolder = "https://alldonetrip.shop/resources";
			String nonUser = "/img/nonUser/drag/";
			String user = "/img/user/drag/";
			
			//세션값으로 회원인지, 비회원인지 판단
			if(session.getAttribute("email") == null && session.getAttribute("email").equals("")){
				serverFolder = serverFolder+nonUser;
				webFolder = webFolder + nonUser;
			}else {
				serverFolder = serverFolder+user;
				webFolder = webFolder + user;
			}
			
			//파일 업로드--------
			for(MultipartFile multipartFile : uploadFile) {
				String uploadFileName = multipartFile.getOriginalFilename();
				
				//IE는 파일명이 전체 파일경로로 나와서 파일명만 얻도록 split
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
				log.info("only File Name = " + uploadFileName);
				
				//랜덤문자열 붙이기
				UUID uuid = UUID.randomUUID();
				uploadFileName = uuid.toString() + "_" + uploadFileName;
				
				try {
					File saveFile = new File(serverFolder, uploadFileName);
					multipartFile.transferTo(saveFile);
					
					//check image type File
					if(checkImageType(saveFile)) {
						//Hashmap에 넣어 값 리턴하기
						map.put("uploaded", 1);	// 1로 고정(업로드 성공 시 1)
						map.put("fileName", uploadFileName);	//파일명
						map.put("url", webFolder+"\\"+uploadFileName);	//업로드경로 + 파일명
						log.info("URL = "+map.get("url"));
					}
				} catch (Exception e) {
					e.printStackTrace();
					map.put("uploaded", 0);
					map.put("error", "{'message:'"+e.getMessage()+"'}");
				}
			} // end for
			return new ResponseEntity<>(map, HttpStatus.OK);
		}	
	
	
		//썸네일 이미지 서버에 저장
		@PostMapping(value = "/thumbnail", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<HashMap<String, Object>> thumbnail(@RequestParam("fileName") String fileName, @RequestParam("pData") MultipartFile[] pData){
			log.info("----------------썸네일 업로드 시작----------------");
			
			HashMap<String, Object> map = new HashMap<String, Object>();

			//파일 업로드--------
			if(pData == null){
				return new ResponseEntity<>(map, HttpStatus.NO_CONTENT);
			   }
					
//			String serverFolder = "C:\\upload\\img\\user\\thumbnail\\";
//			String webFolder = "C:\\upload\\img\\user\\thumbnail\\";
			String serverFolder = "/var/lib/tomcat8/webapps/img/user/thumbnail/";
			String webFolder = "https://alldonetrip.shop/resources/img/user/thumbnail/";
			
			for(MultipartFile multipartFile : pData) {	
				try{
					//랜덤문자열 붙이기
					UUID uuid = UUID.randomUUID();
					fileName = uuid.toString() + "_" + fileName;
				
					//서버에 업로드
					File saveFile = new File(serverFolder+fileName);
					multipartFile.transferTo(saveFile);
					
					//Hashmap에 반환 경로넣기
					map.put("thumbnailName", fileName);	//업로드경로 + 파일명
					map.put("url", webFolder+fileName);	//업로드경로 + 파일명
					log.info("URL = "+map.get("url"));
							
				}catch(Throwable e){
					e.printStackTrace(System.out);
				}
			}
			return new ResponseEntity<>(map, HttpStatus.OK);
		}
	
	
		
		
		@PostMapping(value = "/downloadPDF")
		public void downloadPDF(HttpServletRequest request, HttpServletResponse response) {
		 
		    String file_location = "C:\\upload\\img\\";
		    String filename = "교제-Spring_기초.pdf";
		    File file = null;
		    BufferedInputStream fin = null;
		    BufferedOutputStream outs = null;
		 
		    try{
		       
		        file = new File(file_location, filename);
		        response.reset();
		        response.setHeader("Content-Type","application/pdf");
		 
		        if(file != null){
		            fin = new BufferedInputStream(new FileInputStream(file));
		            outs = new BufferedOutputStream(response.getOutputStream());
		 
		            int read = 0;
		 
		            while((read = fin.read()) != -1 ){
		                outs.write(read);
		            }
		        }
		 
		    }catch(Exception e){
		        response.setContentType("text/html;charset=euc-kr");
		        log.info("<script type='text/javascript'>");
		        log.info("alert('파일 오픈 중 오류가 발생하였습니다.');");
		        log.info("</script>");
		    }finally{
		 
		        if(outs != null)
					try {
						fin.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		        if(fin != null)
					try {
						outs.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		 
		    }
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
