package com.kh.hope.program.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.program.model.vo.Program;

@Repository
public class ProgramDao {

	@Autowired
	private SqlSession session;
	
	public List<Program> selectProgramList() {
		return session.selectList("program.selectProgramList");
	}

	public Program selectProgramDetail(int programNo) {
		return session.selectOne("program.selectProgramDetail", programNo);
	}

}
