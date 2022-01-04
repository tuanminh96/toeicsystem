package com.bk.tuanpm.webtoeic.repository;

import java.util.List;
import java.util.Set;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;
import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.entities.User;

@Repository
public interface AccountRepository extends JpaRepository<Account, Long> {

	Account findByEmail(String email);
	
	Account findByUsername(String newUsername);
	
	Page<Account> findByRole(Role vaiTro, Pageable of);

	List<Account> findByRole(Role vaiTro);

	TutorialAdmin findAdminByEmail(String email);	
	
	public User findById(int id);
	
}
