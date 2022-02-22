package com.bk.tuanpm.webtoeic.controller.client;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.core.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.bk.tuanpm.webtoeic.config.MessageConfig;
import com.bk.tuanpm.webtoeic.config.PaymentConfig;
import com.bk.tuanpm.webtoeic.dto.PaymentDTO;
import com.bk.tuanpm.webtoeic.entities.ContentAdmin;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.OrderPayment;
import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.service.GroupService;
import com.bk.tuanpm.webtoeic.service.RoleService;
import com.bk.tuanpm.webtoeic.service.SendingEmailService;
import com.bk.tuanpm.webtoeic.service.impl.PaymentServiceImpl;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;
import com.bk.tuanpm.webtoeic.util.DateTimeUtil;
import com.bk.tuanpm.webtoeic.util.PaymentUtil;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller
public class PaymentController {

	@Autowired
	GroupService groupService;
	
	@Autowired
	PaymentConfig paymentConfig;

	@Autowired
	MessageConfig messageConfig;
	@Autowired
	UserAdminServiceImpl userAdminServiceImpl;
	
	@Autowired
	PaymentServiceImpl paymentServiceImpl;
	
	@Autowired
	RoleService roleService;
	
	@Autowired
	SendingEmailService emailService;
	
	@GetMapping("/payment")
	public String showPaymentPage(Model model) {
		return "client/paymentOnline";
	}

	@PostMapping(value = "/processPayment", produces = MediaType.APPLICATION_JSON_VALUE) 
	public void processPayment(Model model, @RequestBody PaymentDTO paymentDTO, HttpServletResponse response) throws IOException {
		
		//Get current payment user
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userAdminServiceImpl.findUserByEmail(auth.getName());
		
		//chuẩn bị tham số truyền lên API
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
		
		//Cap nhat thong tin thanh toan vao DB
    	OrderPayment orderPayment = new OrderPayment();
    	orderPayment.setUser(user);
    	orderPayment.setAmount(paymentDTO.getVnp_Amount() * 100);
    	orderPayment.setBankCode(paymentDTO.getVnp_BankCode());
    	orderPayment.setOrderInfo(vnp_OrderInfo);
    	orderPayment.setRefNo(""+vnp_TxnRef);
    	orderPayment.setStatus("Processing");
    	paymentServiceImpl.saveOrder(orderPayment);
    	
    	//tạo query api
		String queryUrl = paymentServiceImpl.getUrlVNPayPayment(paymentDTO, urlPayment);
		com.google.gson.JsonObject job = new JsonObject();
        job.addProperty("code", "00");
        job.addProperty("message", "success");
        job.addProperty("data", queryUrl);
        Gson gson = new Gson();
        response.getWriter().write(gson.toJson(job));
	}
	@GetMapping(value = "/processResultPayment/{idMem}") 
	public String resultPayment(Model model, HttpServletRequest request , @PathVariable("idMem") int idMem,
			@RequestParam("vnp_Amount") String vnp_Amount,
			@RequestParam("vnp_BankCode") String vnp_BankCode,
			@RequestParam("vnp_BankTranNo") String vnp_BankTranNo,
			@RequestParam("vnp_CardType") String vnp_CardType,
			@RequestParam("vnp_OrderInfo") String vnp_OrderInfo,
			@RequestParam("vnp_PayDate") String vnp_PayDate,
			@RequestParam("vnp_ResponseCode") String vnp_ResponseCode,
			@RequestParam("vnp_TmnCode") String vnp_TmnCode,
			@RequestParam("vnp_TransactionNo") String vnp_TransactionNo,
			@RequestParam("vnp_TransactionStatus") String vnp_TransactionStatus,
			@RequestParam("vnp_TxnRef") String vnp_TxnRef,
			@RequestParam("vnp_SecureHash") String vnp_SecureHash
			) throws UnsupportedEncodingException, ParseException {
		//Begin process return from VNPAY
	    Map fields = new HashMap();
	    for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
	        //String fieldName = (String) params.nextElement();
	        //String fieldValue = request.getParameter(fieldName);
	        String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
	        String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
	        if ((fieldValue != null) && (fieldValue.length() > 0)) {
	            fields.put(fieldName, fieldValue);
	        }
	    }
	    if (fields.containsKey("vnp_SecureHashType")) {
	        fields.remove("vnp_SecureHashType");
	    }
	    if (fields.containsKey("vnp_SecureHash")) {
	        fields.remove("vnp_SecureHash");
	    }
	    String signValue = PaymentUtil .hashAllFields(fields, paymentConfig.getProperty("vnp_HashSecret"));
	    if (signValue.equals(vnp_SecureHash)) {
	        //Kiem tra chu ky OK
	        /* Kiem tra trang thai don hang trong DB: checkOrderStatus, 
	        - Neu trang thai don hang OK, tien hanh cap nhat vao DB, tra lai cho VNPAY RspCode=00
	        - Neu trang thai don hang (da cap nhat roi) => khong cap nhat vao DB, tra lai cho VNPAY RspCode=02
	         */
	        // vnp_TxnRef đơn hàng có tồn tại trong database merchant
	    	boolean checkOrderId = false; 
	    	OrderPayment orderPayment = paymentServiceImpl.findOrderByRef(vnp_TxnRef);
	    	if(orderPayment!=null) {
	    		checkOrderId = true;
	    	}
	        // vnp_Amount is valid  (so sánh số tiền VNPAY request và sô tiền của giao dịch trong database merchant)
	    	boolean checkAmount =  (vnp_Amount.equals(""+orderPayment.getAmount())); 
	    	
	    	//Kiem tra neu status thanh toán đang chưa Paid thì mới đc tiến hành cạp nhật DB là Paid
	        boolean checkOrderStatus = ("Processing").equals(orderPayment.getStatus());
	        if (checkOrderId) {
	            if (checkAmount) {
	                if (checkOrderStatus) {
	                    if ("00".equals(request.getParameter("vnp_ResponseCode"))) {
	                        //Cap nhat lại role của user lên VIP
	                    	User userUp = userAdminServiceImpl.getUserById(idMem);
	                    	userUp.setRole(roleService.getRole(Role.ROLE_MEMBER_VIP));
	                    	userUp.setUpgradeDate(new Date());
	                    	userAdminServiceImpl.saveUserNotPass(userUp);
	                    	
	                    	//reload to role VIP
	                    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	                    	List<GrantedAuthority> updatedAuthorities = new ArrayList<>();
	                    	updatedAuthorities.add(new SimpleGrantedAuthority("ROLE_MEMBER_VIP"));
	                    	Authentication newAuth = new UsernamePasswordAuthenticationToken(auth.getPrincipal(), auth.getCredentials(), updatedAuthorities);
	                    	SecurityContextHolder.getContext().setAuthentication(newAuth);
	                    	//gui thong bao cho user
	                    	
	                    	//Cap nhat thong tin thanh toan vao DB
	                    	orderPayment.setBankTranNo(vnp_BankTranNo);
	                    	orderPayment.setCardType(vnp_CardType);
	                    	orderPayment.setBankCode(vnp_BankCode);
	                    	orderPayment.setPayDate(DateTimeUtil.convertStringToDate(vnp_PayDate));
	                    	orderPayment.setResponseCode(vnp_ResponseCode);
	                    	orderPayment.setTransactionNo(vnp_TransactionNo);
	                    	orderPayment.setTransactionStatus(vnp_TransactionStatus);
	                    	orderPayment.setStatus("Paid");
	                    	
	                    	paymentServiceImpl.saveOrder(orderPayment);
	                    	
	                    	//Gửi thông tin thanh toán qua email
	                    	emailService.sendingEmail(userUp, orderPayment);
	                    	
	                    	model.addAttribute("order", orderPayment);
	                    } else {
	                        //Xu ly thanh toan khong thanh cong
	                        //  out.print("GD Khong thanh cong");
	                    	orderPayment.setBankTranNo(vnp_BankTranNo);
	                    	orderPayment.setCardType(vnp_CardType);
	                    	orderPayment.setBankCode(vnp_BankCode);
	                    	orderPayment.setPayDate(DateTimeUtil.convertStringToDate(vnp_PayDate));
	                    	orderPayment.setResponseCode(vnp_ResponseCode);
	                    	orderPayment.setTransactionNo(vnp_TransactionNo);
	                    	orderPayment.setTransactionStatus(vnp_TransactionStatus);
	                    	orderPayment.setStatus("Failed");
	                    	paymentServiceImpl.saveOrder(orderPayment);
	                    	model.addAttribute("messagePayment", messageConfig.getProperty("payment.failed"));
	                    }
	                    model.addAttribute("messagePayment", messageConfig.getProperty("payment.success"));
	                } else {
	                    //Don hang nay da duoc cap nhat roi, Merchant khong cap nhat nua (Duplicate callback)
	                    model.addAttribute("messagePayment", messageConfig.getProperty("payment.02"));
	                    orderPayment.setResponseCode("02");
                    	orderPayment.setStatus("Failed");
                    	paymentServiceImpl.saveOrder(orderPayment);
	                }
	            } else {
	            	model.addAttribute("messagePayment", messageConfig.getProperty("payment.04"));
	            	orderPayment.setResponseCode("04");
                	orderPayment.setStatus("Failed");
                	paymentServiceImpl.saveOrder(orderPayment);
	            }
	        }
	        else {
	        	model.addAttribute("messagePayment", messageConfig.getProperty("payment.01"));
	        	orderPayment.setResponseCode("01");
            	orderPayment.setStatus("Failed");
            	paymentServiceImpl.saveOrder(orderPayment);
	        }

	    } else {
	    	model.addAttribute("messagePayment", messageConfig.getProperty("payment.97"));
	    }
		return "client/paymentResult";
	}
	
}
