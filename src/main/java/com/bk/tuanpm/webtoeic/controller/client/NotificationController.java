package com.bk.tuanpm.webtoeic.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.service.GroupService;

@Controller
public class NotificationController {

	@Autowired
	GroupService groupService;

	@GetMapping("/listnoti/{idMember}")
	public String getNotficationForUser(Model model, @PathVariable Integer idMember) {
		return "client/notifications";
	}
	
	@GetMapping("/detailnoti/{idNoti}")
	public String getDetailNotfication(Model model, @PathVariable Integer idNoti) {
		return "client/notificationDetail";
	}

}
