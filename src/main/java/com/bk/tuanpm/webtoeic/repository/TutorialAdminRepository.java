package com.bk.tuanpm.webtoeic.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.TutorialAdmin;

@Repository
public interface TutorialAdminRepository extends JpaRepository<TutorialAdmin, Integer> {
	public TutorialAdmin findByEmail(String email);
}
