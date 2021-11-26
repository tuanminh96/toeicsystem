package com.bk.tuanpm.webtoeic.controller.admin;

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

import com.bk.tuanpm.webtoeic.entities.BaiTapTuVung;
import com.bk.tuanpm.webtoeic.entities.NguoiDung;
import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.service.BaiTapNgheService;
import com.bk.tuanpm.webtoeic.service.BaiTapTuVungService;
import com.bk.tuanpm.webtoeic.service.CauHoiBaitapNgheService;
import com.bk.tuanpm.webtoeic.service.NguoiDungService;
import com.bk.tuanpm.webtoeic.service.RoleService;

@Controller
@RequestMapping("/admin")
@SessionAttributes("loggedInUser")
public class AdminController {

	@Autowired
	BaiTapTuVungService baitaptuvungService;
	
	@Autowired
	NguoiDungService nguoiDungService;

	@Autowired
	BaiTapNgheService baiTapNgheService;
	
	@Autowired
	CauHoiBaitapNgheService cauHoiBaiNgheService;
	
	@Autowired
	RoleService roleService;
	
	@ModelAttribute("loggedInUser")
	public NguoiDung loggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return nguoiDungService.findByEmail(auth.getName());
	}

//	@GetMapping()
//	public String adminPage() {
//		return "admin/homepage";
//	}

	@GetMapping({"/bai-nghe", ""})
	public String quanLyBaiNghePage() {
		return "admin/quanLyBaiNghe";
	}

	@GetMapping("/bai-doc")
	public String quanLyBaiDocPage() {
		return "admin/quanLyBaiDoc";
	}

	@GetMapping("/grammar")
	public String quanLyGrammar() {
		return "admin/quanLyGrammar";
	}

	@GetMapping("/vocab")
	public String quanLyVocab(Model model) {
		model.addAttribute("listVocab", baitaptuvungService.findAll());
		model.addAttribute("baitaptuvung", new BaiTapTuVung());

		return "admin/quanLyVocab";
	}
	
	@GetMapping("/exam")
	public String quanLyExam(Model model) {
		model.addAttribute("baithithu", new BaiTapTuVung());
		return "admin/quanLyExam";
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
	public String updateNguoiDung(@ModelAttribute NguoiDung nd, HttpServletRequest request) {
		NguoiDung currentUser = getSessionUser(request);
		currentUser.setDiaChi(nd.getDiaChi());
		currentUser.setHoTen(nd.getHoTen());
		currentUser.setSoDienThoai(nd.getSoDienThoai());
		nguoiDungService.updateUser(currentUser);
		return "redirect:/admin/profile";
	}
	
	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
		
	}

}
