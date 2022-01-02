package com.bk.tuanpm.webtoeic.service;

import java.util.List;

import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.GroupMember;

public interface GroupMemberService {

	GroupMember getGroupMember(int idGroup, int idMem);

	List<GroupMember> findGroupsOfUser(int idUser);

}
