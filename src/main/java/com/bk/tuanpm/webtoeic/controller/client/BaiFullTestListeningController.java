package com.bk.tuanpm.webtoeic.controller.client;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bk.tuanpm.webtoeic.entities.Question;
import com.bk.tuanpm.webtoeic.entities.TestResult;
import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.service.BaiThiThuService;
import com.bk.tuanpm.webtoeic.service.QuestionService;
import com.bk.tuanpm.webtoeic.service.KetQuaBaiTestService;
import com.bk.tuanpm.webtoeic.service.NguoiDungService;

@Controller
public class BaiFullTestListeningController {
	
	@Autowired
	BaiThiThuService baithithuServie;
	
	@Autowired
	QuestionService cauhoibaithithuService;
	
	@Autowired
	KetQuaBaiTestService ketquabaitestService;
	
	@Autowired
	BaiThiThuService baithithuService;
	
	@Autowired
	private NguoiDungService nguoiDungService;
	
	@ModelAttribute("loggedInUser")
	public Account getSessionUser(HttpServletRequest request) {
		return (Account) request.getSession().getAttribute("loggedInUser");
	}
	
	
	
	
	@RequestMapping(value="/showResultListening/{examId}/{socaudung}/{tongsocau}",method=RequestMethod.POST)
	public String showResult(Model model,@RequestBody String[] jsonAnswerUser,
							@PathVariable("examId") int examId,
							@PathVariable("socaudung") String socaudung,
							@PathVariable("tongsocau") int tongsocau) {
	
	List<Question> list = cauhoibaithithuService.getListCauHoi(baithithuServie.getBaiThiThu(examId).get(0));
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Account currentUser = nguoiDungService.findByEmail(auth.getName());
	
//	 for (int i = 0;i<tongsocau;i++) {
//		 list.get(i).setDapAnUser(jsonAnswerUser[i]);
//		
//     }
	 
	// save so cau dung vao db
//	 	Date time = new Date();
//		KetQuaBaiTest ketquabaitest = new KetQuaBaiTest();
//		ketquabaitest.setNgaythi(time);
//		ketquabaitest.setBaithithu(baithithuService.getBaiThiThu(examId).get(0));
//		ketquabaitest.setCorrectlisten(socaudung);
//		ketquabaitest.setNguoidung(currentUser);
//		
//		ketquabaitestService.save(ketquabaitest);
	 
	 //
	 
	 model.addAttribute("socaudung",socaudung);
	 model.addAttribute("listQuestion",list);
		
		return "client/listeningResult";
	}
	
	
	

	
	

}
