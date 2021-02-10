package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.LikeVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.PhotoVo;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.BoardService;

@Controller
@RequestMapping("/sboard/*")
public class SearchBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);
	
	@Inject
	private BoardService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;

	//@ModelAttribute("cri")를 사용함으로써 cri객체를 list.jsp에 자동 전달 처리된다.
	//@ModelAttribute("cri")을 SearchCriteria cri에 담는다. 
	//그래서 @ModelAttribute("cri") 생략가능
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {


	    //model.addAttribute("list", service.listCriteria(cri));
	    model.addAttribute("list", service.listSearchCriteria(cri));

	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	    //pageMaker.setTotalCount(service.listCountCriteria(cri));
	    pageMaker.setTotalCount(service.listSearchCount(cri));

	    model.addAttribute("pageMaker", pageMaker);
	  }
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET() throws Exception {
	}



	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr, HttpSession session) throws Exception {

		
		System.out.println("가져온 src "+ board.getSrc());
		String src = (String)session.getAttribute("src");
		System.out.println("세션 저장값" + src );
		
		board.setSrc(src);
		
		System.out.println("업데이트 src" + board.getSrc());

		service.regist(board);

		rttr.addFlashAttribute("msg", "write-success");

		return "redirect:/sboard/list";

	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(BoardVO board, SearchCriteria cri, RedirectAttributes rttr, HttpSession session) throws Exception {

		System.out.println("가져온 src "+ board.getSrc());
		String src = (String)session.getAttribute("src");
		System.out.println("세션 저장값" + src );
		
		board.setSrc(src);
		
		System.out.println("업데이트 src" + board.getSrc());
		
		service.modify(board);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/sboard/list";
	}
	
	
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model, LikeVO vo) throws Exception {
		model.addAttribute("read",service.read(bno));
	}
	
	


	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("modify",service.read(bno));
	}

	@RequestMapping(value = "/removePage", method = RequestMethod.GET)

	public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

		service.remove(bno);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/sboard/list";

	}
	// 수정 자리
	
	
	// 추가

	@RequestMapping(value = "test", method = RequestMethod.GET)

	public void ajaxTest() {

		

	}
	
	//단일파일업로드
    @RequestMapping("/photoUpload.do")
    public String photoUpload(HttpServletRequest request, PhotoVo vo) throws Exception{
        String callback = vo.getCallback();
        String callback_func = vo.getCallback_func();
        String file_result = "";
        try {
            if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
                //파일이 존재하면
                String original_name = vo.getFiledata().getOriginalFilename();
                String ext = original_name.substring(original_name.lastIndexOf(".")+1);
                //파일 기본경로
                String defaultPath = uploadPath + File.separator;
                //파일 기본경로 _ 상세경로
                String path = defaultPath;
                File file = new File(path);
                System.out.println("단일 path:"+path);
                //디렉토리 존재하지 않을경우 디렉토리 생성
                if(!file.exists()) {
                    file.mkdirs();
                }
                //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
                String realname = UUID.randomUUID().toString() + "." + ext;
                ///////////////// 서버에 파일쓰기 ///////////////// 
                vo.getFiledata().transferTo(new File(path+realname));
                file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resources/imgUpload/"+realname;
                } else {
                	file_result += "&errstr=error";
                	}
            } catch (Exception e) {
            	e.printStackTrace();
        	}
        return "redirect:" + callback + "?callback_func="+callback_func+file_result;
        }

	  //다중파일업로드
	    @ResponseBody
	    @RequestMapping("/multiplePhotoUpload.do")
	    public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response, HttpSession session){
	       
	    	try {
	             //파일정보
	             String sFileInfo = "";
	             //파일명을 받는다 - 일반 원본파일명
	             String filename = request.getHeader("file-name");
	             //파일 확장자
	             String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	             //확장자를소문자로 변경
	             filename_ext = filename_ext.toLowerCase();
	             //파일 기본경로
	             String dftFilePath = request.getSession().getServletContext().getRealPath("/") + "resources" + File.separator + "imgUpload"  + File.separator;
	             String dftFilePath2 = uploadPath + File.separator;
	             //파일 기본경로 _ 상세경로

	             String filePath = dftFilePath;
	             String filePath2 = dftFilePath2;
	             
	             
	             File file = new File(filePath);
	             File file2 = new File(filePath2);

	             if(!file.exists()) {
	                file.mkdirs();
	             }
	             String realFileNm = "";
	             SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	             String today= formatter.format(new java.util.Date());
	             realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	             String rlFileNm = filePath + realFileNm;
	             String rlFileNm2 = filePath2 + realFileNm;
	             
	             ///////////////// 서버에 파일쓰기 ///////////////// 
	             InputStream is = request.getInputStream();
	             OutputStream os=new FileOutputStream(rlFileNm);
	             OutputStream os2=new FileOutputStream(rlFileNm2);
	             int numRead;
	             byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	             while((numRead = is.read(b,0,b.length)) != -1){
	                os.write(b,0,numRead);
	                os2.write(b,0,numRead);
	             }
	             if(is != null) {
	                is.close();
	             }
	             os.flush();
	             os.close();
	             os2.flush();
	             os2.close();
	             ///////////////// 서버에 파일쓰기 /////////////////
	             // 정보 출력
	             sFileInfo += "&bNewLine=true";
	             // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	             sFileInfo += "&sFileName="+ filename;
	             sFileInfo += "&sFileURL=/imgUpload/"+realFileNm;
	             
	             System.out.println("업로드 "+realFileNm);
	             session.setAttribute("src", "/imgUpload/"+realFileNm);
	             System.out.println("세션 값 "+session.getAttribute("src"));
	             
	             PrintWriter print = response.getWriter();
	             print.print(sFileInfo);
	             print.flush();
	             print.close();
	             
	             
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }	
}