package com.bk.tuanpm.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.SlideBanner;

@Repository
public interface SlideBannerRespository  extends JpaRepository<SlideBanner,Integer>{
	public List<SlideBanner> findAllByOrderBySlidebanneridAsc();
}
