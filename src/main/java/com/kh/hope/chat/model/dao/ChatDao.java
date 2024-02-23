package com.kh.hope.chat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.chat.model.vo.Chat;
import com.kh.hope.chat.model.vo.ChatJoin;
import com.kh.hope.chat.model.vo.ChatMessage;

@Repository
public class ChatDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public int insertMessage(ChatMessage chatMessage) {
		return session.insert("chatMapper.insertMessage", chatMessage);
	}

	public List<Chat> selectChatRoomList() {
		return session.selectList("chatMapper.selectChatRoomList");
	}

	public List<ChatJoin> selectJoinList() {
		return session.selectList("chatMapper.selectJoinList");
	}

	public int openChatRoom(Chat c) {
		
		int result = session.insert("chatMapper.openChatRoom", c);
		
		if(result > 0) {
			result = c.getChatNo(); // 정상적으로 값이 넘어오면 출력
		}
		
		return result;
	}

	public int joinChatRoom(ChatJoin join) {

		return session.insert("chatMapper.joinChatRoom", join);
	}

	public List<ChatMessage> selectChatMessage(int chatNo) {
		return session.selectList("chatMapper.selectChatMessage", chatNo);
	}

	public int joinCheck(ChatJoin join) {
		return session.selectOne("chatMapper.joinCheck", join);
	}

//	public int deleteUserChat(ChatJoin join) {
//		return session.update("chatMapper.deleteUserChat", join);
//	}

	public int joinDeleteChat(ChatJoin join) {
		return session.update("chatMapper.joinDeleteChat" , join);
	}

}
