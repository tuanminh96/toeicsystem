package com.bk.tuanpm.webtoeic.repository.impl;

import com.bk.tuanpm.webtoeic.repository.ClientAccountRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ClientAccountRepositoryImpl implements ClientAccountRepository {
    @Override
    public List<Object[]> findAllExamHistory() {
        return null;
    }
}
