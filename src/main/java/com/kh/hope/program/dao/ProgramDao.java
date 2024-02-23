package com.kh.hope.program.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.program.model.vo.Likes;
import com.kh.hope.program.model.vo.Program;
import com.kh.hope.program.model.vo.Request;

@Repository
public class ProgramDao {

	@Autowired
	private SqlSession session;
	
	public List<Program> selectProgramList(PageInfo pi, Map<String, Object> map) {
		int limit = pi.getBoardLimit();
		int offset=(pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return session.selectList("program.selectProgramList",map, rowBounds);
	}

	public Program selectProgramDetail(int programNo) {
		return session.selectOne("program.selectProgramDetail", programNo);
	}

	public int insertProgram(Program program) {
		return session.insert("program.insertProgram", program);
	}

	public Program detailProgram(int programNo) {
		return session.selectOne("program.detailProgram", programNo);
	}

	public int requestProgram(Request r) {
		return session.insert("program.requestProgram", r);
	}

	public int programLike(Likes l) {
		return session.insert("program.programLike", l);
	}

	public boolean isLikeExists(int programNo, int userNo) {
	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("programNo", programNo);
	    parameters.put("userNo", userNo);
	    return session.selectOne("program.isLikeExists", parameters);
	}

	public int requestCount(int programNo) {
		return session.selectOne("program.requestCount",programNo);
	}

	public int selectListCount(Map<String, Object> map) {
		return session.selectOne("program.selectListCount", map);
	}


}
