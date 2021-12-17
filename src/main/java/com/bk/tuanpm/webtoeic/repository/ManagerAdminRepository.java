package com.bk.tuanpm.webtoeic.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.ManagerAdmin;
import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;

@Repository
public interface ManagerAdminRepository extends JpaRepository<ManagerAdmin, Integer> {
	public ManagerAdmin findByEmail(String email);
}
