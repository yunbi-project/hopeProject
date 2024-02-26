package com.kh.hope.board.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hope.attachment.model.vo.Attachment;
import com.kh.hope.board.model.dao.BoardDao;
import com.kh.hope.board.model.vo.Board;
import com.kh.hope.board.model.vo.BoardExt;
import com.kh.hope.board.model.vo.BoardType;
import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.config.Utils;

import jakarta.servlet.ServletContext;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao dao;
	
	@Autowired
	private ServletContext application;


	/*공지사항리스트*/
	@Override
	public int selectListCount(Map<String, Object> map) {
		
		return dao.selectListCount(map);
	}

	@Override
	public List<Board> noticeList(PageInfo pi, Map<String, Object> map) {
	
		return dao.noticeList(pi,map);
	}
	/*자주묻는질문*/
	@Override
	public List<Board> faqList() {
		
		return dao.faqList();
	}
	@Override
	public List<Board> faqList1() {
		return dao.faqList1();
	}
	

	@Override
	public List<Board> faqList2() {
		
		return dao.faqList2();
	}

	@Override
	public List<Board> faqList3() {
		
		return dao.faqList3();
	}
	
	/*공지등록*/
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertNotice(Board b, List<Attachment> imgList) throws Exception {
		b.setBoardContent(Utils.XSSHandling(b.getBoardContent()));
		b.setBoardContent(Utils.newLineHandling(b.getBoardContent()));
		b.setBoardTitle(Utils.XSSHandling(b.getBoardTitle()));
		int result =  dao.insertNotice(b);
		
		int boardNo = b.getBoardNo();
		if(!imgList.isEmpty()) {
			for(Attachment at : imgList) {
				at.setRefFno(boardNo);
			}
			result = dao.insertNoticeImgList(imgList);
			
			if(result != imgList.size()) {
				throw new Exception("예외 강제 발생");
			}
		}
		return result;
	}
	/*공지사항 상세보기*/
	@Override
	public Board selectBoard(int boardNo) {
		
		return dao.selectBoard(boardNo);
	}
	@Override
	public int increaseCount(int boardNo) {
		return dao.increaseCount(boardNo);
	}
	@Override
	public List<Attachment> selectImgList(int boardNo) {
		return dao.selectImgList(boardNo);
	}
	@Override
	public Attachment selectImg(int fileNo) {
		return dao.selectImg(fileNo);
	}
	/*수정 상세*/
	@Override
	public BoardExt selectUpdateBoard(int boardNo) {
		return dao.selectUpdateBoard(boardNo);
	}
	/*수정등록*/
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateBoardInsert(Board b,String boardTypeNo, String deleteList, List<MultipartFile> upfiles) {
	
		b.setBoardContent(Utils.XSSHandling(b.getBoardContent()));
		b.setBoardContent(Utils.newLineClear(b.getBoardContent()));
		b.setBoardTitle(Utils.XSSHandling(b.getBoardTitle()));
		
		int result = dao.updateBoardInsert(b);
		
		String webPath = "/resources/images/board/"+boardTypeNo+"/";
		String serverFolerPath = application.getRealPath(webPath);
		
		if(result>0) {
			List<Attachment> imgList = new ArrayList();
			
			if(upfiles != null) {
				for(int i=0; i<upfiles.size(); i++) {
					if(!upfiles.get(i).isEmpty()) {
						String changeName = Utils.saveFile(upfiles.get(i), serverFolerPath);
						
						Attachment at = new Attachment();
						at.setChangeName(changeName);
						at.setOriginName(upfiles.get(i).getOriginalFilename());
						at.setRefFno(b.getBoardNo());
						at.setImgLevel(i);
						
						imgList.add(at);
						
					}
				}
			}
			if(deleteList != null && !deleteList.equals("")) {
				result = dao.deleteNoticeImg(deleteList);
			}
			if(result>0) {
				for(Attachment at : imgList) {
					result = dao.updateNoticeImg(at);
					if(result==0) {
						result = dao.insertNoticeImg(at);
					}
				}
			}
		}
		return result;
	
	}

	@Override
	public List<String> selectFileList() {
		
		return dao.selectFileList();
	}

	@Override
	public List<BoardType> selectBoardTypeList() {
		return dao.selectBoardTypeList();
	}
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int deleteNotice(int boardNo) {
		
		List<Attachment> imgList = dao.selectImgList(boardNo);
		
		  // 파일 정보가 있다면 DB에서만 파일 정보 삭제
        if (imgList != null && !imgList.isEmpty()) {
            for (Attachment at : imgList) {
                dao.deleteAttachment(at.getFileNo());
            }
        }
		
		int result = dao.deleteNotice(boardNo);
		return result;
	}

	@Override
	public int insertFaq(Board b) {
		
		return dao.insertFaq(b);
	}
/*이야기리스트*/
	
	@Override
	public int selectStoryCount(Map<String, Object> map) {
	
		return dao.selectStoryCount(map);
	}

	@Override
	public List<Board> storyList(PageInfo pi, Map<String, Object> map) {
		
		return dao.storyList(pi,map);
	}
	/*나눔후기*/

	@Override
	public int selectReviewCount(Map<String, Object> map) {
		
		return dao.selectReviewCount(map);
	}

	@Override
	public List<Board> reviewList(PageInfo pi, Map<String, Object> map) {
		
		return  dao.reviewList(pi,map);
	}

	

	
	
}
