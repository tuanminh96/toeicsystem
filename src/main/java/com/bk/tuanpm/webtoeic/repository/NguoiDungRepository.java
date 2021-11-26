package com.bk.tuanpm.webtoeic.repository;

import java.util.List;
import java.util.Set;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.NguoiDung;
import com.bk.tuanpm.webtoeic.entities.Role;

@Repository
public interface NguoiDungRepository extends JpaRepository<NguoiDung, Long> {

	NguoiDung findByEmail(String email);
	
	Page<NguoiDung> findByRole(Role vaiTro, Pageable of);

	List<NguoiDung> findByRole(Role vaiTro);	
}
