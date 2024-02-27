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
//		int limit = pi.getBoardLimit();
//		int offset=(pi.getCurrentPage()-1)*limit;
//		
//		RowBounds rowBounds = new RowBounds(offset,limit);
//		return session.selectList("donate.donateList", map, rowBounds);
		return session.selectList("donate.donateList", map);
	}

	public Donate donateDetail(int donateNo) {
		return session.selectOne("donate.donateDetail", donateNo);
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

	public int selectListCount(Map<String, Object> map) {
		return session.selectOne("donate.selectListCount", map);
	}

}
