package com.kh.hope.config;


import org.springframework.context.annotation.Configuration;

import org.springframework.web.socket.config.annotation.EnableWebSocket;


import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

/*import org.springframework.context.annotation.Bean;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;*/

import com.kh.hope.chat.model.websocket.ChatWebsocketHandler;

import lombok.RequiredArgsConstructor;



@Configuration
@EnableWebSocket
@RequiredArgsConstructor
public class WebSocketConfig implements WebSocketConfigurer  {
	
	private final ChatWebsocketHandler chatWebsocket;
	
	// ChatWebsocket 핸들러 등록 및 앤드포인트 설정
    // SockJs 활성화, 핸드셰이크 등록
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(chatWebsocket, "/chat2")		// ChatWebSocket 등록, 앤드포인트는 /chat2
                .addInterceptors(new HttpSessionHandshakeInterceptor()) // HttpSession을 WebSocket 핸드셰이크에 전달
        		.setAllowedOrigins("http://localhost:8005")
                .withSockJS()  ;	// SockJs 활성화 해줘야함.
//                .setClientLibraryUrl("https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js")
              
    }
}