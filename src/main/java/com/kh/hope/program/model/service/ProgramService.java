package com.kh.hope.program.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.program.dao.ProgramDao;
import com.kh.hope.program.model.vo.Likes;
import com.kh.hope.program.model.vo.Program;
import com.kh.hope.program.model.vo.Request;

@Repository
public class ProgramService {

	@Autowired
	private ProgramDao dao;
	
	public List<Program> selectProgramList() {
		return dao.selectProgramList();
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

	public int programLike(Likes l) {
		return dao.programLike(l);
	}

	public boolean isLikeExists(int programNo, int userNo) {
		return dao.isLikeExists(programNo, userNo);
	}

	public int requestCount(int programNo) {
		return dao.requestCount(programNo);
	}
}
