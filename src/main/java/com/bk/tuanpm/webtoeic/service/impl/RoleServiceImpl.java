package com.bk.tuanpm.webtoeic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.repository.RoleRepository;
import com.bk.tuanpm.webtoeic.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	RoleRepository roleRepository;
	
	@Override
	public Role getRole(int id) {
		// TODO Auto-generated method stub
		return roleRepository.findByIdRole(id);
	}

	@Override
	public List<Role> getListRoles() {
		// TODO Auto-generated method stub
		return roleRepository.findAll();
	}

	@Override
	public List<Role> saveRoles(List<Role> roles) {
		// TODO Auto-generated method stub
		return roleRepository.saveAll(roles);
	}

	@Override
	public Role saveRole(Role role) {
		// TODO Auto-generated method stub
		return roleRepository.save(role);
	}

	@Override
	public Role getRoleCode(int code) {
		// TODO Auto-generated method stub
		return roleRepository.findByCode(code);
	}

}
