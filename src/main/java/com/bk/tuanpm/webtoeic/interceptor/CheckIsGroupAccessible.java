package com.bk.tuanpm.webtoeic.interceptor;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.HandlerMapping;

import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.service.GroupService;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;

@Component
public class CheckIsGroupAccessible implements HandlerInterceptor {

	@Autowired
	UserAdminServiceImpl userAdminServiceImpl;

	@Autowired
	GroupService groupService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User userFromDatabase = userAdminServiceImpl.findUserByEmail(auth.getName());
		if(userFromDatabase==null||userFromDatabase.getRole().getCode() != Role.ROLE_MEMBER_VIP) {
			return false;
		}
		TutorialAdmin tutorialAdmin = userAdminServiceImpl.findTutorialAdminByEmail(auth.getName());
		if (userFromDatabase != null && userFromDatabase.getRole().getCode() == Role.ROLE_MEMBER_VIP) {
			Map pathVariables = (Map) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
			if (pathVariables.containsKey("idGroup")) {
				int idGroup = Integer.parseInt((String) pathVariables.get("idGroup")) ;
				if (!groupService.checkUserInGroup(idGroup, userFromDatabase.getId())) {
					return false;
				}
				if(tutorialAdmin!=null && !groupService.checkIsAdminGroup(idGroup, tutorialAdmin.getId())) {
					return false;
				}
			}
		}
		return true;
	}
}
