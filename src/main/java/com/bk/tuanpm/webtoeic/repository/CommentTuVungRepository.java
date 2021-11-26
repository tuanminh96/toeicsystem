package com.bk.tuanpm.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.BaiTapTuVung;
import com.bk.tuanpm.webtoeic.entities.CommentTuVung;


@Repository
public interface CommentTuVungRepository  extends JpaRepository<CommentTuVung,Integer> {
	
	List<CommentTuVung> findByBaitaptuvung(BaiTapTuVung baitaptuvung);

}
