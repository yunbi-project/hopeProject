package com.kh.hope.payment.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class PaymentData {
	
	private int payCode; //일련번호 관리
	private long odrCode; //주문번호
	private String payMethod;//결제방식 선택
	private Date payDate; //결제일
	private int amount; // 결제금액
	private int pay_rest_price; //미지급금
	private String pay_nobank_user; //무통장입금자명
	private String pay_nobank; //입금은행

}
