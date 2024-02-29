package com.kh.hope.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.admin.model.dao.AdminDao;
import com.kh.hope.admin.model.vo.BlackList;
import com.kh.hope.chat.model.vo.Chat;
import com.kh.hope.chat.model.vo.ChatJoin;
import com.kh.hope.chat.model.vo.ChatMessage;
import com.kh.hope.user.model.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminServiceImpl implements AdminService{

	
	@Autowired
	public AdminDao adminDao;
	
	/* ============================================== 회원 시작 ==============================================*/
	// 사용자 조회
	@Override
	public List<User> selectAllUser() {
		return adminDao.selectAllUser();
	}
	
	// 사용자 삭제
	@Override
	public int deleteUser(int userNo, String reason) {
		
		int result = adminDao.deleteUser(userNo);
		
		if(result > 0) {
			// 블랙리스트 추가
			BlackList blackList = BlackList.builder()
									.reason(reason)
									.userNo(userNo)
									.build();
			adminDao.blackListInsert(blackList);
		}
		
		return result;
	}
	// 회원정보 확인
	@Override
	public User getUserOne(int userNo) {
		
		System.out.println("serviceImpl : " + userNo);
		return adminDao.getUserOne(userNo);
	}
	// 회원정보확인 수정
	@Override
	public int updateUserInfo(User user) {
		
		return adminDao.updateUserInfo(user);
	}
	// 회원 이름검색
	@Override
	public List<User> searchUserByName(String userName) {
		return adminDao.searchUserByName(userName);
	}
	
	// 블랙리스트 조회
	@Override
	public List<BlackList> blackListView() {
		return adminDao.blackListView();
	}
	//User 테이블 정지풀기
	@Override
	public int releseStop(int userNo) {
		return adminDao.releseStop(userNo);
	}
	// 블랙리스트 정지풀기
	@Override
	public int modifyUserStop(int userNo) {
		return adminDao.modifyUserStop(userNo);
	}
	// 블랙리스트 회원번호 검색
	@Override
	public List<BlackList> searchByUserNo(int userNo) {
		return adminDao.searchByUserNo(userNo);
	}
	
	/* ============================================== 회원 끝 ==============================================*/
	
	
	/* ============================================== 채팅 시작 ==============================================*/
	
	// 채팅방 리스트 조회
	@Override
	public List<Chat> selectChatRoomList() {
		return adminDao.selectChatRoomList();
	}
	
	// 채팅방 조인 조회
	@Override
	public List<ChatJoin> selectJoinList() {
		return adminDao.selectJoinList();
	}
	// 채팅방 생성
	@Override
	public int openChatRoom(Chat c) {
		return adminDao.openChatRoom(c);
	}
	
	// 채팅방 입장
	@Override
	public List<ChatMessage> joinChatRoom(ChatJoin join) {
		
		// chatJoin 데이터 INSERT 후, 채팅메시지 목록 조회후 반환
		List<ChatMessage> list = null;
		
		/**
		 * 1. 현재 회원이 해당 채팅방에 참여하고 있는지 확인, (SELECT)

		 * 2. 참여하고 있지 않다면 참여 (INSERT)
		 * */
		
		// 사용자가 채팅방 입장 했는지 조회
		int result = adminDao.joinCheck(join);

		try {
			if(result == 0) {
			// 처음 참가한 사용자는 insert
			result = adminDao.joinChatRoom(join);
			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(result > 0) {
			
			// 이미 참가했던 사용자는 메세지만 select
			list = adminDao.selectChatMessage(join.getChatNo());
		}
		return list;
		
	}
	// 채팅방 삭제
	@Override
	public int deleteChatRoom(ChatJoin join) {
		
		// chatJoin 채팅방 나가기 
		int result = adminDao.deleteChatRoom(join);

		// chat 채팅방 삭제
		if(result > 0) {
			int age = adminDao.deleteChat(join);
		}
		return 0;
	}
	// 채팅방 제목 검색
	@Override
	public List<Chat> chatByName(Chat c) {
		return adminDao.chatByName(c);
	}
	
	
	/* ============================================== 채팅 끝 ==============================================*/
	
	
	
	/* ============================================== 대시보드 시작 ==============================================*/	

	// 회원 리스트 조회
		@Override
		public List<User> dashboardUser() {
			return adminDao.dashboardUser();
		}
	// 기부금액 합계 	
		@Override
		public int dashboardAmount() {
			return adminDao.dashboardAmount();
		}

	// 게시판 수
		@Override
		public int dashboardTotalBoardCount() {
			return adminDao.dashboardTotalBoardCount();
		}
	// 채팅방 합계
		@Override
		public int dashboardChatTotalCount() {
			return adminDao.dashboardChatTotalCount();
		}

	/* ============================================== 대시보드  끝 =============================================*/


}
