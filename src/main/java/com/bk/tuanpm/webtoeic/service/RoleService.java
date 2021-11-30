package com.bk.tuanpm.webtoeic.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.Role;

public interface RoleService {
	public Role getRole(int id);
	
	public Role getRoleCode(int code);
	
	public List<Role> getListRoles();
	
	public List<Role> saveRoles(List<Role> roles);
	
	public Role saveRole(Role roles);
}
