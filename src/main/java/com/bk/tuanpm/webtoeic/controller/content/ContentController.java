package com.bk.tuanpm.webtoeic.controller.content;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/content")
public class ContentController {

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home() {
		System.out.println("Vao home content");
		return "content/home";
	}
}
