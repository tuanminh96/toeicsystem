package com.bk.tuanpm.webtoeic.service.impl;

import com.bk.tuanpm.webtoeic.dto.ExamHistoryDTO;
import com.bk.tuanpm.webtoeic.repository.ClientAccountRepository;
import com.bk.tuanpm.webtoeic.service.ClientAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Service
public class ClientAccountServiceImpl implements ClientAccountService {
    @Autowired
    private ClientAccountRepository clientAccountRepository;

    @Override
    public List<ExamHistoryDTO> findAllExamHistory(int userId) {
        List<Object[]> listObject = clientAccountRepository.findAllExamHistory(userId);
        List<ExamHistoryDTO> listExamHistoryDTO = new ArrayList<ExamHistoryDTO>();
        for (Object[] obj : listObject) {
            ExamHistoryDTO examHistoryDTO = new ExamHistoryDTO();
            examHistoryDTO.setTitle(String.valueOf(obj[0]));
            examHistoryDTO.setDateTest(String.valueOf(obj[1]));
            examHistoryDTO.setTotalTimeTest((int) obj[2]);
            examHistoryDTO.setScoreReading((int) obj[3]);
            examHistoryDTO.setScoreListen((int) obj[4]);
            listExamHistoryDTO.add(examHistoryDTO);
        }
        return listExamHistoryDTO;
    }
}
