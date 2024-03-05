package com.kh.hope.admin.model.service;

import java.util.List;

import com.kh.hope.admin.model.vo.BlackList;
import com.kh.hope.attachment.model.vo.Attachment;
import com.kh.hope.board.model.vo.Board;
import com.kh.hope.board.model.vo.Reply;
import com.kh.hope.board.model.vo.Report;
import com.kh.hope.chat.model.vo.Chat;
import com.kh.hope.chat.model.vo.ChatJoin;
import com.kh.hope.chat.model.vo.ChatMessage;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.payment.model.vo.PaymentInfo;
import com.kh.hope.user.model.vo.User;

public interface AdminService {

/* ============================================== 회원 시작 ==============================================*/
	
	// 사용자 List 조회
	List<User> selectAllUser();
	
	
	// 사용자 삭제
	int deleteUser(int userNo, String reason);
	
	// 회원정보 확인
	User getUserOne(int userNo);
	
	// 회원정보 업데이트
	int updateUserInfo(User user);

	// 회원 이름검색
	List<User> searchUserByName(String userName);

	// 블랙리스트 List 조회
	List<BlackList> blackListView();

	// User 테이블 정지풀기
	int releseStop(int userNo);

	// 블랙리스트 테이블 정지풀기
	int modifyUserStop(int userNo);

	// 블랙리스트 회원번호 검색
	List<BlackList> searchByUserNo(int userNo);
	
/* ============================================== 회원 끝 ==============================================*/	


/* ============================================== 채팅 시작 =============================================*/
	
	// 채팅방 조회
	List<Chat> selectChatRoomList();

	// 채팅방 조인 조회
	List<ChatJoin> selectJoinList();

	// 채팅방 생성 
	int openChatRoom(Chat c);
	
	// 채팅방 입장
	List<ChatMessage> joinChatRoom(ChatJoin join);

	// 채팅방 삭제
	int deleteChatRoom(ChatJoin join);

	// 채팅방 제목 검색
	List<Chat> chatByName(Chat c);

	
	
/* ============================================== 대시보드 시작 ==============================================*/	

	// 회원 리스트 조회
	List<User> dashboardUser();

	// 기부금액 합계
	int dashboardAmount();
	
	// 게시글 수
	int dashboardTotalBoardCount();

	// 채팅방 합계
	int dashboardChatTotalCount();

	// 기부 그래프
	List<PaymentInfo> getDailyIncome();

	// donate_INFO 리스트 뽑기
	List<PaymentInfo> selectDonate();

	// 많이 접속한 채팅방명 5개
	/* List<Chat> dashboardChatRoomList(); */

/* ============================================== 대시보드  끝 =============================================*/

	
	// 신고리스트


	List<Report> reportBoardList();

	List<Report> reportReplyList();

	int deleteReport(int reportNo);

	Board selectReportBoard(int reportNo);

	List<Attachment> selectReportImgList(int reportNo);

	int deleteBoardReport(int boardNo);

	Reply selectReply(int replyNo);

	int deleteReplyDatailReport(int replyNo);

	//댓글관리
	List<Reply> ReplyList();

	List<Reply> ReplyTodayList();


}
