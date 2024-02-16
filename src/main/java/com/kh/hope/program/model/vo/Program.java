package com.kh.hope.program.model.vo;

import java.sql.Date;

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
	private String activityType;
	private String activityTime;
	private String activityDays;
	private String activityLocation;
	private int programCapacity;
	private String programEnrollEndDate;
	private String content;
	private String status;
}