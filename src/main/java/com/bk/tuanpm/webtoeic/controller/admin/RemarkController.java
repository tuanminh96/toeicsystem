package com.bk.tuanpm.webtoeic.controller.admin;

import java.text.MessageFormat;
import java.text.ParseException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bk.tuanpm.webtoeic.config.MessageConfig;
import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;
import com.bk.tuanpm.webtoeic.entities.Notification;
import com.bk.tuanpm.webtoeic.entities.Remark;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.repository.TutorialAdminRepository;
import com.bk.tuanpm.webtoeic.service.GroupService;
import com.bk.tuanpm.webtoeic.service.NotificationService;
import com.bk.tuanpm.webtoeic.service.RemarkService;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;
import com.bk.tuanpm.webtoeic.util.DateTimeUtil;

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
	
	@Autowired
	NotificationService notificationService;

	@PostMapping(value = "/addRemark")
	@ResponseBody
	public ResponseEntity<String> addGroup(Model model, @RequestParam("idMem") int idMem,
			@RequestParam("remark") String remark,
			@RequestParam("dateRange") String dateRange,
			@RequestParam("weekNum") String weekNum) throws ParseException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		TutorialAdmin currentUser = nguoiDungService.findTutorialAdminByEmail(auth.getName());
		User userAdded = userAdminServiceImpl.getUserById(idMem);
		Remark remarkToAdd = new Remark();
		remarkToAdd.setRemark(remark);
		remarkToAdd.setTimeRemark(new Date());
		remarkToAdd.setAdminRemark(currentUser);
		remarkToAdd.setDateRange(dateRange);
		remarkToAdd.setWeekNum(weekNum); 
		remarkToAdd.setUser(userAdded);
		
		remarkService.saveRemarkForUser(remarkToAdd);
		//push remark notifcation to user
		notificationService.pushRemarkNotification(""+userAdded.getId(), 
				""+currentUser.getUsername(),
				""+weekNum);
		
		//thêm notification vào database
		Notification notification = new Notification();
		String mess = messageConfig.getProperty("noti.remark");
		String result = MessageFormat.format(mess, currentUser.getUsername() , weekNum);
		notification.setBrief(result);
		notification.setContent(remark);
		notification.setType(Notification.TYPE_REMARK);
		notification.setDateSend(DateTimeUtil.convertDateToDate(new Date()));
		notification.setUser(userAdded);
		notificationService.saveNotification(notification);
		
		String messageReturn = messageConfig.getProperty("add.success")+" Nhận xét cho: "+userAdded.getHoTen()+ "";
		return new ResponseEntity<String>(messageReturn, HttpStatus.OK);
	}
}
