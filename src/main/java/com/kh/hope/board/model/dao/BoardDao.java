package com.kh.hope.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.attachment.model.vo.Attachment;
import com.kh.hope.board.model.vo.Board;
import com.kh.hope.board.model.vo.BoardExt;
import com.kh.hope.board.model.vo.BoardType;
import com.kh.hope.common.model.vo.PageInfo;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate session;

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

	public int insertNotice(Board b) {
		
		return session.insert("boardMapper.insertNotice",b);
	}

	public int insertNoticeImgList(List<Attachment> imgList) {
		
		return session.insert("boardMapper.insertNoticeImgList",imgList);
	}
	/*공지사항 상세보기*/
	public Board selectBoard(int boardNo) {
		
		return session.selectOne("boardMapper.selectBoard",boardNo);
	}

	public int increaseCount(int boardNo) {
		// TODO Auto-generated method stub
		return session.update("boardMapper.increaseCount",boardNo);
	}

	public List<Attachment> selectImgList(int boardNo) {
		
		return session.selectList("boardMapper.selectImgList",boardNo);
	}

	public Attachment selectImg(int fileNo) {
		return session.selectOne("boardMapper.selectImg",fileNo);
	}

	public BoardExt selectUpdateBoard(int boardNo) {
		
		return session.selectOne("boardMapper.selectUpdateBoard",boardNo);
	}

	public int updateBoardInsert(Board b) {
		return session.update("boardMapper.updateBoardInsert",b);
	}

	public int updateNoticeImg(Attachment at) {
		return session.update("boardMapper.updateNoticeImg",at);
	}

	public int insertNoticeImg(Attachment at) {
		return session.insert("boardMapper.insertNoticeImg",at);
	}

	public int deleteNoticeImg(String deleteList) {
		return session.delete("boardMapper.deleteNoticeImg",deleteList);
	}

	public List<String> selectFileList() {
		
		return session.selectList("boardMapper.selectFileList");
	}

	public List<BoardType> selectBoardTypeList() {
		
		return session.selectList("boardMapper.selectBoardTypeList");
	}

	public void deleteAttachment(int fileNo) {
		session.delete("boardMapper.deleteAttachment",fileNo);
	}

	public int deleteNotice(int boardNo) {
		return session.update("boardMapper.deleteNotice",boardNo);
	}

	public int insertFaq(Board b) {
		
		return session.insert("boardMapper.insertFaq",b);
	}
	/*이야기리스트 */
	public int selectStoryCount(Map<String, Object> map) {
		
		return session.selectOne("boardMapper.selectStoryCount",map);
	}

	public List<Board> storyList(PageInfo pi, Map<String, Object> map) {
		int limit = pi.getBoardLimit();
		int offset=(pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return session.selectList("boardMapper.storyList",map,rowBounds);
	}

	/*나눔후기 리스트*/
	public int selectReviewCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectOne("boardMapper.selectReviewCount",map);
	}

	public List<Board> reviewList(PageInfo pi, Map<String, Object> map) {
		int limit = pi.getBoardLimit();
		int offset=(pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return session.selectList("boardMapper.reviewList",map,rowBounds);
	}

	public void deleteReply(int boardNo) {
		session.update("boardMapper.deleteReply",boardNo);
		
	}
}
