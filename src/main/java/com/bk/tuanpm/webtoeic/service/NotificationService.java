package com.bk.tuanpm.webtoeic.service;

import java.util.List;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import com.bk.tuanpm.webtoeic.entities.Notification;
import com.bk.tuanpm.webtoeic.entities.User;

public interface NotificationService {

	SseEmitter addEmmiter(SseEmitter emitter);

	SseEmitter addEmmiter(SseEmitter emitter, int idUser);
	
	public List<Notification> getListNotifiByUser(User user);

}
