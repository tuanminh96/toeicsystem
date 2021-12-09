package com.bk.tuanpm.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.Admin;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.User;

@Repository
public interface GroupRepository extends JpaRepository<Group, Integer> {
	public List<Group> findByCreateAdmin(Admin admin);
	
	public Group findByIdGroup(Integer id);
	
	public List<User> findUsersByIdGroup(int id);
}
