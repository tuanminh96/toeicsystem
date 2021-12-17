package com.bk.tuanpm.webtoeic.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.dto.MemberDTO;
import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.User;


public interface GroupService {
	public Group saveGroup(Group group);
	
	public List<Group> saveGroups(List<Group> groups);

	List<Group> getGroupOfAdmin(TutorialAdmin admin);

	Group getGroupById(Integer id);

	List<MemberDTO> getListMember(Integer idGroup);
}
