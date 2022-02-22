package com.bk.tuanpm.webtoeic.controller.client;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bk.tuanpm.webtoeic.dto.PostDTO;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.GroupMember;
import com.bk.tuanpm.webtoeic.entities.Post;
import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.service.GroupMemberService;
import com.bk.tuanpm.webtoeic.service.GroupService;
import com.bk.tuanpm.webtoeic.service.PostService;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;
import com.bk.tuanpm.webtoeic.util.DateTimeUtil;

@Controller
public class GroupController {

	@Autowired
	GroupService groupService;

	@Autowired
	UserAdminServiceImpl userAdminServiceImpl;

	@Autowired
	GroupMemberService groupMemberService;

	@Autowired
	PostService postService;

	@GetMapping("/group/group_detail/{idGroup}")
	public String getGroup(Model model, @PathVariable Integer idGroup) throws ParseException {
		Group group = groupService.getGroupById(idGroup);
		model.addAttribute("group", group);
		List<Post> posts = postService.getAllPostOfGroup(group);
		List<PostDTO> postDTOs = new ArrayList<PostDTO>();
		for (Post post : posts) {
			PostDTO dto = new PostDTO();
			dto.setPost(post);
			if (Role.ROLE_TUTORIAL == post.getUser().getRole().getCode()) {
				dto.setAdminPost(true);
			}
			dto.setTimePost(DateTimeUtil.difDate(post.getDatePost(), new Date()));
			postDTOs.add(dto);
		}
		model.addAttribute("listpost", postDTOs);
		for (PostDTO postDTO : postDTOs) {
			System.out.println(postDTO);
		}
		return "client/groupDetail";
	}

	@GetMapping("/group/post_detail/{idGroup}/{idPost}")
	public String getPost(Model model, @PathVariable("idPost") int idPost, @PathVariable Integer idGroup) throws ParseException {
		Group group = groupService.getGroupById(idGroup);
		model.addAttribute("group", group);
		List<PostDTO> list = new ArrayList<>();
		Post post = postService.getPost(idPost);
		PostDTO dto = new PostDTO();
		dto.setPost(post);
		if (Role.ROLE_TUTORIAL == post.getUser().getRole().getCode()) {
			dto.setAdminPost(true);
		}
		dto.setTimePost(DateTimeUtil.difDate(post.getDatePost(), new Date()));
		list.add(dto);
		model.addAttribute("listpost", list);
		return "client/groupDetail";
	}

	@GetMapping("/list_group")
	public String listGroup(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userAdminServiceImpl.findUserByEmail(auth.getName());
		List<GroupMember> groupMem = groupMemberService.findGroupsOfUser(user.getId());
		List<Group> groups = new ArrayList<Group>();
		for (GroupMember groupMember : groupMem) {
			Group group = groupService.getGroupById(groupMember.getGroup());
			groups.add(group);
		}
		model.addAttribute("groups", groups);
		return "client/listGroup";
	}

	@PostMapping(value = "/addGroup", produces = MediaType.APPLICATION_JSON_VALUE)
	public String addGroup(Model model, @RequestBody Group group) {
		groupService.saveGroup(group);
		return "";
	}
}
