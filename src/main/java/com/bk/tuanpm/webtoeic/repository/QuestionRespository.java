package com.bk.tuanpm.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.Exam;
import com.bk.tuanpm.webtoeic.entities.Question;
import com.bk.tuanpm.webtoeic.entities.PartToeic;

@Repository
public interface QuestionRespository extends JpaRepository<Question, Integer> {

    List<Question> findByBaithithu(Exam baithithu);

    @Query("SELECT q FROM Question q WHERE q.partToeic IN (:parts)")
    List<Question> findByPartToeic(List<PartToeic> parts);

    @Query(value = "SELECT e.id_exam,\n" +
            "       e.title,\n" +
            "       s.id_set,\n" +
            "       s.audio,\n" +
            "       s.content,\n" +
            "       s.image AS 'SImage',\n" +
            "       s.paragraph AS 'PParagraph',\n" +
            "       p.id_part,\n" +
            "       p.part_name,\n" +
            "       p.type,\n" +
            "       q.cauhoibaithithuid,\n" +
            "       q.audiomp3,\n" +
            "       q.correctanswer,\n" +
            "       q.image,\n" +
            "       q.number,\n" +
            "       q.option1,\n" +
            "       q.option2,\n" +
            "       q.option3,\n" +
            "       q.option4,\n" +
            "       q.paragraph,\n" +
            "       q.question\n" +
            "FROM dbo.exam e\n" +
            "INNER JOIN dbo.set_question s ON e.id_exam = s.exam_id_exam\n" +
            "INNER JOIN dbo.part p ON s.part_toeic_id_part = p.id_part\n" +
            "INNER JOIN dbo.question q ON s.id_set = q.id_set\n" +
            "WHERE e.id_exam = ?1\n" +
            "ORDER BY p.type,\n" +
            "         p.id_part,\n" +
            "         s.id_set,\n" +
            "         q.cauhoibaithithuid;", nativeQuery = true)
    List<Object[]> getListExamQuestionDTO(int examId);


}
