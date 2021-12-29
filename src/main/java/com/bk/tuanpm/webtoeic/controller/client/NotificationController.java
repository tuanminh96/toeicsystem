package com.bk.tuanpm.webtoeic.controller.client;

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

import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.Notification;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.service.GroupService;
import com.bk.tuanpm.webtoeic.service.NotificationService;
import com.bk.tuanpm.webtoeic.service.impl.NotificationServiceImpl;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;

@Controller
public class NotificationController {

	@Autowired
	GroupService groupService;
	
	@Autowired
    private UserAdminServiceImpl nguoiDungService;
	
	@Autowired
    private NotificationService notificationServiceImpl;

	@GetMapping("/listnoti/{idMember}")
	public String getNotficationForUser(Model model, @PathVariable Integer idMember) {
		try {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            User currentUser = nguoiDungService.findUserByEmail(auth.getName());
            
            List<Notification> list = notificationServiceImpl.getListNotifiByUser(currentUser);
            model.addAttribute("listData", list);
		} catch (Exception e) {
            e.printStackTrace();
            return "client/error";
        }
		return "client/notifications";
	}
	
	@GetMapping("/detailnoti/{idNoti}")
	public String getDetailNotfication(Model model, @PathVariable Integer idNoti) {
		return "client/notificationDetail";
	}

}
