package com.bk.tuanpm.webtoeic.interceptor;

import java.util.HashSet;
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

import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;

@Component
public class CheckRoleInterceptor implements HandlerInterceptor {
	
	@Autowired
	UserAdminServiceImpl userAdminServiceImpl;
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Set<GrantedAuthority> authorities = new HashSet<>();
        User userFromDatabase = userAdminServiceImpl.findUserByEmail(auth.getName());
        if (userFromDatabase != null) {
            // add whatever authorities you want here
            authorities.add(new SimpleGrantedAuthority(userFromDatabase.getRole().getRole())); 
        }

        Authentication newAuth = null;
        SecurityContextHolder.getContext().setAuthentication(newAuth);
        return true;
    }
}
