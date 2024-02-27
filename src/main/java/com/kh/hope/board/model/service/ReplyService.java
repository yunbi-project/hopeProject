package com.kh.hope.board.model.service;

import java.util.List;

import com.kh.hope.board.model.vo.Reply;
import com.kh.hope.board.model.vo.Report;

public interface ReplyService {

	int insertReply(Reply r);

	List<Reply> replyList(int boardNo);

	int updateReply(int replyNo, String replyContent);

	int deleteReply(int replyNo);

	int insertReport(Report rp);

	


}
