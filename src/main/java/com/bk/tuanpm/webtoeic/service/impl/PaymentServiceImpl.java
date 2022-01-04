package com.bk.tuanpm.webtoeic.service.impl;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.jstl.core.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.dto.PaymentDTO;
import com.bk.tuanpm.webtoeic.entities.OrderPayment;
import com.bk.tuanpm.webtoeic.repository.PaymentRepository;
import com.bk.tuanpm.webtoeic.service.PaymentService;
import com.bk.tuanpm.webtoeic.util.PaymentUtil;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	PaymentRepository paymentRepository;

	public String getUrlVNPayPayment(PaymentDTO paymentDTO, String urlPayment) throws UnsupportedEncodingException {

		Map vnp_Params = new HashMap<>();

		vnp_Params.put("vnp_Amount", "" + paymentDTO.getVnp_Amount() * 100);
		vnp_Params.put("vnp_Command", "" + paymentDTO.getVnp_Command());
		vnp_Params.put("vnp_CreateDate", "" + paymentDTO.getVnp_CreateDate());
		vnp_Params.put("vnp_CurrCode", "" + paymentDTO.getVnp_CurrCode());
		vnp_Params.put("vnp_TmnCode", "" + paymentDTO.getVnp_TmnCode());
		vnp_Params.put("vnp_TxnRef", "" + paymentDTO.getVnp_TxnRef());
		vnp_Params.put("vnp_ReturnUrl", paymentDTO.getVnp_ReturnUrl());
		vnp_Params.put("vnp_IpAddr", "" + paymentDTO.getVnp_IpAddr());
		vnp_Params.put("vnp_Locale", "" + paymentDTO.getVnp_Locale());
		vnp_Params.put("vnp_OrderInfo", "" + paymentDTO.getVnp_OrderInfo());
		if (!"null".equals(paymentDTO.getVnp_BankCode()) && !"".equals(paymentDTO.getVnp_BankCode())
				&& paymentDTO.getVnp_BankCode() != null) {
			vnp_Params.put("vnp_BankCode", "" + paymentDTO.getVnp_BankCode());
		}
		vnp_Params.put("vnp_Version", paymentDTO.getVnp_Version());
		// Build data to hash and querystring
		List fieldNames = new ArrayList(vnp_Params.keySet());
		Collections.sort(fieldNames);
		StringBuilder hashData = new StringBuilder();
		StringBuilder query = new StringBuilder();
		Iterator itr = fieldNames.iterator();
		while (itr.hasNext()) {
			String fieldName = (String) itr.next();
			String fieldValue = (String) vnp_Params.get(fieldName);
			if ((fieldValue != null) && (fieldValue.length() > 0)) {
				// Build hash data
				hashData.append(fieldName);
				hashData.append('=');
				hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
				// Build query
				query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
				query.append('=');
				query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
				if (itr.hasNext()) {
					query.append('&');
					hashData.append('&');
				}
			}
		}
		String queryUrl = query.toString();

		String vnp_SecureHash = PaymentUtil.hmacSHA512(paymentDTO.getVnp_SecureHash(), hashData.toString());
		queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
		String paymentUrl = urlPayment + "?" + queryUrl;
		return paymentUrl;
	};
	
	@Override
	public OrderPayment saveOrder(OrderPayment op) {
		return paymentRepository.save(op);
	}
	
	@Override
	public OrderPayment findOrderByRef(String refNo) {
		return paymentRepository.findByRefNo(refNo);
	}
}
