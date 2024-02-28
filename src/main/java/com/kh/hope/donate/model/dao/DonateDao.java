package com.kh.hope.donate.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.donate.model.vo.CurrentUser;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.payment.model.vo.PaymentInfo;

@Repository
public class DonateDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public List<Donate> donateList(Map<String, Object> map) {

		return session.selectList("donate.donateList", map);
	}

	public Donate donateDetail(int donateNo) {
		return session.selectOne("donate.donateDetail", donateNo);
	}
	
//	후원자 현황
	public List<PaymentInfo> selectPayPeople(int donateNo) {
		
		return session.selectList("donate.selectPayPeople", donateNo);
	}
	
//	조회수 증가
	public int increaseCount(int donateNo) {
		return session.update("donate.increaseCount", donateNo);
	}
	
//  후원 다른게시글 리스트
	public List<Donate> selectOtherDonateList(Map<String, Object> map) {
		return session.selectList("donate.selectOtherDonateList", map);
	}
	

	
	
	public List<CurrentUser> selectCurrentUser(int donateNo) {
		return session.selectList("donate.selectCurrentUser", donateNo);
	}

	public PaymentInfo getPayment(int donateNo) {
		return session.selectOne("donate.getPayment", donateNo);
	}

	public int save(PaymentInfo paymentInfo) {
		return session.insert("donate.save", paymentInfo);
	}

	






}
