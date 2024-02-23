package com.kh.hope.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.hope.attachment.model.vo.Attachment;
import com.kh.hope.board.model.vo.Board;
import com.kh.hope.board.model.vo.BoardExt;
import com.kh.hope.board.model.vo.BoardType;
import com.kh.hope.common.model.vo.PageInfo;

public interface BoardService {

	/*noticeList*/
	int selectListCount(Map<String, Object> map);
	
	List<Board> noticeList(PageInfo pi, Map<String, Object> map);
	
	/*FAQList*/
	List<Board> faqList();

	List<Board> storyList();

	List<Board> faqList1();

	List<Board> faqList2();

	List<Board> faqList3();

	int insertNotice(Board b, List<Attachment> imgList) throws Exception;

	Board selectBoard(int boardNo);

	int increaseCount(int boardNo);

	List<Attachment> selectImgList(int boardNo);

	Attachment selectImg(int fileNo);

	BoardExt selectUpdateBoard(int boardNo);

	int updateBoardInsert(Board b, String deleteList, List<MultipartFile> upfiles);

	List<String> selectFileList();

	List<BoardType> selectBoardTypeList();


}
