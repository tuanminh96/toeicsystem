package com.bk.tuanpm.webtoeic.service;

import com.bk.tuanpm.webtoeic.entities.OrderPayment;

public interface PaymentService {

	OrderPayment saveOrder(OrderPayment op);

	OrderPayment findOrderByRef(String refNo);

}
