package com.kh.hope.program.model.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.program.dao.ProgramDao;
import com.kh.hope.program.model.vo.Likes;
import com.kh.hope.program.model.vo.Program;
import com.kh.hope.program.model.vo.Request;

@Repository
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

	public int insertProgram(Program program) {
		return dao.insertProgram(program);
	}

	public Program detailProgram(int programNo) {
		return dao.detailProgram(programNo);
	}

	public int requestProgram(Request r) {
	    return dao.requestProgram(r);
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
	public Likes isLikeExists(Likes l) {
		return dao.isLikeExists(l);
	}
	public int programLike(Likes l) {
		return dao.programLike(l);
	}
	
}
