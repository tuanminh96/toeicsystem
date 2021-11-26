package com.bk.tuanpm.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Integer>{
	public Role findByIdRole(int id);
	
	public List<Role> findAll();
}
