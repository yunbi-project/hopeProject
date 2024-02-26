package com.kh.hope.board.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.hope.board.model.service.ReplyService;
import com.kh.hope.board.model.vo.Reply;


@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService service;
	
	/*댓글등록*/
	@PostMapping("/insert")
	public Map<String,Object> insertReply(
			@RequestBody Reply r) {
		int result = service.insertReply(r);
		Map<String,Object> map = new HashMap();
		
		if(result>0) {
			map.put("msg", "성공");
		}else {
			map.put("msg", "실패");
		}
		System.out.println(r);
		return map;
	}
	/*댓글리스트*/
//	@GetMapping("/list")
//	public List<Reply> replyList(){
//		
//	}
}
