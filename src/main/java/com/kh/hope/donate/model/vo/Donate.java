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
	private String donateFoundation; // 후원재단
	private int donateHope; //목표후원금
	private int donateAmount;
	private Date donateStartDate; // 후원시작기간
	private Date donateEndDate; //후원종료기간
	private int donateProgress;
	private int count;  // 조회수
	private int userNo; //회원번호
	private String userName;
	private String status; //상태
	private int tagId;  //해시태그 번호
	private String tagName;  //해시태그 이름
	private Date donateCreateDate;  // 게시글 생성날짜
	
	private int sumDonate;  // 총 후원금액
	private int achRate;  // 달성률
	private int ceilDayDiff; // 남은 날짜
	private int totalCount;  //총 후원인수
	
	private String originName; // 사진 변경전 이름
	private String changeName; // 사진 변경후 이름
	private int fileNo;  // 사진 파일 번호
}
