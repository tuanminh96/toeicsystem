package com.bk.tuanpm.webtoeic.service.impl;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.bk.tuanpm.webtoeic.config.MessageConfig;
import com.bk.tuanpm.webtoeic.dto.NotificationDTO;
import com.bk.tuanpm.webtoeic.entities.Notification;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.repository.NotificationRepository;
import com.bk.tuanpm.webtoeic.service.NotificationService;


@Service("notificationService")
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	MessageConfig messageConfig;
	
	@Autowired
	NotificationRepository notificationRepository;

	public Map<String, SseEmitter> emitters = new HashMap<String, SseEmitter>();
	

	@Override
	public SseEmitter addEmmiter(SseEmitter emitter, String idUser) {
		emitter.onCompletion(() -> emitters.remove(idUser));
		emitter.onTimeout(() -> emitters.remove(idUser));
		emitter.onError((e) -> {
			emitters.remove(idUser);
			e.printStackTrace();
		});
		emitters.put(idUser, emitter);
		return emitter;
	}

	@Override
	public void pushRemarkNotification(String idUser, String adminAdd, String weekNum) {

		SseEmitter sentEmitter = emitters.get(idUser);

		JSONObject notiMess = new JSONObject(); 
		String message = messageConfig.getProperty("noti.remark");
		String result = MessageFormat.format(message, adminAdd , weekNum);
		String event = notiMess.put("content", result).toString();
		if (sentEmitter != null) {
			try {
				sentEmitter.send(SseEmitter
						.event()
						.name(Notification.TYPE_REMARK)
						.data(event));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				emitters.remove(sentEmitter);
			}
		}

	}
	@Override
	public void pushAddGroupNotification(String idUser, String admin, String nameGroup) {

		SseEmitter sentEmitter = emitters.get(idUser);

		JSONObject notiMess = new JSONObject(); 
		String message = messageConfig.getProperty("noti.addgroup");
		String result = MessageFormat.format(message, admin , nameGroup);
		String event = notiMess.put("content", result).toString();
		if (sentEmitter != null) {
			try {
				sentEmitter.send(SseEmitter
						.event()
						.name(Notification.TYPE_ADD_GROUP)
						.data(event));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				emitters.remove(sentEmitter);
			}
		}

	}

	@Override
	public void pushAddPostNotification(String idUser, String admin) {

		SseEmitter sentEmitter = emitters.get(idUser);

		JSONObject notiMess = new JSONObject(); 
		String message = messageConfig.getProperty("noti.post");
		String result = MessageFormat.format(message, admin);
		String event = notiMess.put("content", result).toString();
		if (sentEmitter != null) {
			try {
				sentEmitter.send(SseEmitter
						.event()
						.name(Notification.TYPE_POST)
						.data(event));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				emitters.remove(sentEmitter);
			}
		}

	}
	@Override
	public List<Notification> getListNotifiByUser(User user) {
		return notificationRepository.findAllByUser(user);
	}
	
	@Override
	public Notification saveNotification(Notification notification) {
		return notificationRepository.save(notification);
	}
}
