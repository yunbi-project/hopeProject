package com.kh.hope.activityreport.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ActivityReport {
	
	private int reportNo;
	private String reportTitle;
	private String reportContent;
	private int count;
	private Date createDate;
	public int userNo;
	
	private Date programActivityStartDate;
	private Date programActivityEndDate;
	
	private int programNo;
	private String activityTime;
	private String activityDays;
	private String activityLocation;
	private String programCapacity;
	private int requestTotal;
	
	
	private int sumDonate;
	private int donateHope;
	private int donateNo;
	private int achRate;
	private String donateFoundation;
	private Date donateStartDate;
	private Date donateEndDate;
	private int totalCount;
	private String changeName;
	private int fileNo;
	
	
	private String status; // 상테
	private String reportType; // 보고서 종류
	private int refAno; // 참조번호
	
	
}