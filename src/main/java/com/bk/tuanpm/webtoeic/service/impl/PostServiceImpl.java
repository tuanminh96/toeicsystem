package com.bk.tuanpm.webtoeic.service.impl;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.bk.tuanpm.webtoeic.dto.MemberDTO;
import com.bk.tuanpm.webtoeic.dto.PostDTO;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.Post;
import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.repository.PostRepository;
import com.bk.tuanpm.webtoeic.service.PostService;
import com.bk.tuanpm.webtoeic.util.DateTimeUtil;

import net.minidev.json.JSONObject;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	PostRepository postRepository;

	public Map<Integer, SseEmitter> postEmitters = new ConcurrentHashMap<Integer, SseEmitter>();

	@Override
	public List<Post> getAllPostOfGroup(Group group) {
		return postRepository.findAllByGroupOrderByDatePostDesc(group);
	}

	@Override
	public Post savePost(Post post) {
		return postRepository.save(post);
	}

	@Override
	public void deletePost(Post post) {
		postRepository.delete(post);
	}

	@Override
	public Post getPost(int idPost) {
		return postRepository.findById(idPost).orElse(new Post());
	}

	@Override
	public SseEmitter addPostGroupEmitter(SseEmitter emitter, int idUser) {
		emitter.onCompletion(() -> postEmitters.remove(idUser));
		emitter.onTimeout(() -> postEmitters.remove(idUser));
		emitter.onError((e) -> {
			postEmitters.remove(idUser);
			e.printStackTrace();
		});
		postEmitters.put(idUser, emitter);
		return emitter;
	}

	@Override
	public void addPostRealtime(Post p, List<MemberDTO> users) throws ParseException, IOException {
		try {
			PostDTO post = new PostDTO();
			post.setPost(p);

			boolean isFromAdmin = false;
			if (Role.ROLE_TUTORIAL == post.getPost().getUser().getRole().getCode()) {
				isFromAdmin = true;
			}
			List<Integer> idUsers = new ArrayList<Integer>();
			for (MemberDTO user : users) {
				idUsers.add(user.getMemId());
			}
			for (Integer integer : idUsers) {

				SseEmitter emitter2Sent = postEmitters.get(integer);
				JSONObject object = new JSONObject();
//			object.put("post", post.getPost());
				object.put("isAdmin", "" + isFromAdmin);
				object.put("timePost", DateTimeUtil.difDate(post.getPost().getDatePost(), new Date()));
				object.put("totalComments", post.getTotalComment());
				System.out.println(postEmitters.size());
				System.out.println("iduser: " + integer);
				for (int string : postEmitters.keySet()) {
					System.out.println(string);
				}
				if (emitter2Sent != null) {

					emitter2Sent.send(SseEmitter.event().name("post_realtime").data(object.toString()));

					System.out.println("da sent");

				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	@Override
	public void addPostRealtime(Post p, TutorialAdmin admin) throws ParseException, IOException {
		try {
			PostDTO post = new PostDTO();
			post.setPost(p);

			boolean isFromAdmin = false;

			SseEmitter emitter2Sent = postEmitters.get(admin.getId());
			JSONObject object = new JSONObject();
//			object.put("post", post.getPost());
			object.put("isAdmin", "" + isFromAdmin);
			object.put("timePost", DateTimeUtil.difDate(post.getPost().getDatePost(), new Date()));
			object.put("totalComments", post.getTotalComment());
			System.out.println(postEmitters.size());
			System.out.println("idadmin: " + admin.getId());
			for (int string : postEmitters.keySet()) {
				System.out.println(string);
			}
			if (emitter2Sent != null) {
				emitter2Sent.send(SseEmitter.event().name("post_realtime").data(object.toString()));
				System.out.println("da sent");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}
}
