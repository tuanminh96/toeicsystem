package com.bk.tuanpm.webtoeic.api.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bk.tuanpm.webtoeic.config.MessageConfig;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;
import com.bk.tuanpm.webtoeic.service.GroupService;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;

@RestController
public class GroupApi {
	
	@Autowired
	UserAdminServiceImpl nguoiDungService;
	@Autowired
	GroupService groupService;
	
	@Autowired
	MessageConfig messageConfig;
	
	@GetMapping({ "/api/group" })
	@ResponseBody
	public List<Group> quanLyGroup() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		TutorialAdmin currentUser = nguoiDungService.findTutorialAdminByEmail(auth.getName());
		List<Group> groups = groupService.getGroupOfAdmin(currentUser);
		return groups;
	}
	@DeleteMapping({ "/api/delGroup/{idGroup}" })
	@ResponseBody
	public ResponseEntity<String> delGroup(@PathVariable("idGroup") int idGroup) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		TutorialAdmin currentUser = nguoiDungService.findTutorialAdminByEmail(auth.getName());
		Group group = groupService.getGroupById(idGroup);
		group.setDelFlag(1);
		
		try {
			groupService.saveGroup(group);
			String message = messageConfig.getProperty("add.success") + "nhóm học tập này";
			return new ResponseEntity<>(message, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}
}
