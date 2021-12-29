package com.bk.tuanpm.webtoeic.controller.admin;

import java.text.MessageFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bk.tuanpm.webtoeic.config.MessageConfig;
import com.bk.tuanpm.webtoeic.dto.MemberDTO;
import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.Notification;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.repository.TutorialAdminRepository;
import com.bk.tuanpm.webtoeic.service.GroupService;
import com.bk.tuanpm.webtoeic.service.NotificationService;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;
import com.bk.tuanpm.webtoeic.util.DateTimeUtil;

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

	@PostMapping(value = "/addGroup", produces = MediaType.APPLICATION_JSON_VALUE)
	public String addGroup(Model model, @RequestBody Group group) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		TutorialAdmin currentUser = nguoiDungService.findAdminByEmail(auth.getName());
		System.out.println(currentUser);
		group.setCreateAdmin(currentUser);
		groupService.saveGroup(group);

		List<Group> groups = groupService.getGroupOfAdmin(currentUser);
		model.addAttribute("groups", groups);
		return "admin/listGroupAdmin";
	}

	@GetMapping("/group_detail/{idGroup}")
	public String getGroup(Model model, @PathVariable Integer idGroup) {
		Group group = groupService.getGroupById(idGroup);
		model.addAttribute("group", group);
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
		for (User user : users) {
			groupToAdd.getUsers().add(user);
		}
		groupService.saveGroup(groupToAdd);

		// notify user
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		TutorialAdmin currentUser = nguoiDungService.findAdminByEmail(auth.getName());
		for (User user : users) {
			notificationService.pushAddGroupNotification("" + user.getId(), currentUser.getUsername(),
					groupToAdd.getName());
			// after notify user send notification for every user
			Notification notification = new Notification();
			String message = messageConfig.getProperty("noti.addgroup");
			String result = MessageFormat.format(message, currentUser.getUsername(), groupToAdd.getName());
			notification.setBrief(result);
			notification.setType(Notification.TYPE_ADD_GROUP);
			notification.setDateSend(DateTimeUtil.convertDateToDate(new Date()));
			notification.setUser(user);

			// get url of group
			String url = messageConfig.getProperty("noti.group.url");
			String urlFormat = MessageFormat.format(url, groupToAdd.getIdGroup());
			notification.setHyperLink(urlFormat);
			notificationService.saveNotification(notification);
		}

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
		groupService.saveGroup(groupToDel);
		List<MemberDTO> members = groupService.getListMember(idGroup);
		model.addAttribute("members", members);
		return "admin/listMember";
	}

}
