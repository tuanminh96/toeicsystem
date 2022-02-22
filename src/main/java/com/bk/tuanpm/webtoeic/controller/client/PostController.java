package com.bk.tuanpm.webtoeic.controller.client;

import java.io.IOException;
import java.text.MessageFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.bk.tuanpm.webtoeic.config.MessageConfig;
import com.bk.tuanpm.webtoeic.dto.MemberDTO;
import com.bk.tuanpm.webtoeic.dto.PostDTO;
import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.Notification;
import com.bk.tuanpm.webtoeic.entities.Post;
import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.repository.TutorialAdminRepository;
import com.bk.tuanpm.webtoeic.service.GroupService;
import com.bk.tuanpm.webtoeic.service.NotificationService;
import com.bk.tuanpm.webtoeic.service.PostService;
import com.bk.tuanpm.webtoeic.service.RemarkService;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;
import com.bk.tuanpm.webtoeic.util.DateTimeUtil;
import com.bk.tuanpm.webtoeic.util.StringUtil;

@Controller
public class PostController {

	@Autowired
	GroupService groupService;

	@Autowired
	TutorialAdminRepository adminRepository;

	@Autowired
	UserAdminServiceImpl userAdminServiceImpl;

	@Autowired
	MessageConfig messageConfig;

	@Autowired
	RemarkService remarkService;

	@Autowired
	NotificationService notificationService;

	@Autowired
	PostService postService;

	@GetMapping(value = "/newFeed/{idGroup}")
	public String viewGroupPost(Model model, @PathVariable("idGroup") int idGroup) throws ParseException {
		List<PostDTO> postDTOs = new ArrayList<PostDTO>();
		postDTOs = getAllPostGroup(idGroup);
		model.addAttribute("listpost", postDTOs);
		return "admin/listPost";
	}

	@GetMapping(value = "/clientFeed/{idGroup}")
	public String viewGroupPostClient(Model model, @PathVariable("idGroup") int idGroup) throws ParseException {
		List<PostDTO> postDTOs = new ArrayList<PostDTO>();
		postDTOs = getAllPostGroup(idGroup);
		model.addAttribute("listpost", postDTOs);
		return "client/listPost";
	}

	@PostMapping(value = "/admin/savePost")
	public String savePost(Model model, @RequestBody Post post) throws ParseException, IOException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		TutorialAdmin currentUser = userAdminServiceImpl.findTutorialAdminByEmail(auth.getName());

		post.setUser(currentUser);
		post.setDatePost(new Date());
		post.setContent(StringUtil.formatPost(post.getContent()));
		Post postSaved = postService.savePost(post);

		// Hiển thị bài đăng vừa post lên realtime new feed của người dùng cùng nhóm
		// Get list user of group
		List<MemberDTO> users = groupService.getListMember(post.getGroup().getIdGroup());
		postService.addPostRealtime(post, users);

		// save a new posting notification
		Group groupPosted = groupService.getGroupById(post.getGroup().getIdGroup());
		List<User> userOfGroups = groupPosted.getUsers();

		for (User user : userOfGroups) {
			// đẩy thông báo về máy của người dùng
			if (user.getId() != currentUser.getId())
				notificationService.pushAddPostNotification("" + user.getId(), currentUser.getUsername());

			Notification notification = new Notification();
			notification.setDateSend(new Date());

			// Tóm tắt nội dung thông báo
			String message = messageConfig.getProperty("noti.post");
			String result = MessageFormat.format(message, currentUser.getUsername());
			notification.setBrief(result);
			notification.setType(Notification.TYPE_POST);

			// add hyperlink cho thong bao de nguoi dung click vao
			String urlPost = messageConfig.getProperty("noti.post.url");
			String link = MessageFormat.format(urlPost, "" + groupPosted.getIdGroup(), "" + postSaved.getIdPost());
			notification.setHyperLink(link);

			notification.setUser(user);
			notificationService.saveNotification(notification);

		}

		// return list post to view
		List<PostDTO> postDTOs = new ArrayList<PostDTO>();
		postDTOs = getAllPostGroup(post.getGroup().getIdGroup());
		model.addAttribute("listpost", postDTOs);

		return "admin/listPost";
	}

	// post a new post for user
	@PostMapping(value = "/savePost")
	public String userSavePost(Model model, @RequestBody Post post) throws ParseException, IOException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User currentUser = userAdminServiceImpl.findUserByEmail(auth.getName());

		post.setUser(currentUser);
		post.setDatePost(new Date());
		post.setContent(StringUtil.formatPost(post.getContent()));
		Post postSaved = postService.savePost(post);

		// Hiển thị bài đăng vừa post lên realtime new feed của người dùng cùng nhóm
		// Get list user of group
		List<MemberDTO> users = groupService.getListMember(post.getGroup().getIdGroup());
		postService.addPostRealtime(post, users);

		// save a new posting notification
		Group groupPosted = groupService.getGroupById(post.getGroup().getIdGroup());
		List<User> userOfGroups = groupPosted.getUsers();

		for (User user : userOfGroups) {
			// đẩy thông báo về máy của người dùng
			if (user.getId() != currentUser.getId())
				notificationService.pushAddPostNotification("" + user.getId(), currentUser.getUsername());

			Notification notification = new Notification();
			notification.setDateSend(DateTimeUtil.convertDateToDate(new Date()));

			// Tóm tắt nội dung thông báo
			String message = messageConfig.getProperty("noti.post");
			String result = MessageFormat.format(message, currentUser.getUsername());
			notification.setBrief(result);
			notification.setType(Notification.TYPE_POST);

			// add hyperlink cho thong bao de nguoi dung click vao
			String urlPost = messageConfig.getProperty("noti.post.url");
			String link = MessageFormat.format(urlPost, "" + groupPosted.getIdGroup(), "" + postSaved.getIdPost());
			notification.setHyperLink(link);
			notification.setUser(user);
			if (user.getId() != currentUser.getId())
				notificationService.saveNotification(notification);
		}

		// Đẩy thông báo về phía admin của nhóm
		Notification notificationAd = new Notification();
		notificationAd.setDateSend(DateTimeUtil.convertDateToDate(new Date()));

		// Tóm tắt nội dung thông báo
		String message = messageConfig.getProperty("noti.post");
		String result = MessageFormat.format(message, currentUser.getUsername());
		notificationAd.setBrief(result);
		notificationAd.setType(Notification.TYPE_POST);
		notificationAd.setHyperLink("");
		notificationAd.setUser(groupPosted.getCreateAdmin());
		notificationService.saveNotification(notificationAd);
		// đẩy thông báo realtime
		notificationService.pushAddPostNotification("" + groupPosted.getCreateAdmin().getId(),
				currentUser.getUsername());

		// đẩy bài viết realtime về cho admin nhóm
		postService.addPostRealtime(post, groupPosted.getCreateAdmin());
		// return list post to view
		List<PostDTO> postDTOs = new ArrayList<PostDTO>();
		postDTOs = getAllPostGroup(post.getGroup().getIdGroup());
		model.addAttribute("listpost", postDTOs);

		return "client/listPost";
	}

	@GetMapping(value = "/deletePost/{idPost}")
	public String savePost(Model model, @PathVariable("idPost") int idPost) throws ParseException {

		Post post = postService.getPost(idPost);
		postService.deletePost(post);

		// return list post to view
		List<PostDTO> postDTOs = new ArrayList<PostDTO>();
		postDTOs = getAllPostGroup(post.getGroup().getIdGroup());
		model.addAttribute("listpost", postDTOs);
		return "admin/listPost";
	}

	public List<PostDTO> getAllPostGroup(int idGroup) throws ParseException {
		Group group = groupService.getGroupById(idGroup);
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
		return postDTOs;
	}

}
