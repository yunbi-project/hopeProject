package com.kh.hope.chat.model.service;

import java.util.List;

import com.kh.hope.chat.model.vo.Chat;
import com.kh.hope.chat.model.vo.ChatJoin;
import com.kh.hope.chat.model.vo.ChatMessage;

public interface ChatService {

	int insertMessage(ChatMessage chatMessage);

	List<Chat> selectChatRoomList();

	int openChatRomm(Chat c);

	List<ChatMessage> joinChatRoom(ChatJoin join);

	void deleteUserChat(ChatJoin join);

//	void deleteChatRoom(ChatJoin join);
	// 관리자가 삭제해야함.


}
