package com.bk.tuanpm.webtoeic.repository;

import java.util.List;
import java.util.Set;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.Admin;
import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.entities.User;

@Repository
public interface NguoiDungRepository extends JpaRepository<Account, Long> {

	Account findByEmail(String email);
	
	Page<Account> findByRole(Role vaiTro, Pageable of);

	List<Account> findByRole(Role vaiTro);

	Admin findAdminByEmail(String email);	
	
}
