package com.bk.tuanpm.webtoeic.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.bk.tuanpm.webtoeic.entities.NguoiDung;
import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.repository.NguoiDungRepository;
import com.bk.tuanpm.webtoeic.service.RoleService;

@Component
public class DataSeeder implements ApplicationListener<ContextRefreshedEvent> {

	@Autowired
	private NguoiDungRepository userRepository;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private RoleService roleService;

	@Override
	public void onApplicationEvent(ContextRefreshedEvent arg0) {
		// Admin account
		if (userRepository.findByEmail("admin@gmail.com") == null) {
			NguoiDung admin = new NguoiDung();
			admin.setEmail("admin@gmail.com");
			admin.setPassword(passwordEncoder.encode("123456"));
			admin.setHoTen("Nguyễn Xuân Nam");
			admin.setSoDienThoai("123456789");
			admin.setRole(roleService.getRole(1));
			userRepository.save(admin);
		}

		// Member account
		if (userRepository.findByEmail("member@gmail.com") == null) {
			NguoiDung member = new NguoiDung();
			member.setHoTen("Đào Huy Chương");
			member.setSoDienThoai("123456789");
			member.setEmail("member@gmail.com");
			member.setPassword(passwordEncoder.encode("123456"));
			member.setRole(roleService.getRole(2));
			userRepository.save(member);
		}
	}
}
