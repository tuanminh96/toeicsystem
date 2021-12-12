package com.bk.tuanpm.webtoeic.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bk.tuanpm.webtoeic.dto.MemberDTO;
import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.Admin;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.repository.AdminRepository;
import com.bk.tuanpm.webtoeic.service.GroupService;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;

@Controller
@RequestMapping("/admin")
public class GroupAdminController {

	@Autowired
	GroupService groupService;
	@Autowired
	UserAdminServiceImpl nguoiDungService;
	@Autowired
	AdminRepository adminRepository;

	@PostMapping(value = "/addGroup", produces = MediaType.APPLICATION_JSON_VALUE)
	public String addGroup(Model model, @RequestBody Group group) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Admin currentUser = nguoiDungService.findAdminByEmail(auth.getName());
		System.out.println(currentUser);
		group.setCreateAdmin(currentUser);
		groupService.saveGroup(group);
		
		List<Group> groups = groupService.getGroupOfAdmin(currentUser);
		model.addAttribute("groups", groups);
		return "admin/listGroupAdmin";
	}
	
	@GetMapping("/group_detail/{idGroup}")
	public String getGroup(Model model, @PathVariable Integer idGroup) {
		Group group = groupService.getGroupById(idGroup);
		model.addAttribute("group", group);
		return "admin/groupDetailAdmin";
	}
	
	@GetMapping("/group_detail/listMember/{idGroup}")
	public String getListMemberGroup(Model model, @PathVariable Integer idGroup) {
		List<MemberDTO> members = groupService.getListMember(idGroup);
		model.addAttribute("members", members);
		return "admin/listMember";
	}

}
