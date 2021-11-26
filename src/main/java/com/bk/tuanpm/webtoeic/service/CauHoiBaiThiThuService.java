package com.bk.tuanpm.webtoeic.service;

import java.util.List;

import com.bk.tuanpm.webtoeic.entities.BaiThiThu;
import com.bk.tuanpm.webtoeic.entities.CauHoiBaiThiThu;

public interface CauHoiBaiThiThuService {
	 void  save(CauHoiBaiThiThu cauhoibaithithu);
	 
	 List<CauHoiBaiThiThu> getListCauHoi(BaiThiThu baithithu);
}
