package com.kh.hope.program.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Program {

	private int programNo; 
	private int userNo;
	private String programName;
	private String programActivityStartDate;
	private String programActivityEndDate;
	private String sdate;
	private String edate;
	private String enroll;
	private String activityTime;
	private String activityDays;
	private String activityLocation;
	private String programCapacity;
	private String programEnrollEndDate;
	private String programContent;
	private String result;
	private String status;
	private String userName;
	private String phone;
	private String email;
	private int count;
	
	private int requestTotal; // 봉사활동 참여자수
}