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

	public int requestCount(int programNo) {
		return session.selectOne("program.requestCount",programNo);
	}

	public int selectListCount(Map<String, Object> map) {
		return session.selectOne("program.selectListCount", map);
	}

	public List<Program> filterList(PageInfo pi, Map<String, Object> map) {
		int limit = pi.getBoardLimit();
		int offset=(pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return session.selectList("program.filterList", map, rowBounds);
	}

	public Request requestSelectProgram(Request r) {
		return session.selectOne("program.requestSelectProgram", r);
	}

	public int isLikeExists(int userNo, int programNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("userNo", userNo);
		param.put("programNo", programNo);
		return session.selectOne("program.isLikeExists", param);
	}

	public int programLike(Likes l) {
		return session.insert("program.programLike", l);
	}

	public int programUnlike(Likes l) {
		return session.delete("program.programUnlike", l);
	}

	public int requestProgram(Request r) {
		return session.insert("program.requestProgram", r);
	}

	public int isRequestExists(int userNo, int programNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("userNo", userNo);
		param.put("programNo", programNo);
		return session.selectOne("program.isRequestExists", param);
	}
}
