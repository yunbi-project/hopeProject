package com.kh.hope.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.hope.board.model.service.ReplyService;
import com.kh.hope.board.model.vo.Reply;
import com.kh.hope.board.model.vo.Report;


@RestController
public class ReplyController {

	@Autowired
	private ReplyService service;
	
	/*댓글등록*/
	@PostMapping("/reply/insert")
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
	@GetMapping("/reply/list")
	public ResponseEntity<List<Reply>> replyList(
			@RequestParam("boardNo") int boardNo
			){		
				
		List<Reply> list = service.replyList(boardNo);
	    return ResponseEntity.ok(list);
	}
	@PostMapping("/reply/update")
	public ResponseEntity<String> updateReply(
			@RequestParam("replyNo") int replyNo,
			@RequestParam String replyContent
			){
		int result = service.updateReply(replyNo,replyContent);
		
		if(result>0) {
			return ResponseEntity.ok("success");
		
		}else {
			return ResponseEntity.ok("failed");
		}
		
		
	}
	@PostMapping("/reply/delete")
	public ResponseEntity<String> deleteReply(
			@RequestParam ("replyNo") int replyNo
			){
		int result= service.deleteReply(replyNo);
		
		if(result>0) {
			return ResponseEntity.ok("success");
			
		}else {
			return ResponseEntity.ok("failed");
		}
	}
	@PostMapping("/report/board")
	public Map<String,Object> insertReport(
			@RequestBody Report rp
			) {
		
		int result = service.insertReport(rp);
		Map<String,Object> map = new HashMap();
		
		if(result>0) {
			map.put("msg", "성공");
		}else {
			map.put("msg", "실패");
		}
		System.out.println(rp);
		return map;
		
	}
}
