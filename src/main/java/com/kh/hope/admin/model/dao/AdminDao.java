package com.kh.hope.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.activityreport.model.vo.ActivityReport;
import com.kh.hope.admin.model.vo.BlackList;
import com.kh.hope.attachment.model.vo.Attachment;
import com.kh.hope.board.model.vo.Board;
import com.kh.hope.board.model.vo.Reply;
import com.kh.hope.board.model.vo.Report;
import com.kh.hope.chat.model.vo.Chat;
import com.kh.hope.chat.model.vo.ChatJoin;
import com.kh.hope.chat.model.vo.ChatMessage;
import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.payment.model.vo.PaymentInfo;
import com.kh.hope.product.model.vo.Product;
import com.kh.hope.program.model.vo.Program;
import com.kh.hope.user.model.vo.User;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSession session;

/* ============================================== 회원 시작 ==============================================*/
	// 사용자 조회
	public List<User> selectAllUser() {
		return session.selectList("adminMapper.selectAllUser");
	}
	
	// 사용자 삭제
	public int deleteUser(int userNo) {
		return session.update("adminMapper.deleteUser", userNo);
	}
	// 블랙리스트 Insert
	public int blackListInsert(BlackList blackList) {
		return session.insert("adminMapper.blackListInsert", blackList);
	}
	// 회원정보 확인
	public User getUserOne(int userNo) {
		return session.selectOne("adminMapper.getUserOne", userNo);
	}
	// 회원정보 수정
	public int updateUserInfo(User user) {
		return session.update("adminMapper.updateUserInfo" , user);
	}
	// 이름 검색
	public List<User> searchUserByName(String userName) {
		return session.selectList("adminMapper.searchUserByName" , userName);
	}
	// 블랙리스트 조회
	public List<BlackList> blackListView() {
		return session.selectList("adminMapper.blackListView");
	}
	// User 테이블 정지풀기
	public int releseStop(int userNo) {
		return session.update("adminMapper.releseStop" , userNo);
	}
	// 블랙리스트 정지풀기
	public int modifyUserStop(int userNo) {
		return session.update("adminMapper.modifyUserStop", userNo);
	}
	// 블랙리스트 회원번호 검색
	public List<BlackList> searchByUserNo(int userNo) {
		return session.selectList("adminMapper.searchByUserNo" , userNo);
	}
	
/* ============================================== 회원 끝 ==============================================*/	
	
	
/* ============================================== 채팅 시작 ==============================================*/
	
	// 채팅방 리스트 조회
	public List<Chat> selectChatRoomList() {
		return session.selectList("adminMapper.selectChatRoomList");
	}
	
	// 채팅방 조인 조회
	public List<ChatJoin> selectJoinList() {
		return session.selectList("adminMapper.selectJoinList");
	}
	
	// 채팅방 생성
	public int openChatRoom(Chat c) {
		int result = session.insert("adminMapper.openChatRoom", c);
		return result;
	}
	
	// 처음 참가한 사용자는 insert
	public int joinChatRoom(ChatJoin join) {
		return session.insert("adminMapper.joinChatRoom", join);
	}
	
	// 이미 참가했던 사용자는 메세지만 select
	public List<ChatMessage> selectChatMessage(int chatNo) {
		return session.selectList("adminMapper.selectChatMessage", chatNo);
	}
	
	// 사용자가 채팅방 입장 했는지 조회
	public int joinCheck(ChatJoin join) {
		return session.selectOne("adminMapper.joinCheck", join);
	}
	
	// chatJoin 채팅방 삭제
	public int deleteChatRoom(ChatJoin join) {
		return session.update("adminMapper.deleteUserChat", join);
	}
	
	// chat 삭제
	public int deleteChat(ChatJoin join) {
		return session.update("adminMapper.deleteChat", join);
		
	}
	
	// 채팅방 제목 검색
	public List<Chat> chatByName(Chat c) {
		return session.selectList("adminMapper.chatByName", c);
	}

	
	

	
/* ============================================== 채팅 끝 ==============================================*/
	

/* ============================================== 대시보드 시작 ==============================================*/	

	// 회원 리스트 조회
	public List<User> dashboardUser() {
		return session.selectList("adminMapper.dashboardUser");
	}
	// 기부금액 합계
	public int dashboardAmount() {
		return session.selectOne("adminMapper.dashboardAmount");
	}

	// 게시글 수
	public int dashboardTotalBoardCount() {
		return session.selectOne("adminMapper.dashboardTotalBoardCount");
	}
	// 채팅방 합계
	public int dashboardChatTotalCount() {
		return session.selectOne("adminMapper.dashboardChatTotalCount");
	}

	// 기부 그래프
	public List<PaymentInfo> getDailyIncome() {
		return session.selectList("adminMapper.getDailyIncome");
	}
	// donate 리스트 뽑기
	public List<PaymentInfo> selectDonate() {
		return session.selectList("adminMapper.selectDonate");
	}
	// userList
	public List<User> dashboarduserList() {
		return session.selectList("adminMapper.dashboarduserList");
	}

/* ============================================== 대시보드  끝 =============================================*/
	
	/*=============================================신고시작========================*/
	//신고리스트
	
	public List<Report> reportBoardList() {
		
		return session.selectList("adminMapper.reportBoardList");
	}
	public List<Report> reportReplyList() {
		return session.selectList("adminMapper.reportReplyList");
	}
	public int deleteReport(int reportNo) {
		return session.update("adminMapper.deleteReport",reportNo);
	}
	public Board selectReportBoard(int reportNo) {
		return session.selectOne("adminMapper.selectReportBoard",reportNo);
	}
	public List<Attachment> selectReportImgList(int reportNo) {
		return session.selectList("adminMapper.selectReportImgList",reportNo);
	}
	public int deleteBoardReport(int boardNo) {
		return session.update("adminMapper.deleteBoardReport",boardNo);
	}
	public int deleteReportList(int boardNo) {
		return session.update("adminMapper.deleteReportList",boardNo);
	}
	public Reply selectReply(int replyNo) {
		return session.selectOne("adminMapper.selectReply",replyNo);
	}
	public int deleteReplyDatailReport(int replyNo) {
		return session.update("adminMapper.deleteReplyDatailReport",replyNo);
	}
	public int deleteReportReplyList(int replyNo) {
		return session.update("adminMapper.deleteReportReplyList",replyNo);
	}
	
//댓글관리
	public List<Reply> ReplyList() {
		return session.selectList("adminMapper.ReplyList");
	}

	public List<Reply> ReplyTodayList() {
		return session.selectList("adminMapper.ReplyTodayList");
	}
	
	//게시판관리 물품기부
	public List<Product> productList() {
		return session.selectList("adminMapper.productList");
				}
	//게시판관리 봉사활동
		public int selectProgramCount(Map<String, Object> map) {
			return session.selectOne("adminMapper.selectProgramCount",map);
		}

		public List<Program> programList(PageInfo pi, Map<String, Object> map) {
			int limit = pi.getBoardLimit();
			int offset=(pi.getCurrentPage()-1)*limit;
			
			RowBounds rowBounds = new RowBounds(offset,limit);
			
			return session.selectList("adminMapper.programList",map,rowBounds);
		}
	//후원모집
		public int selectDonateCount(Map<String, Object> map) {
			return session.selectOne("adminMapper.selectDonateCount",map);
		}

		public List<Donate> donateList(PageInfo pi, Map<String, Object> map) {
			int limit = pi.getBoardLimit();
			int offset=(pi.getCurrentPage()-1)*limit;
			
			RowBounds rowBounds = new RowBounds(offset,limit);
			
			return session.selectList("adminMapper.donateList",map,rowBounds);
		}

		public int deleteReply(int replyNo) {
			return session.update("adminMapper.deleteReply",replyNo);
		}
		//물품수령

		public int confirmProduct(int productNo) {
			return session.update("adminMapper.confirmProduct",productNo);
		}

		public int deleteProduct(int productNo) {
			return session.delete("adminMapper.deleteProduct",productNo);
		}
		//물품수령확인내역
		public List<Product> productConfirmList() {
			return session.selectList("adminMapper.productConfirmList");
		}
		//프로그램 명단
		public List<Program> programPeople(int programNo) {
			return session.selectList("adminMapper.programPeople",programNo);
		}

		public Program programPeopleCount(int programNo) {
			return session.selectOne("adminMapper.programPeopleCount",programNo);
		}
		//프로그램 삭제
		public int deleteProgram(int programNo) {
			return session.update("adminMapper.deleteProgram",programNo);
		}

		public int deleteDonate(int donateNo) {
			return session.update("adminMapper.deleteDonate",donateNo);
		}

		// 봉사활동 종료 리스트
		public List<Program> selectProgramEndList() {
			return session.selectList("adminMapper.selectProgramEndList");
		}
		
		// 후원모집 종료 리스트
		public List<Donate> selectDonateEndList() {
			return session.selectList("adminMapper.selectDonateEndList");
		}
		
		// 활동보고서 봉사 리스트
		public List<ActivityReport> selectReportList(Map<String, Object> map) {
			return session.selectList("adminMapper.selectReportList", map);
		}

		// 활동보고서 후원 리스트
		public List<ActivityReport> selectDonateReportList(Map<String, Object> map) {
			return session.selectList("adminMapper.selectDonateReportList");
		}

	
	
	}
	


