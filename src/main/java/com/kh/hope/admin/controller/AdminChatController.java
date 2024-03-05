package com.kh.hope.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hope.admin.model.service.AdminService;
import com.kh.hope.chat.model.vo.ChatJoin;
import com.kh.hope.chat.model.vo.ChatMessage;
import com.kh.hope.user.model.vo.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes({"loginUser", "chatNo" , "userNo"})
public class AdminChatController {
	
	@Autowired
	private AdminService adminService;
	
	// 채팅방 입장 
			@GetMapping("/chat/{chatNo}") // 내일 학원가서 채팅방 입장부터 하면됨.
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
				
				List<ChatMessage> list = adminService.joinChatRoom(join); 
				
				// 채팅방 참여(insert)후, 해당 채팅방의 채팅메시지 조회(select)
				log.info("채팅내용 {}" , list);
				
				if(list != null) {
					model.addAttribute("list", list);
					model.addAttribute("chatNo", chatNo); // 웹소켓이 활용하기 위해 담아줬다. session으로 이관
					return "chat/chatRoom";
				}else {
					ra.addFlashAttribute("alertMsg" , "채팅방이 존재하지 않습니다.");
					return "redirect:/chat/chatList";
				}
			}	

}
