package com.bk.tuanpm.webtoeic.controller.client;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.bk.tuanpm.webtoeic.config.MessageConfig;
import com.bk.tuanpm.webtoeic.entities.Remark;
import com.bk.tuanpm.webtoeic.repository.TutorialAdminRepository;
import com.bk.tuanpm.webtoeic.service.GroupService;
import com.bk.tuanpm.webtoeic.service.NotificationService;
import com.bk.tuanpm.webtoeic.service.RemarkService;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;

@Controller
public class RemarkController {

	@Autowired
	GroupService groupService;
	@Autowired
	UserAdminServiceImpl nguoiDungService;
	@Autowired
	TutorialAdminRepository adminRepository;

	@Autowired
	UserAdminServiceImpl userAdminServiceImpl;

	@Autowired
	MessageConfig messageConfig;

	@Autowired
	RemarkService remarkService;

	@Autowired
	NotificationService notificationService;

	@GetMapping("/remark_detail/{idRemark}")
	public String getRemark(Model model, @PathVariable("idRemark") int idRemark) {
		Remark remark = remarkService.getById(idRemark);
		model.addAttribute("remark", remark);
		return "client/remarkDetail";
	}

}
