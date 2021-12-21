package com.bk.tuanpm.webtoeic.controller.admin;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bk.tuanpm.webtoeic.config.MessageConfig;
import com.bk.tuanpm.webtoeic.dto.MemberDTO;
import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.Remark;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.repository.TutorialAdminRepository;
import com.bk.tuanpm.webtoeic.service.GroupService;
import com.bk.tuanpm.webtoeic.service.RemarkService;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;

@RestController
@RequestMapping("/admin")
public class RemarkController {

	@Autowired
	GroupService groupService;
	@Autowired
	UserAdminServiceImpl nguoiDungService;
	@Autowired
	TutorialAdminRepository adminRepository;
	
	@Autowired
	UserAdminServiceImpl userAdminServiceImpl;
	
	@Autowired
	MessageConfig messageConfig;
	
	@Autowired
	RemarkService remarkService;

	@PostMapping(value = "/addRemark")
	@ResponseBody
	public ResponseEntity<String> addGroup(Model model, @RequestParam("idMem") int idMem,
			@RequestParam("remark") String remark,
			@RequestParam("dateRange") String dateRange,
			@RequestParam("weekNum") String weekNum) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		TutorialAdmin currentUser = nguoiDungService.findAdminByEmail(auth.getName());
		User userAdded = userAdminServiceImpl.getUserById(idMem);
		Remark remarkToAdd = new Remark();
		remarkToAdd.setRemark(remark);
		remarkToAdd.setTimeRemark(new Date());
		remarkToAdd.setAdminRemark(currentUser);
		remarkToAdd.setDateRange(dateRange);
		remarkToAdd.setWeekNum(weekNum); 
		remarkToAdd.setUser(userAdded);
		
		remarkService.saveRemarkForUser(remarkToAdd);
		String message = messageConfig.getProperty("add.success")+" Nhận xét cho: "+userAdded.getHoTen()+ "";
		return new ResponseEntity<String>(message, HttpStatus.OK);
	}
	
	

}
