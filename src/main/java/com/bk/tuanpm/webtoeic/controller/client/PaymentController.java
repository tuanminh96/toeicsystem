package com.bk.tuanpm.webtoeic.controller.client;

import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.jstl.core.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.bk.tuanpm.webtoeic.config.PaymentConfig;
import com.bk.tuanpm.webtoeic.dto.PaymentDTO;
import com.bk.tuanpm.webtoeic.entities.ContentAdmin;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.service.GroupService;
import com.bk.tuanpm.webtoeic.service.impl.PaymentServiceImpl;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;
import com.bk.tuanpm.webtoeic.util.DateTimeUtil;
import com.bk.tuanpm.webtoeic.util.PaymentUtil;

@Controller
public class PaymentController {

	@Autowired
	GroupService groupService;
	
	@Autowired
	PaymentConfig paymentConfig;

	@Autowired
	UserAdminServiceImpl userAdminServiceImpl;
	
	@Autowired
	PaymentServiceImpl paymentServiceImpl;
	
	@GetMapping("/payment")
	public String showPaymentPage(Model model) {
		return "client/paymentOnline";
	}

	@PostMapping(value = "/processPayment", produces = MediaType.APPLICATION_JSON_VALUE) 
	public String processPayment(Model model, @RequestBody PaymentDTO paymentDTO) throws UnknownHostException, UnsupportedEncodingException {
		
		//Get current payment user
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userAdminServiceImpl.findUserByEmail(auth.getName());
		String urlPayment = paymentConfig.getProperty("vnp_Url");
		
		String vnp_Command = paymentConfig.getProperty("vnp_Command");
		paymentDTO.setVnp_Command(vnp_Command);
		String vnp_CreateDate = DateTimeUtil.getDateStringForVNP();
		paymentDTO.setVnp_CreateDate(vnp_CreateDate);
		String vnp_TmnCode=  paymentConfig.getProperty("vnp_TmnCode");
		paymentDTO.setVnp_TmnCode(vnp_TmnCode);
	
		String vnp_ReturnUrl = paymentDTO.getVnp_ReturnUrl()
				+paymentConfig.getProperty("vnp_ReturnUrl")
				+"/"+user.getId();	
		paymentDTO.setVnp_ReturnUrl(vnp_ReturnUrl);
		long vnp_TxnRef = PaymentUtil.getTxnRef(user.hashCode());
		paymentDTO.setVnp_TxnRef(""+vnp_TxnRef);
		String vnp_IpAddr = InetAddress.getLocalHost().getHostAddress();
		paymentDTO.setVnp_IpAddr(vnp_IpAddr);
		String vnp_Locale = paymentConfig.getProperty("vnp_Locale");
		paymentDTO.setVnp_Locale(vnp_Locale);
		String vnp_OrderInfo = paymentDTO.getVnp_OrderInfo();
		paymentDTO.setVnp_OrderInfo(vnp_OrderInfo);
		paymentDTO.setVnp_SecureHash(paymentConfig.getProperty("vnp_HashSecret"));
		paymentDTO.setVnp_CurrCode(paymentConfig.getProperty("vnp_CurrCode"));
		paymentDTO.setVnp_Version(paymentConfig.getProperty("vnp_Version"));
		String queryUrl = paymentServiceImpl.getUrlVNPayPayment(paymentDTO, urlPayment);
        

		return "redirect:"+queryUrl;
	}
	
	@GetMapping(value = "/processResult/{idMem}") 
	public String resultPayment(Model model, @PathVariable("idMem") int idMem) {
		return "";
	}
	
}
