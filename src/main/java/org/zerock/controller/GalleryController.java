package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/gallery/")
public class GalleryController {
	@RequestMapping(value = "/vege", method = RequestMethod.GET)
	public void vegeGET()throws Exception {
		
	}
}
