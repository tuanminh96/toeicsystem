package com.bk.tuanpm.webtoeic.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.bk.tuanpm.webtoeic.service.NotificationService;


@RestController
@CrossOrigin("*")
public class NotificationApi {
	
	@Autowired
	NotificationService notificationService;
	
	@GetMapping(value = "/api/subcribe",headers = "Accept=*/*", consumes = MediaType.ALL_VALUE, produces = MediaType.ALL_VALUE)
	@CrossOrigin("*")
	public SseEmitter subcribeEvent(@RequestParam("id") String idMem) {
		SseEmitter sseEmitter = new SseEmitter(24 * 60 * 60 * 1000l);
		notificationService.addEmmiter(sseEmitter, idMem);
		return sseEmitter;
	}
}
