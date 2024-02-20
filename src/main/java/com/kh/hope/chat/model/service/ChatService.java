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


}
