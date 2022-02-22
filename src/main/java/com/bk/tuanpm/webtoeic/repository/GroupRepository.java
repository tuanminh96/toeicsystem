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
	
	@Query(value="SELECT count(*) FROM group_member gm WHERE gm.id_group = ?1 AND gm.id_user = ?2 ", nativeQuery=true)
	public int findUserInGroup(int idGroup, int idUser);
	
	@Query(value="SELECT count(*) FROM group gm WHERE g.id_group = ?1 AND g.id_admin = ?2 ", nativeQuery=true)
	public int findAdminInGroup(int idGroup, int idAmin);
}
