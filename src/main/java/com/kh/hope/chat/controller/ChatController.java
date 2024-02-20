package com.kh.hope.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hope.chat.model.service.ChatService;
import com.kh.hope.chat.model.vo.Chat;
import com.kh.hope.chat.model.vo.ChatJoin;
import com.kh.hope.chat.model.vo.ChatMessage;
import com.kh.hope.user.model.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/chat")
@SessionAttributes({"loginUser", "chatNo"})
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	
	// header에서 chat/chatRoomList
	@GetMapping("/chatList") // 채팅방 목록 조회 
	public String selectChatRoomList(Model model) {
		
	
	// 1. db에서 채팅방 목록데이터 조회.
	List<Chat> list = chatService.selectChatRoomList();
	
	
	System.out.println(list);
	// 2. 조회된 데이터를 model안에 추가
	model.addAttribute("list",list);
	
	
	// 3. view 페이지 포워딩
	
	return "chat/chatList";

	}
	
	// 채팅방 만들기
	@PostMapping("/openChatRoom")
	public String openChatRoom(
			Chat c,
			RedirectAttributes ra,
			@ModelAttribute("loginUser")User loginUser // 세션 스코프 꺼내옴.
			) {
		
		c.setUserNo(loginUser.getUserNo());
		
		int chatNo = chatService.openChatRomm(c); // 채팅방 생성 및 생성된 채팅방 내부로 이동.
		
		String path = "redirect:/chat/";
		
		if(chatNo > 0) {
			ra.addAttribute("alertMsg" , "채팅방생성 성공");
			path += "chatList";	// 성공
		}else {
			ra.addFlashAttribute("alertMsg", "채팅방생성 실패");
			path += "chatList";	// 실패
		}
		
		return path;
	}
	
	// 채팅방 입장 -> 게시글 상세보기
	@GetMapping("/room/{chatNo}")
	public String joinChatRoom(
			@PathVariable("chatNo") int chatNo, // url chatno
			Model model,
			RedirectAttributes ra,
			ChatJoin join,
			@ModelAttribute("loginUser") User loginUser
			) {
		
		// chatJoin 안에 참여한 채팅방번호(chatNo)와 참여한 회원번호(userNo)를 담아서 INSERT(참여인원수 증가) 
		join.setChatNo(chatNo);
		join.setUserNo(loginUser.getUserNo());
		
		System.out.println(join.getChatNo() );
		System.out.println(join.getUserNo() );
		
		// 채팅내용 조회 후 model에 담아줄 예정
		List<ChatMessage> list = chatService.joinChatRoom(join); 
		// 채팅방 참여(insert)후, 해당 채팅방의 채팅메시지 조회(select)
		log.info("채팅내용 {}" , list);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("chatNo", chatNo); // 웹소켓이 활용하기 위해 담아줬다. session으로 이관
			System.out.println("list" + list);
			return "chat/chatRoom";
		}else {
			ra.addFlashAttribute("alertMsg" , "채팅방이 존재하지 않습니다.");
			return "redirect:/chat/chatList";
		}
	}	
	

	
}
