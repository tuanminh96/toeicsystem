package com.bk.tuanpm.webtoeic.repository;

import com.bk.tuanpm.webtoeic.dto.ExamHistoryDTO;
import com.bk.tuanpm.webtoeic.entities.TestResult;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClientAccountRepository extends JpaRepository<TestResult, Integer> {
    @Query(value = "SELECT e.title, tr.date_test, tr.total_time_test, tr.score_reading, tr.score_listen FROM dbo.test_result tr INNER JOIN dbo.exam e ON tr.baithithuid = e.id_exam WHERE tr.nguoidungid = ?1", nativeQuery = true)
    public List<Object[]> findAllExamHistory(int userId);
}
