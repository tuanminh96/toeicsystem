package com.bk.tuanpm.webtoeic.controller.content;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;
import com.bk.tuanpm.webtoeic.service.GroupService;
import com.bk.tuanpm.webtoeic.service.RoleService;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;

@Controller
@RequestMapping(value = "/content")
public class ContentController {

	@Autowired
	UserAdminServiceImpl nguoiDungService;
	
	@Autowired
	RoleService roleService;
	
	@Autowired
	GroupService groupService;
	
	@ModelAttribute("loggedInUser")
	public Account loggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return nguoiDungService.findByEmail(auth.getName());
	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home() {
		System.out.println("Vao home content");
		return "content/home";
	}
	
	@GetMapping({"/exam"})
	public String quanLyExam(Model model) {
		return "content/quanLyExam";
	}
	
	@GetMapping("/profile")
	public String profilePage(Model model, HttpServletRequest request) {
		model.addAttribute("user", getSessionUser(request));
		return "content/profile";
	}

	@PostMapping("/profile/update")
	public String updateNguoiDung(@ModelAttribute Account nd, HttpServletRequest request) {
		Account currentUser = getSessionUser(request);
		currentUser.setDiaChi(nd.getDiaChi());
		currentUser.setHoTen(nd.getHoTen());
		currentUser.setSoDienThoai(nd.getSoDienThoai());
		nguoiDungService.updateUser(currentUser);
		return "redirect:/content/profile";
	}
	
	public Account getSessionUser(HttpServletRequest request) {
		return (Account) request.getSession().getAttribute("loggedInUser");
		
	}
}
