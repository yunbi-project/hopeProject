package com.kh.hope.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class Board {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private int count;
	private Date createDate;
	private Date modifyDate;
	private String status;
	private int userNo;
	private int faqType;
	private String boardTypeNo;
	private String userName;
	
	
}
