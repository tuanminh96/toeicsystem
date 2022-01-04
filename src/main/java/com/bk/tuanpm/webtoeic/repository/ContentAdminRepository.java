package com.bk.tuanpm.webtoeic.repository;

import com.bk.tuanpm.webtoeic.entities.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.ContentAdmin;
import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;

@Repository
public interface ContentAdminRepository extends JpaRepository<ContentAdmin, Integer> {
	public ContentAdmin findByEmail(String email);
}
