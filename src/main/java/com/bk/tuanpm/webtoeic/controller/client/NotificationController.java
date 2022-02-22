package com.bk.tuanpm.webtoeic.controller.client;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.bk.tuanpm.webtoeic.service.SendingEmailService;
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
	
	@Autowired
	private SendingEmailService sendingEmailService;
	
	@GetMapping("/listnoti/{idMember}")
	public String getNotficationForUser(Model model, @PathVariable Integer idMember) {
		try {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            User currentUser = nguoiDungService.findUserByEmail(auth.getName());
//            sendingEmailService.sendingEmail(currentUser);
            List<Notification> list = notificationServiceImpl.getListNotifiByUser(currentUser);
            model.addAttribute("listData", list);
		} catch (Exception e) {
            e.printStackTrace();
            return "client/error";
        }
		return "client/notifications";
	}
	
	@GetMapping("/detailnoti/{idNoti}")
	public String getDetailNotfication(Model model, @PathVariable Integer idNoti , HttpServletRequest request) {
		try {
			Notification notification = notificationServiceImpl.findByIdNoti(idNoti);
			if(notification.getDateSeen()==null) {
				notification.setDateSeen(new Date());
				//Tru so thong bao hien tai di 1
				HttpSession session = request.getSession();
				int totalNoti = (Integer) session.getAttribute("count_notifi");
				session.setAttribute("count_notifi", totalNoti-1);
				notification = notificationServiceImpl.saveNotification(notification);
			}
			model.addAttribute("notification", notification);
		} catch(Exception e) {
            e.printStackTrace();
            return "client/error";
        }
		return "client/notificationDetail";
	}

}
