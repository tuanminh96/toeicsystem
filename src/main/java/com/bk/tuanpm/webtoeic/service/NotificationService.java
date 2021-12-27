package com.bk.tuanpm.webtoeic.service;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

public interface NotificationService {

	SseEmitter addEmmiter(SseEmitter emitter);

	SseEmitter addEmmiter(SseEmitter emitter, int idUser);

}
