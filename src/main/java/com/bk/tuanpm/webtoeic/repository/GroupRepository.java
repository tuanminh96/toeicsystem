package com.bk.tuanpm.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.User;

@Repository
public interface GroupRepository extends JpaRepository<Group, Integer> {
	public List<Group> findByCreateAdmin(TutorialAdmin admin);
	
	public Group findByIdGroup(Integer id);
	
	public List<User> findUsersByIdGroup(int id);
	
	@Query("SELECT count(g) FROM Group g WHERE g.groupCode LIKE ?1% ")
	public int getTotalGroupThisYear(String year);
}
