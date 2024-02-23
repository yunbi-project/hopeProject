package com.kh.hope.chat.model.vo;

import lombok.Data;

@Data
public class ChatMessage {
	
	// 채팅방 메세지
	
	private int cmNo; 	   // 메세지번호
	private String message;// 채팅내용
	private String createDate; // 생성날자
	private int chatNo;	   // 채팅방번호
	private int userNo;	   // 회원번호
	
	private String userName;	// 회원 이름
	private String chatTitle;
	

}
