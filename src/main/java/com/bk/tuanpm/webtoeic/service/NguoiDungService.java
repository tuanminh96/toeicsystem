package com.bk.tuanpm.webtoeic.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.repository.NguoiDungRepository;

@Service
@Transactional
public class NguoiDungService {

	@Autowired
	private NguoiDungRepository nguoiDungRepo;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	public Account findByEmail(String email) {
		return nguoiDungRepo.findByEmail(email);
	}

	public Account findByConfirmationToken(String confirmationToken) {
		return null;
	}

	public Account saveUser(Account nd) {
		nd.setPassword(bCryptPasswordEncoder.encode(nd.getPassword()));
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
}
