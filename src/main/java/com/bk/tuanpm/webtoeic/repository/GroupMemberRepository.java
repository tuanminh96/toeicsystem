package com.bk.tuanpm.webtoeic.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.GroupMember;
import com.bk.tuanpm.webtoeic.entities.User;

@Repository
public interface GroupMemberRepository extends JpaRepository<GroupMember, Integer> {
	public GroupMember findByGroupAndUser(int idGroup, int idUser);
}
