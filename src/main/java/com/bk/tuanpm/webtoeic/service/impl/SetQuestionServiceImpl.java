package com.bk.tuanpm.webtoeic.service.impl;

import com.bk.tuanpm.webtoeic.entities.SetQuestion;
import com.bk.tuanpm.webtoeic.repository.SetQuestionRespository;
import com.bk.tuanpm.webtoeic.service.SetQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SetQuestionServiceImpl implements SetQuestionService {

    @Autowired
    SetQuestionRespository setQuestionRespository;

    @Override
    public void save(SetQuestion setQuestion) {
        setQuestionRespository.save(setQuestion);
    }
}
