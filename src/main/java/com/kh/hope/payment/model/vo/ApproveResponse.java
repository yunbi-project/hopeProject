package com.kh.hope.payment.model.vo;

import lombok.Data;

@Data
public class ApproveResponse {

	private String aid; //요청 고유 번호
	private String tid; //결제 고유 번호
	private String cid; //가맹점 코드
	private String sid; // 정기결제용 ID,
	private String partner_order_id; // 가맹점 주문번호 최대 100자
	private String partner_user_id; //가맹점 회원 아이디 최대 100자
	private String payment_method_type; //결제수단, card / money
	
	private String amount;
	
	private String donate_no; // 기부 보드 넘버
	private String created_at; //결제준비 요청 시각
	private String approved_at; //결제 승인 시각
	private String payload; //결제 승인 요청에 대해 저장한 값, 요청시 전달된 내용
}
