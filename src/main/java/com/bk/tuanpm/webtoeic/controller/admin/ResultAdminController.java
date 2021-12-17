package com.bk.tuanpm.webtoeic.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bk.tuanpm.webtoeic.dto.MemberDTO;
import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.TestResult;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.repository.TutorialAdminRepository;
import com.bk.tuanpm.webtoeic.service.GroupService;
import com.bk.tuanpm.webtoeic.service.impl.KetQuaBaiTestImpl;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;

@Controller
@RequestMapping("/admin")
public class ResultAdminController {

	@Autowired
	GroupService groupService;
	@Autowired
	UserAdminServiceImpl nguoiDungService;
	@Autowired
	TutorialAdminRepository adminRepository;
	
	@Autowired
	UserAdminServiceImpl userAdminServiceImpl;
	
	@Autowired
	KetQuaBaiTestImpl ketQuaBaiTestImpl;

	@GetMapping("/memberResult/{idMem}")
	public String getMemberResult(Model model, @PathVariable Integer idMem) {
		User userResult = userAdminServiceImpl.getUserById(idMem);
		List<TestResult> results = ketQuaBaiTestImpl.getResultMember(userResult);
		model.addAttribute("results", results);
		return "admin/memberResultDetail";
	}
	
}
