package com.kh.hope.chat.model.websocket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import com.kh.hope.chat.model.service.ChatService;
import com.kh.hope.chat.model.vo.ChatMessage;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatWebsocket extends TextWebSocketHandler{
	
	// TextWebSocketHandler : 웹소켓을 위한 메소드를 지원하는 인터페이스이고 , 
	// 웹소켓 핸들러 인터페이스를 구현한 클래스이며 문자열을 다룰대 사용한다.

	@Autowired
	private ChatService chatService;
	/**
	 <웹소켓 보관>
	 채팅은 멀티스레드 환경이다. => 동기화처리 신경써야한다.
	 HashSet은 동기화 처리가 구현이 안되어있다.
	 그래서 동기화 처리 해주는 메소드를 불러온다. synchronizedSet
	 synchronizedSet : 동기화된 set를 반환해주는 메소드. 멀티스레드환경에서 하나의 컬렉션요소에 여러 스레드가 동시에 접근하게 되면 충돌이
	 살생할 수 있으므로 동기화 처리를 진행함.
	 * 
	 * */
	
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	
	// 클라이언트와 웹소켓 연결이 완료된 이후, 통신할 준비가 되면 실행하는 함수
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 매개변수로 전달받은 WebSocketSession : 웹소켓에 접속요청을 한 "클라이언트의" 세션
		log.info("session ?? {}" + session.getId()); // 세션 Id 보관
		
		sessions.add(session);
	}
	
	// 클라이언트로부터 메시지가 도착햇을시 실행되는 함수
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TextMessage : 웹소켓을 이용해 전달된 데이터(텍스트)가 담겨있는 객체.
		
		// payload : 전송되는 데이터 담겨있는 필드(JSON 객체로 전달받음)
		log.info("전달된 메세지는 뭐냐?{}" , message.getPayload());
		System.out.println(message.getPayload());
		
		// JackSon 라이브러리 : Java에서 json 다루기 위한 라이브러리
		// JackSon-databind : objectMapper를 이용해서 JSON 형태로 넘어온 데이터를
		// 특정 VO 필드에 맞게 자동으로 매핑시켜줌.
		ObjectMapper objectMapper = new ObjectMapper();
		ChatMessage chatMessage = objectMapper.readValue(message.getPayload(), ChatMessage.class);
		
		// 전달받은 메세지를 db에 CHAT_MESSAGE테이블에 추가
		int result = chatService.insertMessage(chatMessage);
		
		
		// 메시지를 db에 성공적으로 저장했다면, 전달받은 메세지를 같은방에 접속중인 클라이언트에게 전달.
		if(result > 0) {
			
			for( WebSocketSession s : sessions) {
				// 반복을 진행중인 WebSocketSession에 담겨있는 "방번호" 빼오기.
				int chatNo = (int)s.getAttributes().get("chatNo");
				
				log.info("접속중인 사용자의 채팅방번호 : {}" , chatNo);
				
				// 메시지에 담겨있는 채팅방 번호와, 현재 웹소켓세션에 저장된 채팅방번호를 비교하여 동일한 경우 해당 웹소켓세션에 메세지 전달.
				// 실시간으로 화면에 띄어주기 위함.
				if(chatMessage.getChatNo() == chatNo) {
					s.sendMessage( new TextMessage( new Gson().toJson(chatMessage)) );
				}
			}
		}
	}
	
	/**
	 * 클라이언트와 웹소켓 연결이 종료되면 실행되는 함수
	 * */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session); // 웹소켓 연결이 종료되는 경우 session 내부에 있는 클라이언트의 session정보를 삭제할 예정
	} // 채팅 요청사항을 다루는데 특화된 클래스

	
}

