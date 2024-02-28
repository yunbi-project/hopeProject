package com.kh.hope.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.admin.model.vo.BlackList;
import com.kh.hope.chat.model.vo.Chat;
import com.kh.hope.chat.model.vo.ChatJoin;
import com.kh.hope.chat.model.vo.ChatMessage;
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
}
	
	

	
/* ============================================== 채팅 끝 ==============================================*/
	
	


