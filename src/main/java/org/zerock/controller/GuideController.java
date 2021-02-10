package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/guide/")
public class GuideController {
	@RequestMapping(value = "/start", method = RequestMethod.GET)
	public void startGET()throws Exception {
	}
}
