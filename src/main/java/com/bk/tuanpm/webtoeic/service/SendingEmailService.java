package com.bk.tuanpm.webtoeic.service;

import org.springframework.stereotype.Component;

import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.User;

public interface SendingEmailService {
	public void sendingEmail(User user);
}
