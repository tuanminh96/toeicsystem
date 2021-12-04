package com.bk.tuanpm.webtoeic.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GroupController {

	@GetMapping("/group_detail")
	public String getGroup(Model model) {
		return "client/groupDetail";
	}
}
