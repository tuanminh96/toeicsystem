package com.bk.tuanpm.webtoeic.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.SlideBanner;
import com.bk.tuanpm.webtoeic.repository.SlideBannerRespository;
import com.bk.tuanpm.webtoeic.service.SlideBannerService;
@Service
public class SlideBannerServiceImpl implements SlideBannerService{

	@Autowired SlideBannerRespository slideBannerRespository;
	
	@Override
	public List<SlideBanner> findAll(){
		return slideBannerRespository.findAllByOrderBySlidebanneridAsc();
	}
}
