package com.bk.tuanpm.webtoeic.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.ContentAdmin;
import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;
import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.repository.AccountRepository;
import com.bk.tuanpm.webtoeic.repository.ContentAdminRepository;
import com.bk.tuanpm.webtoeic.repository.RoleRepository;
import com.bk.tuanpm.webtoeic.repository.UserRepository;

@Service
@Transactional
public class UserAdminServiceImpl {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private AccountRepository nguoiDungRepo;

	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private ContentAdminRepository contentAdminRepository;

	public Account findByEmail(String email) {
		return nguoiDungRepo.findByEmail(email);
	}

	public TutorialAdmin findAdminByEmail(String email) {
		return nguoiDungRepo.findAdminByEmail(email);
	}

	public ContentAdmin findContentByEmail(String email) {
		return contentAdminRepository.findByEmail(email);
	}

	public Account findByConfirmationToken(String confirmationToken) {
		return null;
	}

	public Account saveUser(Account nd) {
		nd.setPassword(bCryptPasswordEncoder.encode(nd.getPassword()));
		return nguoiDungRepo.save(nd);
	}
	
	public Account saveUserNotPass(Account nd) {
		return nguoiDungRepo.save(nd);
	}

	public Account findById(long id) {
		Account nd = nguoiDungRepo.findById(id).get();
		return nd;
	}

	public Account updateUser(Account nd) {
		return nguoiDungRepo.save(nd);
	}

	public void changePass(Account nd, String newPass) {
		nd.setPassword(bCryptPasswordEncoder.encode(newPass));
		nguoiDungRepo.save(nd);
	}

	public Page<Account> findByVaiTro(int page, Role vaiTro) {
		return nguoiDungRepo.findByRole(vaiTro, PageRequest.of(page - 1, 6));
	}

	public void deleteById(long id) {
		nguoiDungRepo.deleteById(id);
	}

	public List<User> getListVipNotAdded() {
		Role role = roleRepository.findByCode(Role.ROLE_MEMBER_VIP);
		List<User> list = userRepository.findByRoleAndGroupsIsNull(role);
		return list;
	}

	public List<User> getListUsers(List<Integer> idUsers) {
		return userRepository.findAllById(idUsers);
	}

	public User getUserById(int id) {
		return userRepository.findById(id);
	}

	public User findUserByEmail(String email) {
		return userRepository.findByEmail(email);
	}
}
