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

import com.bk.tuanpm.webtoeic.repository.AccountRepository;
import com.bk.tuanpm.webtoeic.util.ExcelUtil;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ToeicSystemApplicationTests {

	@Autowired
	AccountRepository nguoIDungRepo;
	

	@Autowired
	ExcelUtil excelUtil;

	@Test
	public void contextLoads() {
	}

}
