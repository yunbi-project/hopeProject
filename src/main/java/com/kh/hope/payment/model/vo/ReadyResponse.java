package com.kh.hope.payment.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReadyResponse {
	private String tid; //결제 고유 번호
	private String next_redirect_pc_url; //요청한 클라이언트가 pc웹일 경우 카카오톡으로 결제 요청 메세지를
										//보내기위한 사용자 정보 입력 화면 url
	private String partner_order_id;
}
