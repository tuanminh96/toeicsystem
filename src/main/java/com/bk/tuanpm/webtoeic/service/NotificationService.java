package com.bk.tuanpm.webtoeic.service;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

public interface NotificationService {


	SseEmitter addEmmiter(SseEmitter emitter, String idUser);

	void pushRemarkNotification(String idUser, String adminAdd, String weekNum);

	void pushAddGroupNotification(String idUser, String admin, String nameGroup);

}
