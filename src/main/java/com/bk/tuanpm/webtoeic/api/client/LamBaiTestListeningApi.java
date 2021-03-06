package com.bk.tuanpm.webtoeic.api.client;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bk.tuanpm.webtoeic.entities.Question;
import com.bk.tuanpm.webtoeic.entities.TestResult;
import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.service.BaiThiThuService;
import com.bk.tuanpm.webtoeic.service.QuestionService;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;
import com.bk.tuanpm.webtoeic.service.KetQuaBaiTestService;

@RestController
@RequestMapping("api/client/exam")
public class LamBaiTestListeningApi {
	
	@Autowired
	KetQuaBaiTestService ketquabaitestService;
	
	@Autowired
	QuestionService cauhoibaithithuService;
	@Autowired
	BaiThiThuService baithithuService;
	
	@Autowired
	private UserAdminServiceImpl nguoiDungService;
	
	@ModelAttribute("loggedInUser")
	public Account getSessionUser(HttpServletRequest request) {
		return (Account) request.getSession().getAttribute("loggedInUser");
	}
	
	
	@RequestMapping(value="/ajaxTestListening/{baithithuId}/{socaudung}", method = RequestMethod.POST)
	public @ResponseBody
	List<String>  AjaxListening(@RequestBody String[] jsonAnswerUser,
								@PathVariable("baithithuId") int id,
								@PathVariable("socaudung") String socaudung) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Account currentUser = nguoiDungService.findByEmail(auth.getName());
		
		List<Question> list = cauhoibaithithuService.getListCauHoi(baithithuService.getBaiThiThu(id).get(0));
		
		// save ketqua bai test
//		Date time = new Date();
//		KetQuaBaiTest ketquabaitest = new KetQuaBaiTest();
//		ketquabaitest.setNgaythi(time);
//		ketquabaitest.setBaithithu(baithithuService.getBaiThiThu(id).get(0));
//		ketquabaitest.setCorrectlisten(socaudung);
//		ketquabaitest.setNguoidung(currentUser);
//		
//		ketquabaitestService.save(ketquabaitest);	 
		 List<String> response = new ArrayList<String>();
		 return response;
	}
}
