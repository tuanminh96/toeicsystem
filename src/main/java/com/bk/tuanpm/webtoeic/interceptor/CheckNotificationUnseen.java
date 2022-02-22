package com.bk.tuanpm.webtoeic.interceptor;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.service.NotificationService;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;

@Component
public class CheckNotificationUnseen implements HandlerInterceptor {
	
	@Autowired
	UserAdminServiceImpl userAdminServiceImpl;
	
	@Autowired
	NotificationService notificationService;
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User userFromDatabase = userAdminServiceImpl.findUserByEmail(auth.getName());
        
        if(userFromDatabase!=null &&
        		userFromDatabase.getRole().getCode() == Role.ROLE_MEMBER_VIP) {
        	HttpSession session = request.getSession();
            int count_notifi = notificationService.countNotificationByUserAndDateSeenIsNull(userFromDatabase);
    		session.setAttribute("count_notifi", count_notifi);
        }
        return true;
    }
}
