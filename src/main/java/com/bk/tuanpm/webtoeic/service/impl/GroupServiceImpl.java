package com.bk.tuanpm.webtoeic.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.repository.GroupRepository;
import com.bk.tuanpm.webtoeic.service.GroupService;
@Service
public class GroupServiceImpl implements GroupService{

	@Autowired
	private GroupRepository groupRepository;
	
	@Override
	public Group saveGroup(Group group) {
		// TODO Auto-generated method stub
		group.setCreateDate(new Date());
		return groupRepository.save(group);
	}

	@Override
	public List<Group> saveGroups(List<Group> groups) {
		// TODO Auto-generated method stub
		return groupRepository.saveAll(groups);
	}

}
