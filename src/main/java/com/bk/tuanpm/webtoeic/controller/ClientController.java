package com.bk.tuanpm.webtoeic.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bk.tuanpm.webtoeic.dto.ExamHistoryDTO;
import com.bk.tuanpm.webtoeic.service.ClientAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.security.web.bind.support.AuthenticationPrincipalArgumentResolver;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.service.SlideBannerService;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;

@Controller
@SessionAttributes("loggedInUser")
public class ClientController {
	@Autowired
	private SlideBannerService slideBannerService;

	@Autowired
	private UserAdminServiceImpl nguoiDungService;

	@Autowired
	private ClientAccountService clientAccountService;

	@ModelAttribute("loggedInUser")
	public Account loggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Account nguoiDung = new Account();
		if (auth.getClass().isAssignableFrom(OAuth2AuthenticationToken.class)) {
			String principal = auth.getPrincipal().toString();
			String[] part = principal.split(",");
			String name = part[2].split("=")[1];
			nguoiDung.setHoTen(name);
			nguoiDung.setLoginOauth2(true);
			return nguoiDung;
		} else {
			return nguoiDungService.findByEmail(auth.getName());
		}
	}

	public Account getSessionUser(HttpServletRequest request) {
		Account nguoiDung = (Account) request.getSession().getAttribute("loggedInUser");
		return nguoiDung;
	}

	@GetMapping(value = { "/home", "/" })
	public String home(Model model, @AuthenticationPrincipal OAuth2User oauth2User, HttpServletRequest request) {
		model.addAttribute("listslidebanner", slideBannerService.findAll());
		return "client/home";
	}

	@GetMapping(value = "test")
	public String testmarkdown() {
		return "client/testMardown";
	}

	@GetMapping(value = "/profile")
	public String profilePage(Model model, HttpServletRequest request, @AuthenticationPrincipal OAuth2User oauth2User) {
		Account account = getSessionUser(request);
		int idAccount = account.getId();
		model.addAttribute("user", account);

		// Lay ra list cac bai thi accout da thi.
		List<ExamHistoryDTO> listExamHistoryDTO = clientAccountService.findAllExamHistory(idAccount);
		model.addAttribute("listExamHistoryDTO", listExamHistoryDTO);

		// Lay ra tong so bai thi(exam) account da thi.
		int totalExam = clientAccountService.getTotalExam(idAccount);
		model.addAttribute("totalExam", totalExam);

		return "client/profile";
	}

	@PostMapping("/profile/update")
	public String updateNguoiDung(@ModelAttribute Account nd, HttpServletRequest request) {
		Account currentUser = getSessionUser(request);
		currentUser.setDiaChi(nd.getDiaChi());
		currentUser.setHoTen(nd.getHoTen());
		currentUser.setSoDienThoai(nd.getSoDienThoai());
		nguoiDungService.updateUser(currentUser);
		return "redirect:/profile";
	}

	@GetMapping(value = "/logout")
	public String logoutPage(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}

}
