package com.bk.tuanpm.webtoeic.service;

import org.springframework.stereotype.Component;

import com.bk.tuanpm.webtoeic.dto.PaymentDTO;
import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.OrderPayment;
import com.bk.tuanpm.webtoeic.entities.User;

public interface SendingEmailService {

	void sendingEmail(User user, OrderPayment paymentDTO);
}
