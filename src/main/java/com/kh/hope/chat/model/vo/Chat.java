package com.kh.hope.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Chat{
	
	private int chatNo;		  // 채팅방 번호
	private String chatTitle; // 채팅방제목
	private String status;	  // 채팅 상태
	private int userNo;		  // 회원 시퀀스번호
	
	private String userName;
	private int cnt;
	
	private int programNo;	// 프로그램 번호

}
