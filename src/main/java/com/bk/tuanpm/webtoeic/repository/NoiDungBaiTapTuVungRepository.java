package com.bk.tuanpm.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.BaiTapTuVung;
import com.bk.tuanpm.webtoeic.entities.NoiDungBaiTapTuVung;

@Repository
public interface NoiDungBaiTapTuVungRepository extends JpaRepository<NoiDungBaiTapTuVung,Integer>{

	List<NoiDungBaiTapTuVung> findByBaitaptuvung(BaiTapTuVung baitaptuvung);
	
}
