package com.kh.hope.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.chat.model.dao.ChatDao;
import com.kh.hope.chat.model.vo.Chat;
import com.kh.hope.chat.model.vo.ChatJoin;
import com.kh.hope.chat.model.vo.ChatMessage;
import com.kh.hope.config.Utils;

@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private ChatDao chatDao;

	@Override
	public int insertMessage(ChatMessage chatMessage) {

		// 공격 핸들링
		chatMessage.setMessage(Utils.XSSHandling(chatMessage.getMessage()));
		chatMessage.setMessage(Utils.newLineHandling(chatMessage.getMessage()));
		
		return chatDao.insertMessage(chatMessage);
	}

	@Override
	public List<Chat> selectChatRoomList() {
		return chatDao.selectChatRoomList();
	}

	@Override
	public int openChatRomm(Chat c) {
		return chatDao.openChatRoom(c);
	}

	@Override
	public List<ChatMessage> joinChatRoom(ChatJoin join) {
		
		// chatJoin 데이터 INSERT 후, 채팅메시지 목록 조회후 반환
		List<ChatMessage> list = null;
		
		/**
		 * 1. 현재 회원이 해당 채팅방에 참여하고 있는지 확인, (SELECT)
		 * 
		 * 2. 참여하고 있지 않다면 참여 (INSERT)
		 * */
		
		int result = chatDao.joinCheck(join);
		

		try {
			if(result == 0) {
			// 처음 참가한 사용자는 insert
			result = chatDao.joinChatRoom(join);
			}
		}catch(Exception e) {
			// 에러 발생
			e.printStackTrace();
		}
		if(result > 0) {
			// 이미 참가했던 사용자는 메세지만 select
			list = chatDao.selectChatMessage(join.getChatNo());
		}
		return list;
		
	}
}


