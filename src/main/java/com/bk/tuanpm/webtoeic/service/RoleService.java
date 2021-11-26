package com.bk.tuanpm.webtoeic.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.Role;

public interface RoleService {
	public Role getRole(int id);
	
	public List<Role> getListRoles();
}
