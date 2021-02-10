package org.zerock.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.UserVO;
import org.zerock.persistence.UserDAO;
import org.zerock.service.UserService;
import org.zerock.util.MediaUtils;
import org.zerock.util.UploadFileUtils;

@Controller

public class UploadController {

	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	// 첨부파일 저장 경로

	// servlet-context.xml에 있는 bean id="uploadPath" 경로 매칭
	
	@Inject
	private UserDAO dao;
	
	@Inject
	private UserService service;
	
	@Resource(name = "uploadPath")

	private String uploadPath;
	
	
	

	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)

	public void uploadForm() {



	}

	

	//한글 파일 이름이 깨진다면 web.xml에 한글 처리용 필터를 적용

	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)

	public String uploadForm(MultipartFile file, Model model) throws Exception {



		logger.info("originalName: " + file.getOriginalFilename());

		logger.info("size: " + file.getSize());

		logger.info("contentType: " + file.getContentType());		



		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());



		model.addAttribute("savedName", savedName);		



		return "uploadResult";

	}

	

	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)

	public void uploadAjax(HttpSession session, Model model) throws Exception {		
		
		String id = (String)session.getAttribute("id");
		
		UserVO vo = service.userInfo(id);
		
		model.addAttribute("info", vo);

	}

	

	// @ResponseBody : 요청이 온 데이터(JSON, XML)가 그대로 전송될 것임을 명시한다.

	@ResponseBody

	@RequestMapping(value ="/uploadAjax", 

					method=RequestMethod.POST, 

					produces = "text/plain;charset=UTF-8")

	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{	    



		logger.info("originalName: " + file.getOriginalFilename());

		logger.info("size: " + file.getSize());

		logger.info("contentType: " + file.getContentType());		



		//return new ResponseEntity<>(file.getOriginalFilename(),HttpStatus.CREATED);

		// HttpStatus.OK, HttpStatus.CREATED 정상적으로 생성되었다는 상태 코드

		return new ResponseEntity<>(

				UploadFileUtils.uploadFile(uploadPath, 

					file.getOriginalFilename(), 

					file.getBytes()), 

					HttpStatus.CREATED);

	}

	

	// UUID 중복되지 않는 고유한 키 값을 설정할 때 사용

	// uploadFile()은 원본 파일의 이름과 파일 데이터를 byte[]로 변환한 정보를 파라미터로 처리해서 실제로 파일 업로드한다.

	private String uploadFile(String originalName, byte[] fileData) throws Exception {

		UUID uid = UUID.randomUUID();

		

		String savedName = uid.toString() + "_" + originalName;

		

		// import java.io.File;

		File target = new File(uploadPath, savedName);

		FileCopyUtils.copy(fileData, target);



		return savedName;

	}

	

	// 파일 화면 출력 부분

	@ResponseBody

	@RequestMapping("/displayFile")

	public ResponseEntity<byte[]> displayFile(String fileName, HttpSession session)throws Exception{



		InputStream in = null; 

		ResponseEntity<byte[]> entity = null;	    

		session.setAttribute("profile", fileName);

		logger.info("FILE NAME: " + fileName);	    



		try{     

			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);

			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath+fileName);



			if(mType != null){

				headers.setContentType(mType);

			}else{

				fileName = fileName.substring(fileName.indexOf("_")+1);       

				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

				headers.add("Content-Disposition", "attachment; filename=\""+ 

					new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");

			}



			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 

					headers, 

					HttpStatus.CREATED);

		}catch(Exception e){

			e.printStackTrace();

			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);

		}finally{

			in.close();

		}

		

		return entity;    

	}	

	

	// 첨부파일 삭제 

	@ResponseBody

	@RequestMapping(value = "/deleteFile", method=RequestMethod.POST)

	public ResponseEntity<String> deleteFile(String fileName){

		logger.info("delete file: " + fileName);

		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);

		MediaType mType = MediaUtils.getMediaType(formatName);

		if(mType != null) {

			String front = fileName.substring(0, 12);

			String end = fileName.substring(14);

			

			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();

		}

		

		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);

	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String registPOST(UserVO vo, RedirectAttributes rttr, HttpSession session) throws Exception {
		System.out.println("프로필" + session.getAttribute("profile"));
		String profile = (String)session.getAttribute("profile");
		String id = (String)session.getAttribute("id");
		vo.setProfile(profile);
		vo.setUserid(id);
		
		service.modify(vo);
		
		rttr.addFlashAttribute("msg", "modify-success");
		return "redirect:/uploadAjax";
	}

}