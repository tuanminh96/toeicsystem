package com.bk.tuanpm.webtoeic.service.impl;

import com.bk.tuanpm.webtoeic.entities.ExplainDetail;
import com.bk.tuanpm.webtoeic.entities.SetQuestion;
import com.bk.tuanpm.webtoeic.repository.ExplainDetailRespository;
import com.bk.tuanpm.webtoeic.repository.SetQuestionRespository;
import com.bk.tuanpm.webtoeic.service.ExplainDetailService;
import com.bk.tuanpm.webtoeic.service.SetQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExplainDetailServiceImpl implements ExplainDetailService {

    @Autowired
    ExplainDetailRespository explainDetailRespository;

    @Override
    public void save(ExplainDetail explainDetail) {
        explainDetailRespository.save(explainDetail);
    }
}
