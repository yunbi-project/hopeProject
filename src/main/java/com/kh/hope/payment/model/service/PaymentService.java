package com.kh.hope.payment.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.payment.model.dao.PaymentDao;
import com.kh.hope.payment.model.vo.PaymentInfo;

@Service
public class PaymentService {

	@Autowired
	private PaymentDao dao;


//	결제 추가
	public int insertPay(Map<String, Object> map) {
		return dao.insertPay(map);
	}


}
