package com.bk.tuanpm.webtoeic.api.admin;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bk.tuanpm.webtoeic.dto.StaticResultDTO;
import com.bk.tuanpm.webtoeic.entities.TestResult;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.service.PartService;
import com.bk.tuanpm.webtoeic.service.impl.KetQuaBaiTestImpl;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;

@RestController
@RequestMapping("/admin/api")
public class ResultApi {
	
	@Autowired 
	UserAdminServiceImpl userAdminServiceImpl;
	
	@Autowired
	KetQuaBaiTestImpl ketQuaBaiTestImpl;
	
	@Autowired
	PartService partService;
	
	@PostMapping("/staticResult")
	@ResponseBody
	public StaticResultDTO getStatistic(Model model, @RequestParam("idMem") Integer idMem,
				@RequestParam("dateFrom") @DateTimeFormat(pattern="yyyy-MM-dd") Date fromDate,
				@RequestParam("dateTo") @DateTimeFormat(pattern="yyyy-MM-dd") Date dateTo
			) {
		User userResult = userAdminServiceImpl.getUserById(idMem);
		List<TestResult> results = ketQuaBaiTestImpl.getResultMemberDateRange(idMem, fromDate, dateTo);
		
		int rightP1 = 0;
		int rightP2 = 0;
		int rightP3 = 0;
		int rightP4 = 0;
		int rightP5 = 0;
		int rightP6 = 0;
		int rightP7 = 0;
		
		int wrongP1 = 0;
		int wrongP2 = 0;
		int wrongP3 = 0;
		int wrongP4 = 0;
		int wrongP5 = 0;
		int wrongP6 = 0;
		int wrongP7 = 0;
		
		int totalP1 = partService.getPartByName("Part I").getQuestionTotal();
		int totalP2 = partService.getPartByName("Part II").getQuestionTotal();
		int totalP3 = partService.getPartByName("Part III").getQuestionTotal();
		int totalP4 = partService.getPartByName("Part IV").getQuestionTotal();
		int totalP5 = partService.getPartByName("Part V").getQuestionTotal();
		int totalP6 = partService.getPartByName("Part VI").getQuestionTotal();
		int totalP7 = partService.getPartByName("Part VII").getQuestionTotal();
		for (TestResult testResult : results) {
			rightP1 += testResult.getRightPart1();
			rightP2 += testResult.getRightPart2();
			rightP3 += testResult.getRightPart3();
			rightP4 += testResult.getRightPart4();
			rightP5 += testResult.getRightPart5();
			rightP6 += testResult.getRightPart6();
			rightP7 += testResult.getRightPart7();
			
			wrongP1 = totalP1 - rightP1;
			wrongP2 = totalP2 - rightP2;
			wrongP3 = totalP3 - rightP3;
			wrongP4 = totalP4 - rightP4;
			wrongP5 = totalP5 - rightP5;
			wrongP6 = totalP6 - rightP6;
			wrongP7 = totalP7 - rightP7;
		}
		StaticResultDTO resultDTO = new StaticResultDTO();
		resultDTO.setRightPart1(rightP1);
		resultDTO.setRightPart2(rightP2);
		resultDTO.setRightPart3(rightP3);
		resultDTO.setRightPart4(rightP4);
		resultDTO.setRightPart5(rightP5);
		resultDTO.setRightPart6(rightP6);
		resultDTO.setRightPart7(rightP7);
		resultDTO.setWrongPart1(wrongP1);
		resultDTO.setWrongPart2(wrongP2);
		resultDTO.setWrongPart3(wrongP3);
		resultDTO.setWrongPart4(wrongP4);
		resultDTO.setWrongPart5(wrongP5);
		resultDTO.setWrongPart6(wrongP6);
		resultDTO.setWrongPart7(wrongP7);
		return resultDTO;
	}
}
