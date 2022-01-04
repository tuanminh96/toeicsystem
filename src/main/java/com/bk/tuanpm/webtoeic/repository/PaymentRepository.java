package com.bk.tuanpm.webtoeic.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.OrderPayment;

@Repository
public interface PaymentRepository extends JpaRepository<OrderPayment, Integer> {

	public OrderPayment findByRefNo(String refNo);
}
