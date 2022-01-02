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
import com.bk.tuanpm.webtoeic.service.PostService;


@RestController
public class PostApi {
	
	@Autowired
	NotificationService notificationService;
	
	@Autowired
	PostService postService;
	
	@CrossOrigin("*")
	@GetMapping(value = "/subcribePost",headers = "Accept=*/*", consumes = MediaType.ALL_VALUE, produces = MediaType.ALL_VALUE)
	
	public SseEmitter subcribeEventPostGroup(@RequestParam("id") int idMem) {
		SseEmitter sseEmitter = new SseEmitter();
		postService.addPostGroupEmitter(sseEmitter, idMem);
		return sseEmitter;
	}
}
