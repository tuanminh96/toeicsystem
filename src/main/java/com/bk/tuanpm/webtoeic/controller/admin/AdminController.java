package com.bk.tuanpm.webtoeic.controller.admin;

import java.util.List;
import java.util.stream.Collectors;

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
import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.service.BaiThiThuService;
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
	
	@Autowired
	BaiThiThuService baiThiThuService;

	@ModelAttribute("loggedInUser")
	public Account loggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return nguoiDungService.findByEmail(auth.getName());
	}

	@GetMapping({ "/exam"})
	public String quanLyExam(Model model) {
		return "admin/quanLyExam";
	}

	@GetMapping("")
	public String home(Model model) {
		long totalUsers = nguoiDungService.getTotalUser();
		long userVip = nguoiDungService.getTotalVip();
		long totalGroup = groupService.getTotalGroup();
		long totalExam = baiThiThuService.getTotalExam();
		model.addAttribute("totalUsers", totalUsers);
		model.addAttribute("userVip", userVip);
		model.addAttribute("totalGroup", totalGroup);
		model.addAttribute("totalExam", totalExam);
		return "admin/home";
	}

	@GetMapping({ "/group" })
	public String quanLyGroup(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		TutorialAdmin currentUser = nguoiDungService.findTutorialAdminByEmail(auth.getName());
		List<Group> groups = groupService.getGroupOfAdmin(currentUser);
		List<Group> displayGroup =  groups.stream().filter(g -> g.getDelFlag() == 0).collect(Collectors.toList());
		model.addAttribute("groups", displayGroup);
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
