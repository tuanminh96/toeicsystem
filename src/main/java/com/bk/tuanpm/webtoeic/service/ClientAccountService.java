package com.bk.tuanpm.webtoeic.service;

import com.bk.tuanpm.webtoeic.dto.ExamHistoryDTO;

import java.util.List;

public interface ClientAccountService {

    public int getTotalExam(int userId);

    public List<ExamHistoryDTO> findAllExamHistory(int userId, int totalscoreReading, int totalscoreReading2);
}
