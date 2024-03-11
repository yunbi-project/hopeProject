package com.kh.hope.activityreport.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.activityreport.model.vo.ActivityReport;
import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.program.model.vo.Program;

@Repository
public class ActivityReportDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	/* 활동보고서 리스트 */
	public int selectListCount(Map<String, Object> map) {
		
		return session.selectOne("activityreportMapper.selectListCount",map);
	}

	public List<ActivityReport> reportList(PageInfo pi, Map<String, Object> map) {
		
		int limit = pi.getBoardLimit();
		int offset=(pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return session.selectList("activityreportMapper.reportList",map,rowBounds);
	}
	
	
	/* 활동보고서 상세보기 */
	public ActivityReport selectActivityReport(int reportNo) {
		return session.selectOne("activityreportMapper.selectActivityReport",reportNo);
	}

	public int increaseCount(int reportNo) {
		return session.update("activityreportMapper.increaseCount",reportNo);
	}

	
	public int insertActivityReport(ActivityReport activityReport) {
		return session.insert("activityreportMapper.insertActivityReport",activityReport);
	}


	public int updateActivityReport(ActivityReport activityreport) {
		return session.update("activityreportMapper.updateActivityReport", activityreport);
	}

	public int deleteActivityReport(int reportNo) {
		return session.update("activityreportMapper.deleteActivityReport", reportNo);
	}
	
	/* 봉사활동 종료 가져오기 */
	public Program selectProgramReport(int programNo) {
		return session.selectOne("activityreportMapper.selectProgramReport", programNo);
	}
	
	// 봉사활동 활동보고서 작성여부 Y로 변경
	public int updateProgramReport(int programNo) {
		return session.update("activityreportMapper.updateProgramReport", programNo);
	}
	
	// 후원후기 종료 가져오기
	public Donate selectDonateReport(int donateNo) {
		return session.selectOne("activityreportMapper.selectDonateReport", donateNo);
	}
	
	// 후원후기 보고서 작성
	public int activityInsertDonateForm(ActivityReport activityReport) {
		return session.insert("activityreportMapper.activityInsertDonateForm", activityReport);
	}
	
	// 후원게시판 활동보고서 작성여부 Y로 변경
	public int updateDonateReport(int donateNo) {
		return session.update("activityreportMapper.updateDonateReport", donateNo);
	}

	public List<ActivityReport> reportDonateList(PageInfo pi, Map<String, Object> map) {
		int limit = pi.getBoardLimit();
		int offset=(pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return session.selectList("activityreportMapper.reportDonateList",map, rowBounds);
	}
	
	// 후원후기 상세페이지
	public ActivityReport selectActivityDonateReport(int reportNo) {
		return session.selectOne("activityreportMapper.selectActivityDonateReport", reportNo);
	}
	
	// 후원후기 보고서 수정
	public int activityReportDonateUpdate(ActivityReport activityreport) {
		return session.update("activityreportMapper.activityReportDonateUpdate", activityreport);
	}
	
	// 후원후기 보고서 삭제
	public int deleteDonateActivityreport(int reportNo) {
		return session.update("activityreportMapper.deleteDonateActivityreport", reportNo);
	}



	
	
	
}