package com.bk.tuanpm.webtoeic.controller.admin;

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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.Admin;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.service.GroupService;
import com.bk.tuanpm.webtoeic.service.RoleService;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;

@Controller
@RequestMapping("/admin")
@SessionAttributes("loggedInUser")
public class AdminController {

	
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

//	@GetMapping()
//	public String adminPage() {
//		return "admin/homepage";
//	}
	
	@GetMapping({"/exam", ""})
	public String quanLyExam(Model model) {
		return "admin/quanLyExam";
	}
	@GetMapping({"/group"})
	public String quanLyGroup(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Admin currentUser = nguoiDungService.findAdminByEmail(auth.getName());
		List<Group> groups = groupService.getGroupOfAdmin(currentUser);
		model.addAttribute("groups", groups);
		return "admin/quanLyGroup";
	}
	@GetMapping("/tai-khoan")
	public String quanLyTaiKhoan(Model model) {
	    model.addAttribute("listVaiTro", roleService.getListRoles());
		return "admin/quanLyTaiKhoan";
	}
	
	@GetMapping("/profile")
	public String profilePage(Model model, HttpServletRequest request) {
		model.addAttribute("user", getSessionUser(request));
		return "admin/profile";
	}

	@PostMapping("/profile/update")
	public String updateNguoiDung(@ModelAttribute Account nd, HttpServletRequest request) {
		Account currentUser = getSessionUser(request);
		currentUser.setDiaChi(nd.getDiaChi());
		currentUser.setHoTen(nd.getHoTen());
		currentUser.setSoDienThoai(nd.getSoDienThoai());
		nguoiDungService.updateUser(currentUser);
		return "redirect:/admin/profile";
	}
	
	public Account getSessionUser(HttpServletRequest request) {
		return (Account) request.getSession().getAttribute("loggedInUser");
		
	}

}
