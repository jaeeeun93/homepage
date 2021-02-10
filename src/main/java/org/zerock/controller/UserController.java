package org.zerock.controller;

import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.DmVO;
import org.zerock.domain.LikeVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.ReplyVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.persistence.UserDAO;
import org.zerock.service.BoardService;
import org.zerock.service.DmService;
import org.zerock.service.FollowService;
import org.zerock.service.LikeService;
import org.zerock.service.ReplyService;
import org.zerock.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserDAO dao;
	
	@Inject
	private UserService service;
	
	@Inject
	private ReplyService service2;
	
	@Inject
	private LikeService service3;
	
	@Inject
	private BoardService service4;
	
	@Inject
	private FollowService service5;
	
	@Inject
	private DmService service6;
	
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET()throws Exception {
	}
	
	@PostMapping("/join")
	public String joinPOST(UserVO vo) throws Exception{		
		
		dao.join(vo);
		return "redirect:/";
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/idFind", method = RequestMethod.POST)
	public String idFindPOST(UserVO vo, RedirectAttributes rttr) throws Exception{
		
		String url="";
		String findId = dao.idFind(vo);
		
		if(findId == null) {
			rttr.addFlashAttribute("msg", "이름이나 이메일 정보가 일치하지 않습니다.");
			url= "redirect:/user/aa";
		} else {
			url= "redirect:/user/id_page";
			rttr.addAttribute("id", findId);
		}
		return url;
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/passFind", method = RequestMethod.POST)
	public String passFindPOST(UserVO vo, RedirectAttributes rttr) throws Exception{
		
		String url="";
		String findPass = dao.passFind(vo);
		
		if(findPass == null) {
			rttr.addFlashAttribute("msg", "아이디나 이메일 정보가 일치하지 않습니다.");
			url= "redirect:/user/aa";
		} else {
			url= "redirect:/user/pass_page";
			rttr.addAttribute("pass", findPass);
		}
		return url;
	}
	
	@RequestMapping(value = "/id_page", method = RequestMethod.GET)
	public String id_page(@RequestParam("id") String id) {
		
		return "/user/id_page";
	}
	
	@RequestMapping(value = "/pass_page", method = RequestMethod.GET)
	public String pass_page(@RequestParam("pass") String pass) {
		
		return "/user/pass_page";
	}
	
	
	// 아이디 중복 검사
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	@ResponseBody
	public String idChkPOST(String userid) throws Exception{
		//logger.info("idChkPOST() 진입");
		int result = dao.idChk(userid);
		
		if(result != 0) {
			return "fail";	// 중복 아이디 존재
		} else {
			return "success"; // 중복 아이디 x
		}
	} // memberIdChkPOST() 종료
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET()throws Exception {
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(LoginDTO dto, HttpSession session, HttpServletResponse response, RedirectAttributes rttr) throws Exception {		
		UserVO vo = dao.login(dto);		
		String url="";
		
		
		if (vo != null) {
			session.setAttribute("id", vo.getUserid());	
			session.setAttribute("name", vo.getUsername());
			
			session.getAttribute("id");
			
			logger.info(""+session.getAttribute("id"));
			url= "redirect:/";
		}else {
			rttr.addFlashAttribute("msg", "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
			url= "redirect:/user/aa";
		}
		
		return url;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login2", method = RequestMethod.GET)
	public void login2GET()throws Exception {
	}
	
	@RequestMapping(value = "/find_id", method = RequestMethod.GET)
	public void find_idGET()throws Exception {
	}
	
	@RequestMapping(value = "/mailForm", method = RequestMethod.GET)
	public void mailGET()throws Exception {
	}
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public void joinFormGET()throws Exception {
	}
	
	@RequestMapping(value = "/aa", method = RequestMethod.GET)
	public String errerCommon() {
		return "/error_common";
	}
	
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {
		logger.info("이메일 데이터 전송 확인");
		logger.info("인증번호 : " + email);
		
		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("인증번호 " + checkNum);
		
		/* 이메일 보내기 */
		String setForm = "springphp1993@gmail.com";
		String toMail = email;
		String title = "채식빌런 회원가입 인증 이메일 입니다.";
		String content =
				"방문 감사." + "인증 번호는 " + checkNum + " 입니다." +
				"인증번호 입력하고 가입 ㄱ.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
		    MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		 
		    helper.setFrom(setForm);  // 보내는사람 생략하거나 하면 정상작동을 안함
		    helper.setTo(toMail);     // 받는사람 이메일
		    helper.setSubject(title); // 메일제목은 생략이 가능하다
		    helper.setText(content);  // 메일 내용
		     
		    mailSender.send(message);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		String num = Integer.toString(checkNum);
		
		return num;
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	@ResponseBody
	public String testGET() throws Exception {
		
		String num = "aa";
		return num;
	}
	
	
	/*
	 * //회원 수정 페이지 이동
	 * 
	 * @RequestMapping(value = "/user_modify", method = RequestMethod.GET) public
	 * void user_modifyGET(HttpSession session, Model model) throws Exception {
	 * 
	 * String id = (String) session.getAttribute("id");
	 * 
	 * model.addAttribute("user",service.read(id)); }
	 */
	
	//회원 정보
	@RequestMapping(value = "/user_info", method = RequestMethod.GET)
	public void user_infoGET(HttpSession session, Model model, HttpServletRequest httpServletRequest, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		
		String id = httpServletRequest.getParameter("id");
		String id2 = (String) session.getAttribute("id");
		
		System.out.println("클릭된 아이디 : "+id);
		System.out.println("세션아이디 : "+id2);
		
		int following_check = 0;	// 팔로우한 사람인지 아닌지 체크
		int post_count = 0;			// 회원별 쓴 게시글 수 체크
		int is_member = 0;			// 회원인지 비회원인지
		
		cri.setId(id);
		
		List<ReplyVO> list = service2.read_reply(cri);
		List<LikeVO> list2 = service3.read_like(cri);
		
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	    pageMaker.setTotalCount(service2.listReplyCount(cri));
	    
	    model.addAttribute("pageMaker", pageMaker);
		
		following_check = service5.following_check(id,id2); 
		post_count = service4.post_count(id);
		is_member = service.is_member(id);
		
		System.out.println(following_check);
	    System.out.println(list);

	    model.addAttribute("check", following_check);
	    model.addAttribute("post", post_count);
	    model.addAttribute("is_member", is_member);
	    model.addAttribute("click", id);
	    
	    model.addAttribute("info",service.read(id));
		model.addAttribute("reply", list);
		model.addAttribute("like", list2);
		
		model.addAttribute("follower_list", service5.follower_list(id));
		model.addAttribute("following_list", service5.following_list(id));
	}
	
	// 팔로우하기
	@ResponseBody
	@RequestMapping(value = "/follow", method = RequestMethod.POST)
	public ResponseEntity<String> follow(HttpSession session, @RequestBody UserVO vo) {
		
		ResponseEntity<String> entity = null;
	    String resultMsg="";
	    int follow_check = 0;
	    
		System.out.println("팔로우할 사람 아이디 : " + vo.getFollowing_num());
		
		try {
	    	logger.info("팔로잉한 사람 아이디 : " + session.getAttribute("id") );
	    	vo.setFollower_num((String) session.getAttribute("id"));

	    	follow_check = service5.follow_check(vo);
	    	System.out.println(follow_check);
	    	
	    	if (follow_check == 0) {
	    		service5.add_follow(vo);
	    		service.updateFollowerNum(vo);
		    	service.updateFollowingNum(vo);
		    	entity = new ResponseEntity<String>("success", HttpStatus.OK);
	    	}
	    	
	    } catch (Exception e) {
	    	
	    	e.printStackTrace();
	    	entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); //400에러
	    }
	    return entity;
	}
	
	// 팔로우 취소하기
	@ResponseBody
	@RequestMapping(value = "/unfollow", method = RequestMethod.POST)
	public ResponseEntity<String> unfollow(HttpSession session, @RequestBody UserVO vo) {
		
		ResponseEntity<String> entity = null;
	    String resultMsg="";
	    int follow_check = 0;
	    
		System.out.println("언팔로우할 사람 아이디 : " + vo.getFollowing_num());
		
		try {
	    	logger.info("언팔로잉한 사람 아이디 : " + session.getAttribute("id") );
	    	vo.setFollower_num((String) session.getAttribute("id"));

	    	
			service5.minus_follow(vo);
			service.minusFollowerNum(vo);
	    	service.minusFollowingNum(vo);
	    	entity = new ResponseEntity<String>("success", HttpStatus.OK);
	    	
	    } catch (Exception e) {
	    	
	    	e.printStackTrace();
	    	entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); //400에러
	    }
	    return entity;
	}
	
	
	
	// dm보내기 클릭
	@RequestMapping(value = "/dm", method = RequestMethod.GET)
	public void dmGET(HttpSession session, Model model, HttpServletRequest httpServletRequest)throws Exception {
		
		String to_id = httpServletRequest.getParameter("following");
		System.out.println("dm 받는 사람 : "+to_id);

		String from_id = (String) session.getAttribute("id");
		System.out.println("dm 보내는 사람 : "+from_id);
		
		Integer following_list_count = service6.following_list_count(from_id, to_id);
		
		System.out.println(following_list_count);
		
		if (following_list_count == 0) {
			service6.addDm(from_id, to_id);
		}
		
		//DM 눌렀을 때 팔로잉 목록 출력
		List<DmVO> list = service6.following_list(from_id);
		model.addAttribute("following_list", list);

		//DM 보낸 내용 출력, 시간 등
		List<DmVO> list2 = service6.context_all(from_id, to_id);
		
		//내 프로필 사진 출력
		String profile = service.getProfile(from_id);
		
		//다른사람 프로필 사진 출력
		String profile_other = service.getProfileOther(to_id);
		
		
		model.addAttribute("dm_all", list2);
		model.addAttribute("to_id", to_id);
		model.addAttribute("profile", profile);
		model.addAttribute("other", profile_other);
	}
	
	// 헤더에 dm 클릭
	@RequestMapping(value = "/dm_main", method = RequestMethod.GET)
	public void dm_mainGET(HttpSession session, Model model, HttpServletRequest httpServletRequest)throws Exception {
		
		String to_id = httpServletRequest.getParameter("following");
		System.out.println("dm 받는 사람 : "+to_id);

		String from_id = (String) session.getAttribute("id");
		System.out.println("dm 보내는 사람 : "+from_id);
		
		Integer following_list_count = service6.following_list_count(from_id, to_id);
		
		System.out.println(following_list_count);
		
		//DM 눌렀을 때 팔로잉 목록 출력
		List<DmVO> list = service6.following_list(from_id);
		model.addAttribute("following_list", list);

		//DM 보낸 내용 출력, 시간 등
		List<DmVO> list2 = service6.context_all(from_id, to_id);
		
		//내 프로필 사진 출력
		String profile = service.getProfile(from_id);
		
		//다른사람 프로필 사진 출력
		String profile_other = service.getProfileOther(to_id);
		
		
		model.addAttribute("dm_all", list2);
		model.addAttribute("to_id", to_id);
		model.addAttribute("profile", profile);
		model.addAttribute("other", profile_other);
	}
}
