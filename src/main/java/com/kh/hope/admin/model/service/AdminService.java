package com.kh.hope.admin.model.service;

import java.util.List;

import com.kh.hope.admin.model.vo.BlackList;
import com.kh.hope.chat.model.vo.Chat;
import com.kh.hope.chat.model.vo.ChatJoin;
import com.kh.hope.chat.model.vo.ChatMessage;
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

/* ============================================== 대시보드  끝 =============================================*/






}
