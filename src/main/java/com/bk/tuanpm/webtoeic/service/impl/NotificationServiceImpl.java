package com.bk.tuanpm.webtoeic.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.bk.tuanpm.webtoeic.config.MessageConfig;
import com.bk.tuanpm.webtoeic.dto.NotificationDTO;
import com.bk.tuanpm.webtoeic.entities.Notification;
import com.bk.tuanpm.webtoeic.service.NotificationService;
import com.google.gson.JsonObject;

import net.minidev.json.JSONObject;

@Service
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	MessageConfig messageConfig;

	public Map<Integer, SseEmitter> emitters = new HashMap<Integer, SseEmitter>();

	@Override
	public SseEmitter addEmmiter(SseEmitter emitter, int idUser) {
		emitter.onCompletion(() -> emitters.remove(idUser));
		emitter.onTimeout(() -> emitters.remove(idUser));
		emitter.onError((e) -> {
			emitters.remove(idUser);
			e.printStackTrace();
		});
		emitters.put(idUser, emitter);
		return emitter;
	}

	public void pushRemarkNotification(int idUser) {

		SseEmitter sentEmitter = emitters.get(idUser);

		JsonObject notiMess = new JsonObject();
		notiMess.addProperty("content", messageConfig.getProperty("noti.remark"));
		if (sentEmitter != null) {
			try {
				sentEmitter.send(SseEmitter
						.event()
						.name(Notification.TYPE_REMARK)
						.data(notiMess));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				emitters.remove(sentEmitter);
			}
		}

	}

	@Override
	public SseEmitter addEmmiter(SseEmitter emitter) {
		// TODO Auto-generated method stub
		return null;
	}
}
