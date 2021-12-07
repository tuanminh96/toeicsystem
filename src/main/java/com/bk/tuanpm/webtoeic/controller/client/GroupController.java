package com.bk.tuanpm.webtoeic.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.service.GroupService;

@Controller
public class GroupController {

	@Autowired
	GroupService groupService;

	@GetMapping("/group_detail")
	public String getGroup(Model model) {
		return "client/groupDetail";
	}

	@GetMapping("/list_group")
	public String listGroup(Model model) {
		return "client/listGroup";
	}

	@PostMapping(value = "/addGroup", produces = MediaType.APPLICATION_JSON_VALUE)
	public String addGroup(Model model, @RequestBody Group group) {
		groupService.saveGroup(group);
		return "";
	}
}
