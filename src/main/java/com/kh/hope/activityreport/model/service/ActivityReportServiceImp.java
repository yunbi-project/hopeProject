package com.kh.hope.activityreport.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.activityreport.model.dao.ActivityReportDao;
import com.kh.hope.activityreport.model.vo.ActivityReport;
import com.kh.hope.board.model.vo.Board;
import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.program.model.vo.Program;

import jakarta.servlet.ServletContext;

@Service
public class ActivityReportServiceImp implements ActivityReportService{
	

	@Autowired
	private ActivityReportDao dao;
	
	/* 활동보고서 리스트 */
	@Override
	public int selectListCount(Map<String, Object> map) {
		return dao.selectListCount(map);
	}
	
	@Override
	public List<ActivityReport> reportList(PageInfo pi, Map<String, Object> map) {
		return dao.reportList(pi,map);
	}
	
	/* 활동보고서 상세보기 */
	@Override
	public ActivityReport selectActivityReport(int reportNo) {
		return dao.selectActivityReport(reportNo);
	}
	@Override
	public int increaseCount(int reportNo) {
		return dao.increaseCount(reportNo);
	}
	
	/* 활동보고서 작성*/
	@Override
	public int insertActivityReport(ActivityReport activityReport) {
		return dao.insertActivityReport(activityReport);
	}
	
	/* 활동보고서 수정*/
	@Override
	public int updateActivityReport(ActivityReport activityreport) {
		return dao.updateActivityReport(activityreport);
	}
	
	/* 활동보고서 삭제*/
	@Override
	public int deleteActivityreport(int reportNo) {
		return dao.deleteActivityReport(reportNo);
	}

	/* 봉사활동 해당 종료 가져오기 */
	@Override
	public Program selectProgramReport(int programNo) {
		return dao.selectProgramReport(programNo);
	}

	// 봉사활동 활동보고서 작성여부 Y로 변경
	@Override
	public int updateProgramReport(int programNo) {
		return dao.updateProgramReport(programNo);
	}
	
	// 후원후기 종료 가져오기
	@Override
	public Donate selectDonateReport(int donateNo) {
		return dao.selectDonateReport(donateNo);
	}
	
	// 후원후기 보고서 추가
	@Override
	public int activityInsertDonateForm(ActivityReport activityReport) {
		return dao.activityInsertDonateForm(activityReport);
	}
	
	// 후원게시판 활동보고서 작성여부 Y로 변경
	@Override
	public int updateDonateReport(int donateNo) {
		return dao.updateDonateReport(donateNo);
	}
	
	// 후원후기 리스트
	@Override
	public List<ActivityReport> reportDonateList(PageInfo pi, Map<String, Object> map) {
		return dao.reportDonateList(pi, map);
	}
	
	// 후원후기 상세페이지
	@Override
	public ActivityReport selectActivityDonateReport(int reportNo) {
		return dao.selectActivityDonateReport(reportNo);
	}
	
	// 후원후기 보고서 수정
	@Override
	public int activityReportDonateUpdate(ActivityReport activityreport) {
		return dao.activityReportDonateUpdate(activityreport);
	}
	
	// 후원후기 보고서 삭제
	@Override
	public int deleteDonateActivityreport(int reportNo) {
		return dao.deleteDonateActivityreport(reportNo);
	}


	
}







