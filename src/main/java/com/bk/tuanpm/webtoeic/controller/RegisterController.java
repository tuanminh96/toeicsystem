package com.bk.tuanpm.webtoeic.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.service.RoleService;
import com.bk.tuanpm.webtoeic.service.SecurityService;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;
import com.bk.tuanpm.webtoeic.util.StringUtil;
import com.bk.tuanpm.webtoeic.validator.NguoiDungValidator;

@Controller
public class RegisterController {

	@Autowired
	private UserAdminServiceImpl nguoiDungService;

	@Autowired
	private SecurityService securityService;

	@Autowired
	private NguoiDungValidator nguoiDungValidator;

	@Autowired 
	private RoleService roleService;
	@GetMapping("/register")
	public String registerPage(Model model) {
		model.addAttribute("newUser", new Account());
		return "register";
	}

	@PostMapping("/register")
	public String registerProcess(@ModelAttribute("newUser") @Valid User nguoiDung, BindingResult bindingResult,
			Model model) {

		nguoiDungValidator.validate(nguoiDung, bindingResult);

		if (bindingResult.hasErrors()) {
			return "register";
		}
		nguoiDung.setRole(roleService.getRole(Role.ROLE_MEMBER));
		nguoiDung.setUsername(StringUtil.autoGenUsername(nguoiDung.hashCode()));
		nguoiDungService.saveUser(nguoiDung);
		securityService.autologin(nguoiDung.getEmail(), nguoiDung.getConfirmPassword());
		return "redirect:/";
	}
}
