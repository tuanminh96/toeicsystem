package com.bk.tuanpm.webtoeic.service;

import com.bk.tuanpm.webtoeic.entities.Remark;

public interface RemarkService {

	Remark saveRemarkForUser(Remark remark);

	Remark getById(int id);

	boolean isPresentRemark(int user, String range, String week);

	Remark getRemark(int user, String range, String week);

}
