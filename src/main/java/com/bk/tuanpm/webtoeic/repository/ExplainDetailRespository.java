package com.bk.tuanpm.webtoeic.repository;

import com.bk.tuanpm.webtoeic.entities.ExplainDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ExplainDetailRespository extends JpaRepository<ExplainDetail, Integer> {

}
