package com.kh.hope.main.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.board.model.vo.Board;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.main.model.dao.MainDao;
import com.kh.hope.main.model.vo.MainTotal;

import jakarta.servlet.ServletContext;


@Service
public class MainService {

	@Autowired
	private MainDao mainDao;
	
	@Autowired
	private ServletContext application;

//	공지사항 리스트
	public List<Board> selectNoticeList5(Map<String, Object> map) {
		return mainDao.selectNoticeList5(map);
	}

//	나눔소식 리스트
	public List<Board> selectShareListTop(Map<String, Object> map) {
		return mainDao.selectShareListTop(map);
	}

//	마감임박 후원
	public Donate selectDonateEnd() {
		return mainDao.selectDonateEnd();
	}

//	후원 리스트
	public List<Donate> selectDonateList(Map<String, Object> map) {
		return mainDao.selectDonateList(map);
	}

//  총 후원자수, 총 봉사활동 지원자 수
	public MainTotal selectTotal() {
		return mainDao.selectTotal();
	}

}
