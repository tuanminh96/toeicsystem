package com.bk.tuanpm.webtoeic.service.impl;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.dto.MemberDTO;
import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;
import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.repository.GroupRepository;
import com.bk.tuanpm.webtoeic.repository.UserRepository;
import com.bk.tuanpm.webtoeic.service.GroupMemberService;
import com.bk.tuanpm.webtoeic.service.GroupService;
@Service
public class GroupServiceImpl implements GroupService{

	@Autowired
	private GroupRepository groupRepository;
	
	@Autowired
	private GroupMemberService groupMemberService;
	
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
	@Override
	public List<Group> getGroupOfAdmin(TutorialAdmin admin) {
		// TODO Auto-generated method stub
		return groupRepository.findByCreateAdmin(admin);
	}
	
	@Override
	public Group getGroupById(Integer id) {
		// TODO Auto-generated method stub
		return groupRepository.getOne(id);
	}
	
	@Override
	public List<MemberDTO> getListMember(Integer idGroup) {
		// TODO Auto-generated method stub
		Group group = groupRepository.findByIdGroup(idGroup);
		List<User> members = group.getUsers();
		List<MemberDTO> listMem = new ArrayList<>();
		for (User user : members) {
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMemId(user.getId());
			memberDTO.setMemName(user.getUsername());
			memberDTO.setFullName(user.getHoTen());
			memberDTO.setDateAdd(groupMemberService.getGroupMember(idGroup, user.getId()).getAddDate());
			listMem.add(memberDTO);
		}
		return listMem;
	}


	@Override
	public int getTotalGroupThisYear() {
		// TODO Auto-generated method stub
		LocalDate now = LocalDate.now();
		return groupRepository.getTotalGroupThisYear("G-"+now.getYear());
	}
	
	@Override
	public boolean checkUserInGroup(int idGr, int idUser) {
		if(groupRepository.findUserInGroup(idGr, idUser) != 0) {
			return true;
		}
		else {
			return false;
		}
	}
	@Override
	public boolean checkIsAdminGroup(int idGr, int admin) {
		if(groupRepository.findAdminInGroup(idGr, admin) != 0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	public long getTotalGroup() {
		return groupRepository.count();
	}
	
	@Override
	public List<Group> getListTotalGroup() {
		return groupRepository.findAll();
	}

}
