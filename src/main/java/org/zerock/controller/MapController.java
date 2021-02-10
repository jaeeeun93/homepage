package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/map/*")
public class MapController {

	@RequestMapping(value = "/ricecake_seoul", method = RequestMethod.GET)
	public void ricecake_seoul() {
	}
	
	@RequestMapping(value = "/bakery_seoul", method = RequestMethod.GET)
	public void bakery_seoul() {
	}
	
	@RequestMapping(value = "/cafe_seoul", method = RequestMethod.GET)
	public void cafe_seoul() {
	}
	
	@RequestMapping(value = "/total_seoul", method = RequestMethod.GET)
	public void total_seoul() {
	}
}
