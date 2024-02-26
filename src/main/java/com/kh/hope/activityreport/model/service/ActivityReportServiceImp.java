package com.kh.hope.activityreport.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.activityreport.model.dao.ActivityReportDao;
import com.kh.hope.board.model.vo.Board;

import jakarta.servlet.ServletContext;

@Service
public class ActivityReportServiceImp implements ActivityReportService{
	
	@Autowired
	private ActivityReportDao dao;
	
	@Autowired
	private ServletContext application;
	
	@Override
	public int selectListCount(Map<String, Object> map) {
		
		return dao.selectListCount(map);
	}
	
	/* 활동보고서 상세보기 */
	@Override
	public Board selectBoard(int reportNo) {
		
		return dao.selectBoard(reportNo);
	}
	@Override
	public int increaseCount(int reportNo) {
		return dao.increaseCount(reportNo);
	}
}
