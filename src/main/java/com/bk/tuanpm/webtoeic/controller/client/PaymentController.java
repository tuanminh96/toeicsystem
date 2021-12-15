package com.bk.tuanpm.webtoeic.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.service.GroupService;

@Controller
public class PaymentController {

	@Autowired
	GroupService groupService;

	@GetMapping("/payment")
	public String showPaymentPage(Model model) {
		return "client/paymentOnline";
	}
	
}
