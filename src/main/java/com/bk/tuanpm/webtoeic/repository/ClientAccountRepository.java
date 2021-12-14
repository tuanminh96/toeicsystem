package com.bk.tuanpm.webtoeic.repository;

import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ClientAccountRepository {
    @Query("")
    public List<Object[]> findAllExamHistory(String userId);
}
