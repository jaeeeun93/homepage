package org.zerock.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.BoardService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private BoardService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("list", service.listBestCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    
	    pageMaker.setTotalCount(service.listSearchCount(cri));
	    model.addAttribute("pageMaker", pageMaker);
		
		return "index";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat() {
		return "chat";
	}
	
	@RequestMapping(value = "/store/store", method = RequestMethod.GET)
	public String store() {
		return "store/store";
	}
	
	@RequestMapping(value = "/inven", method = RequestMethod.GET)
	public String inven() {
		return "inven";
	}
	
	@RequestMapping(value = "/admin_page", method = RequestMethod.GET)
	public String admin_page() {
		return "admin_page";
	}
}