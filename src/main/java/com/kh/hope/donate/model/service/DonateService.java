package com.kh.hope.donate.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.donate.model.dao.DonateDao;
import com.kh.hope.donate.model.vo.CurrentUser;
import com.kh.hope.donate.model.vo.Donate;

@Service
public class DonateService {

	@Autowired
	private DonateDao dao;
	
	public List<Donate> donateList() {
		return dao.donateList();
	}

	public Donate donateDetail(int donateNo) {
		return dao.donateDetail(donateNo);
	}

	public List<CurrentUser> selectCurrentUser(int donateNo) {
		return dao.selectCurrentUser(donateNo);
	}
}
