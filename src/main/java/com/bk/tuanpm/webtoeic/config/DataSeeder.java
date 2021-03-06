package com.bk.tuanpm.webtoeic.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.Admin;
import com.bk.tuanpm.webtoeic.entities.PartToeic;
import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.repository.AdminRepository;
import com.bk.tuanpm.webtoeic.repository.AccountRepository;
import com.bk.tuanpm.webtoeic.repository.PartRepository;
import com.bk.tuanpm.webtoeic.repository.UserRepository;
import com.bk.tuanpm.webtoeic.service.RoleService;

@Component
public class DataSeeder implements ApplicationListener<ContextRefreshedEvent> {

	@Autowired
	private AccountRepository accountRepository;
	@Autowired
	private AdminRepository adminRepository;
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private PartRepository partRepository;

	@Override
	public void onApplicationEvent(ContextRefreshedEvent arg0) {
		
		if (roleService.getRoleCode(1) == null) {
			Role role = new Role();
			role.setCode(1);
			role.setRole("ROLE_ADMIN");
			roleService.saveRole(role);
		}
		if (roleService.getRoleCode(2) == null) {
			Role role = new Role();
			role.setCode(2);
			role.setRole("ROLE_MEMBER");
			roleService.saveRole(role);
		}
		if (roleService.getRoleCode(3) == null) {
			Role role = new Role();
			role.setCode(3);
			role.setRole("ROLE_MEMBER_VIP");
			roleService.saveRole(role);
		}
		if (roleService.getRoleCode(4) == null) {
			Role role = new Role();
			role.setCode(4);
			role.setRole("ROLE_CONTENT");
			roleService.saveRole(role);
		}
		
		// Admin account
		if (accountRepository.findByEmail("admin@gmail.com") == null) {
			Admin admin = new Admin();
			admin.setEmail("admin@gmail.com");
			admin.setUsername("tuanminh96");
			admin.setPassword(passwordEncoder.encode("12345689"));
			admin.setHoTen("Tu???n Minh");
			admin.setSoDienThoai("123456789");
			admin.setRole(roleService.getRole(1));
			accountRepository.save(admin);
		}

		// Member account
		if (accountRepository.findByEmail("member@gmail.com") == null) {
			User member = new User();
			member.setHoTen("Phan Minh Tuan");
			member.setUsername("tuanminh2k");
			member.setSoDienThoai("123456789");
			member.setEmail("member@gmail.com");
			member.setPassword(passwordEncoder.encode("12345689"));
			member.setRole(roleService.getRole(2));
			accountRepository.save(member);
		}
		//Add role
		
		
		
		if(partRepository.findByPartName("Part I") == null) {
			PartToeic partToeic = new PartToeic();
			partToeic.setPartName("Part I");
			partToeic.setDescription("Look at the picture and listen to the sentences. Choose the sentence that best describes the picture:");
			partToeic.setType("Listening");
			partRepository.save(partToeic);
		}
		if(partRepository.findByPartName("Part II") == null) {
			PartToeic partToeic = new PartToeic();
			partToeic.setPartName("Part II");
			partToeic.setDescription("Listen to the question and the three responses. Choose the response that best answers the question:");
			partToeic.setType("Listening");
			partRepository.save(partToeic);
		}
		if(partRepository.findByPartName("Part III") == null) {
			PartToeic partToeic = new PartToeic();
			partToeic.setPartName("Part III");
			partToeic.setDescription("Listen to the dialogue. Then read each question and choose the best answer:");
			partToeic.setType("Listening");
			partRepository.save(partToeic);
		}
		if(partRepository.findByPartName("Part IV") == null) {
			PartToeic partToeic = new PartToeic();
			partToeic.setPartName("Part IV");
			partToeic.setDescription("Listen to the talk. Then read each question and choose the best answer:");
			partToeic.setType("Listening");
			partRepository.save(partToeic);
		}
		if(partRepository.findByPartName("Part V") == null) {
			PartToeic partToeic = new PartToeic();
			partToeic.setPartName("Part V");
			partToeic.setDescription("Choose the word that best completes the sentence:");
			partToeic.setType("Reading");
			partRepository.save(partToeic);
		}
		if(partRepository.findByPartName("Part VI") == null) {
			PartToeic partToeic = new PartToeic();
			partToeic.setPartName("Part VI");
			partToeic.setDescription("Choose the word or phrase that best completes the blanks:");
			partToeic.setType("Reading");
			partRepository.save(partToeic);
		}
		if(partRepository.findByPartName("Part VII") == null) {
			PartToeic partToeic = new PartToeic();
			partToeic.setPartName("Part VII");
			partToeic.setDescription("Read the passage and choose the correct answer");
			partToeic.setType("Reading");
			partRepository.save(partToeic);
		}
	}
}
