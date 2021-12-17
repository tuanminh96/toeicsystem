package com.bk.tuanpm.webtoeic.config;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.ContentAdmin;
import com.bk.tuanpm.webtoeic.entities.ManagerAdmin;
import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;
import com.bk.tuanpm.webtoeic.entities.PartToeic;
import com.bk.tuanpm.webtoeic.entities.Role;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.repository.TutorialAdminRepository;
import com.bk.tuanpm.webtoeic.repository.AccountRepository;
import com.bk.tuanpm.webtoeic.repository.ContentAdminRepository;
import com.bk.tuanpm.webtoeic.repository.ManagerAdminRepository;
import com.bk.tuanpm.webtoeic.repository.PartRepository;
import com.bk.tuanpm.webtoeic.repository.UserRepository;
import com.bk.tuanpm.webtoeic.service.RoleService;

@Component
public class DataSeeder implements ApplicationListener<ContextRefreshedEvent> {

	@Autowired
	private AccountRepository accountRepository;
	@Autowired
	private TutorialAdminRepository tutorialAdminRepository;

	@Autowired
	private ContentAdminRepository contentAdminRepo;

	@Autowired
	private ManagerAdminRepository managerAdminRepo;
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
			role.setRole("ROLE_TUTORIAL");
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
		// Add role
		if (roleService.getRoleCode(5) == null) {
			Role role = new Role();
			role.setCode(5);
			role.setRole("ROLE_MANAGER");
			roleService.saveRole(role);
		}

		// Add user
		if (userRepository.findByEmail("user1@gmail.com") == null) {
			User user = new User();
			user.setEmail("user1@gmail.com");
			user.setPassword(passwordEncoder.encode("123456789"));
			user.setUsername("tuanmino96");
			user.setAddDate(new Date());
			user.setRole(roleService.getRole(2));
			userRepository.save(user);
		}
		// Add user VIP
		if (userRepository.findByEmail("uservip1@gmail.com") == null) {
			User user = new User();
			user.setEmail("uservip1@gmail.com");
			user.setPassword(passwordEncoder.encode("123456789"));
			user.setUsername("tuanmino97");
			user.setAddDate(new Date());
			user.setRole(roleService.getRole(3));
			userRepository.save(user);
		}
		if (userRepository.findByEmail("uservip2@gmail.com") == null) {
			User user = new User();
			user.setEmail("uservip2@gmail.com");
			user.setPassword(passwordEncoder.encode("123456789"));
			user.setUsername("tuanmino98");
			user.setAddDate(new Date());
			user.setRole(roleService.getRole(3));
			userRepository.save(user);
		}
		if (userRepository.findByEmail("uservip3@gmail.com") == null) {
			User user = new User();
			user.setEmail("uservip3@gmail.com");
			user.setPassword(passwordEncoder.encode("123456789"));
			user.setUsername("tuanmino99");
			user.setAddDate(new Date());
			user.setRole(roleService.getRole(3));
			userRepository.save(user);
		}
		if (userRepository.findByEmail("uservip4@gmail.com") == null) {
			User user = new User();
			user.setEmail("uservip4@gmail.com");
			user.setPassword(passwordEncoder.encode("123456789"));
			user.setUsername("tuanmino2k");
			user.setAddDate(new Date());
			user.setRole(roleService.getRole(3));
			userRepository.save(user);
		}
		// Add content
		if (contentAdminRepo.findByEmail("contentadmin1@gmail.com") == null) {
			ContentAdmin ctadmin = new ContentAdmin();
			ctadmin.setEmail("contentadmin1@gmail.com");
			ctadmin.setPassword(passwordEncoder.encode("123456789"));
			ctadmin.setUsername("tuanmino2k2");
			ctadmin.setRole(roleService.getRole(4));
			contentAdminRepo.save(ctadmin);
		}
		// Add content
		if (managerAdminRepo.findByEmail("manageradmin1@gmail.com") == null) {
			ManagerAdmin ctadmin = new ManagerAdmin();
			ctadmin.setEmail("manageradmin1@gmail.com");
			ctadmin.setPassword(passwordEncoder.encode("123456789"));
			ctadmin.setUsername("tuanmino2k3");
			ctadmin.setRole(roleService.getRole(5));
			managerAdminRepo.save(ctadmin);
		}
		// Add tutorial
		if (tutorialAdminRepository.findByEmail("ttadmin1@gmail.com") == null) {
			TutorialAdmin ttadmin = new TutorialAdmin();
			ttadmin.setEmail("ttadmin1@gmail.com");
			ttadmin.setPassword(passwordEncoder.encode("123456789"));
			ttadmin.setUsername("tuanmino2k4");
			ttadmin.setRole(roleService.getRole(1));
			tutorialAdminRepository.save(ttadmin);
		}

		if (partRepository.findByPartName("Part I") == null) {
			PartToeic partToeic = new PartToeic();
			partToeic.setPartName("Part I");
			partToeic.setDescription(
					"Look at the picture and listen to the sentences. Choose the sentence that best describes the picture:");
			partToeic.setType("Listening");
			partRepository.save(partToeic);
		}
		if (partRepository.findByPartName("Part II") == null) {
			PartToeic partToeic = new PartToeic();
			partToeic.setPartName("Part II");
			partToeic.setDescription(
					"Listen to the question and the three responses. Choose the response that best answers the question:");
			partToeic.setType("Listening");
			partRepository.save(partToeic);
		}
		if (partRepository.findByPartName("Part III") == null) {
			PartToeic partToeic = new PartToeic();
			partToeic.setPartName("Part III");
			partToeic.setDescription("Listen to the dialogue. Then read each question and choose the best answer:");
			partToeic.setType("Listening");
			partRepository.save(partToeic);
		}
		if (partRepository.findByPartName("Part IV") == null) {
			PartToeic partToeic = new PartToeic();
			partToeic.setPartName("Part IV");
			partToeic.setDescription("Listen to the talk. Then read each question and choose the best answer:");
			partToeic.setType("Listening");
			partRepository.save(partToeic);
		}
		if (partRepository.findByPartName("Part V") == null) {
			PartToeic partToeic = new PartToeic();
			partToeic.setPartName("Part V");
			partToeic.setDescription("Choose the word that best completes the sentence:");
			partToeic.setType("Reading");
			partRepository.save(partToeic);
		}
		if (partRepository.findByPartName("Part VI") == null) {
			PartToeic partToeic = new PartToeic();
			partToeic.setPartName("Part VI");
			partToeic.setDescription("Choose the word or phrase that best completes the blanks:");
			partToeic.setType("Reading");
			partRepository.save(partToeic);
		}
		if (partRepository.findByPartName("Part VII") == null) {
			PartToeic partToeic = new PartToeic();
			partToeic.setPartName("Part VII");
			partToeic.setDescription("Read the passage and choose the correct answer");
			partToeic.setType("Reading");
			partRepository.save(partToeic);
		}
	}
}
