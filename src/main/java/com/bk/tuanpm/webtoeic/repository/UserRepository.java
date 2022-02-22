package com.bk.tuanpm.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	public User findById(int id);
	
	public User findByEmail(String email);
	
	public List<User> findByRoleAndGroupsIsNullOrderByUpgradeDateAsc(Role role);
	
	public List<User> findByIdIn(List<Integer> ids);
	
	public long countByRole(Role role);
	
}
