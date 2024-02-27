package com.kh.hope.admin.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class BlackList {
	
	private int blackListNo;
	private String reason;
	private String updateDate;
	private int userNo;
	private String status;
	
	private String userName;
	private String email;
	private String phone;
	
}
