package com.kh.hope.activityreport.model.service;

import java.util.List;
import java.util.Map;

import com.kh.hope.activityreport.model.vo.ActivityReport;
import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.program.model.vo.Program;


public interface ActivityReportService {
	
	/* 활동보고서 list */
	int selectListCount(Map<String, Object> map);
	
	List<ActivityReport> reportList(PageInfo pi, Map<String, Object> map);
	
	
	ActivityReport selectActivityReport(int reportNo);
	
	int increaseCount(int reportNo);


	int insertActivityReport(ActivityReport activityReport);
	

	int updateActivityReport(ActivityReport activityreport);

	
	int deleteActivityreport(int reportNo);

	// 봉사활동 해당 종료 가져오기
	Program selectProgramReport(int programNo);
	
	// 봉사활동 활동보고서 작성여부 Y로 변경
	int updateProgramReport(int programNo);
	
	// 후원후기 종료 가져오기
	Donate selectDonateReport(int donateNo);
	
	// 후원후기 활동보고서 추가
	int activityInsertDonateForm(ActivityReport activityReport);
	
	// 후원게시판 활동보고서 작성여부 Y로 변경
	int updateDonateReport(int donateNo);
	
	// 후원후기 리스트
	List<ActivityReport> reportDonateList(PageInfo pi, Map<String, Object> map);
	
	// 후원후기 상세페이지
	ActivityReport selectActivityDonateReport(int reportNo);
	
	// 후원후기 보고서 수정
	int activityReportDonateUpdate(ActivityReport activityreport);
	
	// 후원후기 보고서 삭제
	int deleteDonateActivityreport(int reportNo);
	
}













