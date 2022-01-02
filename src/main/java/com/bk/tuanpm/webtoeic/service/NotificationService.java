package com.bk.tuanpm.webtoeic.service;

import java.util.List;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import com.bk.tuanpm.webtoeic.entities.Notification;
import com.bk.tuanpm.webtoeic.entities.User;

public interface NotificationService {



	void pushRemarkNotification(String idUser, String adminAdd, String weekNum);

	void pushAddGroupNotification(String idUser, String admin, String nameGroup);
	
	SseEmitter addEmmiter(SseEmitter emitter, String idUser);
	
	public List<Notification> getListNotifiByUser(User user);

	Notification saveNotification(Notification notification);
	
	Notification findByIdNoti(int idNoti);
	
	int countNotificationByUserAndDateSeenIsNull(User user);

	void pushAddPostNotification(String idUser, String admin);


}
