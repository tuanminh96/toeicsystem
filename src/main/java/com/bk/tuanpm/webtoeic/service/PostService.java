package com.bk.tuanpm.webtoeic.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.bk.tuanpm.webtoeic.dto.MemberDTO;
import com.bk.tuanpm.webtoeic.dto.PostDTO;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.Post;

public interface PostService {

	Post savePost(Post post);

	List<Post> getAllPostOfGroup(Group group);

	void deletePost(Post post);

	Post getPost(int idPost);

	void addPostRealtime(Post p, List<MemberDTO> users) throws ParseException, IOException;

	SseEmitter addPostGroupEmitter(SseEmitter emitter, int idUser);

}
