package com.bk.tuanpm.webtoeic.service;

import com.bk.tuanpm.webtoeic.dto.ExamHistoryDTO;

import java.util.List;

public interface ClientAccountService {
    public List<ExamHistoryDTO> findAllExamHistory(int userId);
}
