package com.bk.tuanpm.webtoeic.service.impl;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.repository.AccountRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private AccountRepository repo;

	@Override
	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		Account nguoiDung = repo.findByEmail(username);
		if (nguoiDung == null) {
			throw new UsernameNotFoundException("User with email " + username + " was not be found");
		}

		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		Role vaiTro = nguoiDung.getRole();
		grantedAuthorities.add(new SimpleGrantedAuthority(vaiTro.getRole()));
		return new User(username, nguoiDung.getPassword(), grantedAuthorities);
	}
}
