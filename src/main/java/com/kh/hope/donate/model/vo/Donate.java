package com.kh.hope.donate.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Donate {

	private int donateNo; //후원게시글번호
	private String donateTitle; //후원제목
	private String donateContent; //후원내용
	private Long donateHope; //목표후원금
	private String dDay;
	private int donateAmount;
	private Date donateEndDate; //후원종료기간
	private int donateProgress;
	private int userCount;
	private int userNo; //회원번호
	private String status; //상태
	
//	private String donateFoundation; //후원담당재단
//	private int count; //조회수
//	private String donateStartDate; //후원시작기간
}
