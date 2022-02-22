package com.bk.tuanpm.webtoeic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;

@ControllerAdvice
public class DefaultController {

	@Autowired
	private UserAdminServiceImpl nguoiDungService;

	@ModelAttribute
	public void load(Model model, @AuthenticationPrincipal Object user) {
		if (user == null) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			Account nguoiDung;
			nguoiDung = nguoiDungService.findByEmail(auth.getName());
			model.addAttribute("nguoiDung", nguoiDung);
		}

	}
}
