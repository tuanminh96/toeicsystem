package com.bk.tuanpm.webtoeic;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.junit4.SpringRunner;

import com.bk.tuanpm.webtoeic.entities.BaiTapNghe;
import com.bk.tuanpm.webtoeic.entities.CauHoiBaiTapNghe;
import com.bk.tuanpm.webtoeic.repository.BaiTapNgheRepository;
import com.bk.tuanpm.webtoeic.repository.NguoiDungRepository;
import com.bk.tuanpm.webtoeic.util.ExcelUtil;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ToeicSystemApplicationTests {

	@Autowired
	NguoiDungRepository nguoIDungRepo;
	
	@Autowired
	BaiTapNgheRepository repo;

	@Autowired
	ExcelUtil excelUtil;

	@Test
	public void contextLoads() {
	}

	@Test
	public void tesReadExcel() throws FileNotFoundException {
		Page<BaiTapNghe> page = repo.findByPartAndDoKho(1, 1, PageRequest.of(0,2));
		System.out.println(page.getNumberOfElements());
	}

}
