package com.bk.tuanpm.webtoeic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.Admin;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.GroupMember;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.repository.GroupMemberRepository;
import com.bk.tuanpm.webtoeic.repository.AccountRepository;
import com.bk.tuanpm.webtoeic.repository.UserRepository;
import com.bk.tuanpm.webtoeic.service.GroupMemberService;
import com.bk.tuanpm.webtoeic.service.GroupService;

@Service
public class GroupMemberServieImpl implements GroupMemberService {

	@Autowired
	GroupMemberRepository groupMemberRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	GroupService groupService;
	
	@Override
	public GroupMember getGroupMember(int idGroup, int idMem) {
		return groupMemberRepository.findByGroupAndUser(idGroup, idMem);
	}
}
