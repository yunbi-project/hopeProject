package com.kh.hope.program.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.hope.chat.model.vo.Chat;
import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.program.dao.ProgramDao;
import com.kh.hope.program.model.vo.Likes;
import com.kh.hope.program.model.vo.Program;
import com.kh.hope.program.model.vo.Request;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProgramService {

	@Autowired
	private ProgramDao dao;
	
	public List<Program> selectProgramList(PageInfo pi, Map<String, Object> map) {
		return dao.selectProgramList(pi, map);
	}
	public int selectListCount(Map<String, Object> map) {
		return dao.selectListCount(map);
	}
	public Program selectProgramDetail(int programNo) {
		return dao.selectProgramDetail(programNo);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int insertProgram(Program program, Chat c) {
		
		int result = dao.insertProgram(program);
		
		if (result > 0) {
			// 게시글 조회
			 int selectProgramNo = dao.selectchatProgram(program); 
			
			c.setProgramNo(selectProgramNo);
			log.info("service chat 정보확인 :  {} ", c );
			result = dao.insertChat(c);
		}
		
		return result;
	}

	public Program detailProgram(int programNo) {
		return dao.detailProgram(programNo);
	}

	public int requestCount(int programNo) {
		return dao.requestCount(programNo);
	}
	public List<Program> filterList(PageInfo pi, Map<String, Object> map) {
		return dao.filterList(pi, map);
	}
	public Request requestSelectProgram(Request r) {
		return dao.requestSelectProgram(r);
	}
	
	//좋아요한 게시물이 존재하는지 확인
	public int isLikeExists(int userNo, int programNo) {
		return dao.isLikeExists(userNo, programNo);
	}
	
	//programNo, userNo 게시글 좋아요
	public int programLike(Likes l) {
		return dao.programLike(l);
	}
	
	//게시글 좋아요 삭제
	public int programUnlike(Likes l) {
		return dao.programUnlike(l);
	}
	
	public int requestProgram(Request r) {
		return dao.requestProgram(r);
	}
	public int isRequestExists(int userNo, int programNo) {
		return dao.isRequestExists(userNo, programNo);
	}
	public String getRecruitment(int programNo) {
		return dao.getRecruitment(programNo);
	}
	public int updateProgram(Program program) {
		return dao.updateProgram(program);
	}
	public int deleteProgram(int programNo) {
		return dao.deleteProgram(programNo);
	}
	// 채팅방 생성
	public int insertChat(Chat c) {
		
		return dao.insertChat(c);
	}
	// 채팅방 조회
	public int selectChat(Chat c) {
		return dao.selectChat(c);
	}
	// programNo값이랑 같은 채팅방을 가져온다.
	public int selectChatRoomNo(Chat c) {
		return dao.selectChatRoomNo(c);
	}
}
