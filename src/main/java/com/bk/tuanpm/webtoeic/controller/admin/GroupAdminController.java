package com.bk.tuanpm.webtoeic.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.Admin;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.repository.AdminRepository;
import com.bk.tuanpm.webtoeic.service.GroupService;
import com.bk.tuanpm.webtoeic.service.NguoiDungService;

@Controller
@RequestMapping("/admin")
public class GroupAdminController {

	@Autowired
	GroupService groupService;
	@Autowired
	NguoiDungService nguoiDungService;
	@Autowired 
	AdminRepository adminRepository;
	@PostMapping(value = "/addGroup", produces = MediaType.APPLICATION_JSON_VALUE)
	public String addGroup(Model model, @RequestBody Group group) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Admin currentUser = nguoiDungService.findAdminByEmail(auth.getName());
		
		System.out.println(currentUser);

		group.setCreateAdmin(currentUser);
		groupService.saveGroup(group);
		return "admin/quanLyGroup";
	}
}
