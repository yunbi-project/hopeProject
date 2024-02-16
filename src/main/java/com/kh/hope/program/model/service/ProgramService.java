package com.kh.hope.program.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.program.dao.ProgramDao;
import com.kh.hope.program.model.vo.Program;

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
}
