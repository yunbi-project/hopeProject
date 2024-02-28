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
public class PaymentInfo {
	private int payNo;
	private String payType;
	private String bank;
	private String account;
	private int donateAmount;
	private String optionalText;
	private int userNo;
	private String billNo;
	private Date donateDate;
	private String anonymous;  // 익명 여부
	private Date createDate; // 기부한 날짜
	
	private int donateNo;
	private String donateTitle;
	private String userName;
	private String phone;
	private String email;

	// 생성자, getter 및 setter 메서드 추가
}
