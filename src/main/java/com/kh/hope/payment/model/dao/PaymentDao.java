package com.kh.hope.payment.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Repository;

import com.kh.hope.payment.model.vo.PaymentInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class PaymentDao {

	@Autowired
	private SqlSession session;

	public int insertPay(Map<String, Object> map) {
		return session.insert("payment.insertPay", map);
	}


}
