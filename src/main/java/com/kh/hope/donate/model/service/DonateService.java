package com.kh.hope.donate.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.donate.model.dao.DonateDao;
import com.kh.hope.donate.model.vo.CurrentUser;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.payment.model.vo.PaymentInfo;

@Service
public class DonateService {

	@Autowired
	private DonateDao dao;
	
	public List<Donate> donateList(Map<String, Object> map) {
		return dao.donateList(map);
	}

	public Donate donateDetail(int donateNo) {
		return dao.donateDetail(donateNo);
	}

	public List<CurrentUser> selectCurrentUser(int donateNo) {
		return dao.selectCurrentUser(donateNo);
	}

	public PaymentInfo getPayment(int donateNo) {
		return dao.getPayment(donateNo);
	}

	public int save(PaymentInfo paymentInfo) {
		return dao.save(paymentInfo);
	}

	public int selectListCount(Map<String, Object> map) {
		return dao.selectListCount(map);
	}
}
