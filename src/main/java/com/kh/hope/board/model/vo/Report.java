package com.kh.hope.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Report {

	private int reportNo;
	private String reportContent;
	private Date reportDate;
	private int userNo;
	private int boardNo;
	private int replyNo;
	private String status;
}
