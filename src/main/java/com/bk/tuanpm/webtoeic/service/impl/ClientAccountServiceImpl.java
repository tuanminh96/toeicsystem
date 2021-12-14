package com.bk.tuanpm.webtoeic.service.impl;

import com.bk.tuanpm.webtoeic.dto.ExamHistoryDTO;
import com.bk.tuanpm.webtoeic.repository.ClientAccountRepository;
import com.bk.tuanpm.webtoeic.service.ClientAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ClientAccountServiceImpl implements ClientAccountService {
    @Autowired
    private ClientAccountRepository clientAccountRepository;

    @Override
    public List<ExamHistoryDTO> findAllExamHistory(String userId) {
        List<Object[]> listObject = clientAccountRepository.findAllExamHistory(userId);
        List<ExamHistoryDTO> listExamHistoryDTO = new ArrayList<ExamHistoryDTO>();
        for (Object[] obj : listObject) {
            ExamHistoryDTO examHistoryDTO = new ExamHistoryDTO();
            examHistoryDTO.setTitle(String.valueOf(obj[0]));
            listExamHistoryDTO.add(examHistoryDTO);
        }
        return listExamHistoryDTO;
    }
}
