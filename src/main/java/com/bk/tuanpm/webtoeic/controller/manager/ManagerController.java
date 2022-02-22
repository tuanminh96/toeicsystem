package com.bk.tuanpm.webtoeic.controller.manager;

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
import org.springframework.web.bind.annotation.RequestMethod;

import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.service.BaiThiThuService;
import com.bk.tuanpm.webtoeic.service.GroupService;
import com.bk.tuanpm.webtoeic.service.RoleService;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {
	
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
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home(Model model) {
		long totalUsers = nguoiDungService.getTotalUser();
		long userVip = nguoiDungService.getTotalVip();
		long totalGroup = groupService.getTotalGroup();
		long totalExam = baiThiThuService.getTotalExam();
		model.addAttribute("totalUsers", totalUsers);
		model.addAttribute("userVip", userVip);
		model.addAttribute("totalGroup", totalGroup);
		model.addAttribute("totalExam", totalExam);
		return "manager/home";
	}
	
	@GetMapping("/tai-khoan")
	public String quanLyTaiKhoan(Model model) {
		model.addAttribute("listVaiTro", roleService.getListRoles());
		return "manager/quanLyTaiKhoan";
	}

	@GetMapping("/profile")
	public String profilePage(Model model, HttpServletRequest request) {
		model.addAttribute("user", getSessionUser(request));
		return "manager/profile";
	}

	@PostMapping("/profile/update")
	public String updateNguoiDung(@ModelAttribute Account nd, HttpServletRequest request) {
		Account currentUser = getSessionUser(request);
		currentUser.setDiaChi(nd.getDiaChi());
		currentUser.setHoTen(nd.getHoTen());
		currentUser.setSoDienThoai(nd.getSoDienThoai());
		nguoiDungService.updateUser(currentUser);
		return "redirect:/manager/profile";
	}
	
	@GetMapping({ "/exam-approve"})
	public String quanLyExamApprove(Model model) {
		System.out.println("Vao quanLyExamApprove");
		return "manager/quanLyExamApprove";
	}
	
	@GetMapping("/group-approve") 
	public String quanLyGroup(Model model) {
		List<Group> groups = groupService.getListTotalGroup();
		
		model.addAttribute("groups", groups);
		return "manager/quanLyGroup";
		
	}

	public Account getSessionUser(HttpServletRequest request) {
		return (Account) request.getSession().getAttribute("loggedInUser");

	}
}
