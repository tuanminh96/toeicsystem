package com.bk.tuanpm.webtoeic.controller.admin;

import java.text.MessageFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;
import com.bk.tuanpm.webtoeic.util.DateTimeUtil;
import com.bk.tuanpm.webtoeic.util.StringUtil;

@Controller
@RequestMapping("/admin")
public class GroupAdminController {

	@Autowired
	GroupService groupService;
	@Autowired
	UserAdminServiceImpl nguoiDungService;
	@Autowired
	TutorialAdminRepository adminRepository;

	@Autowired
	UserAdminServiceImpl userAdminServiceImpl;

	@Autowired
	NotificationService notificationService;

	@Autowired
	MessageConfig messageConfig;

	@Autowired
	PostService postService;

	@PostMapping(value = "/addGroup", produces = MediaType.APPLICATION_JSON_VALUE)
	public String addGroup(Model model, @RequestBody Group group) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		TutorialAdmin currentUser = nguoiDungService.findTutorialAdminByEmail(auth.getName());
		System.out.println(currentUser);
		group.setCreateAdmin(currentUser);
		group.setGroupCode(StringUtil.autoGenGroupCode(groupService.getTotalGroupThisYear()));
		groupService.saveGroup(group);

		List<Group> groups = groupService.getGroupOfAdmin(currentUser);
		model.addAttribute("groups", groups);
		return "admin/listGroupAdmin";
	}

	@GetMapping(value = "/delGroup/{idGroup}")
	public String delGroup(@PathVariable("idGroup") int idGroup, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		TutorialAdmin currentUser = nguoiDungService.findTutorialAdminByEmail(auth.getName());
		Group group = groupService.getGroupById(idGroup);
		group.setDelFlag(1);

		try {
			groupService.saveGroup(group);
			List<Group> groups = groupService.getGroupOfAdmin(currentUser);
			List<Group> displayGroup =  groups.stream().filter(g -> g.getDelFlag() == 0).collect(Collectors.toList());
			model.addAttribute("groups", displayGroup);
			return "admin/quanLyGroup";
		} catch (Exception e) {
			// TODO: handle exception
			return "client/error";
		}
	}

	@GetMapping("/group_detail/{idGroup}")
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
		return "admin/groupDetailAdmin";
	}

	@GetMapping("/group_detail/listMember/{idGroup}")
	public String getListMemberGroup(Model model, @PathVariable Integer idGroup) {
		List<MemberDTO> members = groupService.getListMember(idGroup);
		model.addAttribute("members", members);
		return "admin/listMember";
	}

	@GetMapping("/group_detail/listMemberResult/{idGroup}")
	public String getListMemberResult(Model model, @PathVariable Integer idGroup) {
		List<MemberDTO> members = groupService.getListMember(idGroup);
		model.addAttribute("members", members);
		int weeknNum = DateTimeUtil.getCurrentWeekNum();
		String currentRange = DateTimeUtil.getCurrentWeekRange();
		List<String> listRage = DateTimeUtil.gettWeekListYear(2021);
		model.addAttribute("week", weeknNum);
		model.addAttribute("currange", currentRange);
		model.addAttribute("totalrange", listRage);
		model.addAttribute("firstday", DateTimeUtil.gettWeekFirstDay());
		model.addAttribute("lastday", DateTimeUtil.gettWeekLastDay());
		return "admin/listMemberResult";
	}

	@PostMapping("/addUserGroup")
	public String addUsersToGroup(Model model, @RequestParam("listUser[]") List<Integer> listIdUsers,
			@RequestParam("idGroup") int idGroup) throws ParseException {
		List<User> users = userAdminServiceImpl.getListUsers(listIdUsers);

		Group groupToAdd = groupService.getGroupById(idGroup);
		
		//Check xem số lượng còn đủ chỗ trống không
		int vacancy = groupToAdd.getMaxMem() - groupToAdd.getTotalMem();
		String messageAdd = "";
		if(listIdUsers.size() > vacancy) {
			 messageAdd = ""+messageConfig.getProperty("add.failed")+ ": Số lượng thành viên thêm vào vượt quá tối đa";
			List<MemberDTO> members = groupService.getListMember(idGroup);
			model.addAttribute("members", members);
			model.addAttribute("messageadd", messageAdd);
			return "admin/listMember";
		}
		
		for (User user : users) {
			groupToAdd.getUsers().add(user);
			groupToAdd.setTotalMem(groupToAdd.getTotalMem() + 1);
		}
		groupService.saveGroup(groupToAdd);

		// notify user
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		TutorialAdmin currentUser = nguoiDungService.findTutorialAdminByEmail(auth.getName());
		for (User user : users) {
			notificationService.pushAddGroupNotification("" + user.getId(), currentUser.getUsername(),
					groupToAdd.getName());
			// after notify user send notification for every user
			Notification notification = new Notification();
			String message = messageConfig.getProperty("noti.addgroup");
			String result = MessageFormat.format(message, currentUser.getUsername(), groupToAdd.getName());
			notification.setBrief(result);
			notification.setType(Notification.TYPE_ADD_GROUP);
			notification.setDateSend(new Date());
			notification.setUser(user);

			// get url of group
			String url = messageConfig.getProperty("noti.group.url");
			String urlFormat = MessageFormat.format(url, groupToAdd.getIdGroup());
			notification.setHyperLink(urlFormat);
			notificationService.saveNotification(notification);
		}
		 messageAdd = ""+messageConfig.getProperty("add.success");
		model.addAttribute("messageadd", messageAdd);
		List<MemberDTO> members = groupService.getListMember(idGroup);
		model.addAttribute("members", members);
		return "admin/listMember";
	}

	@PostMapping("/deleteUserGroup")
	public String deleteFromGroup(Model model, @RequestParam("idUser") int idUser,
			@RequestParam("idGroup") int idGroup) {
		User user = userAdminServiceImpl.getUserById(idUser);
		Group groupToDel = groupService.getGroupById(idGroup);
		groupToDel.getUsers().remove(user);
		groupToDel.setTotalMem(groupToDel.getTotalMem() - 1);
		groupService.saveGroup(groupToDel);
		List<MemberDTO> members = groupService.getListMember(idGroup);
		model.addAttribute("members", members);
		return "admin/listMember";
	}

}
