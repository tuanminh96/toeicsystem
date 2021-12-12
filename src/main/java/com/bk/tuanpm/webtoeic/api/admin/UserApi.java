package com.bk.tuanpm.webtoeic.api.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;

@RestController
@RequestMapping("/admin")
public class UserApi {
	
	@Autowired 
	UserAdminServiceImpl userAdminServiceImpl;
	
	@GetMapping("/getVipNotAdded")
	@ResponseBody
	public List<User> getUserVIPNotAdded() {
		List<User> users = userAdminServiceImpl.getListVipNotAdded();
		return users;
	}
}
