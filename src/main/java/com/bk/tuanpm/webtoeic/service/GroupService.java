package com.bk.tuanpm.webtoeic.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.Group;


public interface GroupService {
	public Group saveGroup(Group group);
	
	public List<Group> saveGroups(List<Group> groups);
}
