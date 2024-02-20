package com.kh.hope.payment.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDao {

	@Autowired
	private SqlSession session;
	
//	 // 결제 정보를 데이터베이스에 저장하는 메서드
//    public int insertPaymentInfo(PaymentInfo paymentInfo) {
//        return session.insert("payment.insertPaymentInfo", paymentInfo);
//    }
//
//    // 결제 정보를 가져오는 메서드
//    public PaymentInfo getPaymentInfo(int paymentId) {
//        return session.selectOne("payment.getPaymentInfo", paymentId);
//    }
}
