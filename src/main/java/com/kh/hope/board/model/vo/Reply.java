package com.kh.hope.board.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@ToString
@Getter
public class Reply {

	
	private int replyNo;
	private String replyContent;
	private Date createDate;
	private Date modifyDate;
	private String status;
	private int userNo;
	private int boardNo;
	private String userName;
	private String email;
	
	private String boardTypeName;
	
}
