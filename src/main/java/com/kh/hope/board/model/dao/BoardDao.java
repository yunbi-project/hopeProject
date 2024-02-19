package com.kh.hope.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.board.model.vo.Board;
import com.kh.hope.common.model.vo.PageInfo;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate session;

//	public List<Board> noticeList() {
//		
//		return session.selectList("boardMapper.noticeList");
//	}


	public List<Board> storyList() {
			return session.selectList("boardMapper.storyList");
	}

	/*공지사항리스트*/
	public int selectListCount(Map<String, Object> map) {
		
		return session.selectOne("boardMapper.selectListCount",map);
	}

	public List<Board> noticeList(PageInfo pi, Map<String, Object> map) {
		
		int limit = pi.getBoardLimit();
		int offset=(pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return session.selectList("boardMapper.noticeList",map,rowBounds);
	}
	/*자주묻는질문 리스트*/
	public List<Board> faqList() {
		
		return session.selectList("boardMapper.faqList");
	}
	public List<Board> faqList1() {
		
		return session.selectList("boardMapper.faqList1");
	}

	public List<Board> faqList2() {
		
		return session.selectList("boardMapper.faqList2");
	}

	public List<Board> faqList3() {
		
		return session.selectList("boardMapper.faqList3");
	}
}
