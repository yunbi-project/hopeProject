package com.kh.hope.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.activityreport.model.vo.ActivityReport;
import com.kh.hope.admin.model.vo.BlackList;
import com.kh.hope.attachment.model.vo.Attachment;
import com.kh.hope.board.model.vo.Board;
import com.kh.hope.board.model.vo.Reply;
import com.kh.hope.board.model.vo.Report;
import com.kh.hope.chat.model.vo.Chat;
import com.kh.hope.chat.model.vo.ChatJoin;
import com.kh.hope.chat.model.vo.ChatMessage;
import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.payment.model.vo.PaymentInfo;
import com.kh.hope.product.model.vo.Product;
import com.kh.hope.program.model.vo.Program;
import com.kh.hope.user.model.vo.User;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSession session;

	public List<User> selectAllUser() {
		return session.selectList("adminMapper.selectAllUser");
	}
	
	public int deleteUser(int userNo) {
		return session.update("adminMapper.deleteUser", userNo);
	}
	public int blackListInsert(BlackList blackList) {
		return session.insert("adminMapper.blackListInsert", blackList);
	}
	public User getUserOne(int userNo) {
		return session.selectOne("adminMapper.getUserOne", userNo);
	}
	public int updateUserInfo(User user) {
		return session.update("adminMapper.updateUserInfo" , user);
	}
	public List<User> searchUserByName(String userName) {
		return session.selectList("adminMapper.searchUserByName" , userName);
	}
	public List<BlackList> blackListView() {
		return session.selectList("adminMapper.blackListView");
	}
	public int releseStop(int userNo) {
		return session.update("adminMapper.releseStop" , userNo);
	}
	public int modifyUserStop(int userNo) {
		return session.update("adminMapper.modifyUserStop", userNo);
	}
	public List<BlackList> searchByUserNo(int userNo) {
		return session.selectList("adminMapper.searchByUserNo" , userNo);
	}
	
	
	public List<Chat> selectChatRoomList() {
		return session.selectList("adminMapper.selectChatRoomList");
	}
	
	public List<ChatJoin> selectJoinList() {
		return session.selectList("adminMapper.selectJoinList");
	}
	
	public int openChatRoom(Chat c) {
		int result = session.insert("adminMapper.openChatRoom", c);
		return result;
	}
	
	public int joinChatRoom(ChatJoin join) {
		return session.insert("adminMapper.joinChatRoom", join);
	}
	
	public List<ChatMessage> selectChatMessage(int chatNo) {
		return session.selectList("adminMapper.selectChatMessage", chatNo);
	}
	
	public int joinCheck(ChatJoin join) {
		return session.selectOne("adminMapper.joinCheck", join);
	}
	
	public int deleteChatRoom(ChatJoin join) {
		return session.update("adminMapper.deleteUserChat", join);
	}
	
	public int deleteChat(ChatJoin join) {
		return session.update("adminMapper.deleteChat", join);
		
	}
	
	public List<Chat> chatByName(Chat c) {
		return session.selectList("adminMapper.chatByName", c);
	}

	public List<User> dashboardUser() {
		return session.selectList("adminMapper.dashboardUser");
	}
	public int dashboardAmount() {
		return session.selectOne("adminMapper.dashboardAmount");
	}

	public int dashboardTotalBoardCount() {
		return session.selectOne("adminMapper.dashboardTotalBoardCount");
	}
	public int dashboardChatTotalCount() {
		return session.selectOne("adminMapper.dashboardChatTotalCount");
	}

	public List<PaymentInfo> getDailyIncome() {
		return session.selectList("adminMapper.getDailyIncome");
	}
	public List<PaymentInfo> selectDonate() {
		return session.selectList("adminMapper.selectDonate");
	}
	public List<User> dashboarduserList() {
		return session.selectList("adminMapper.dashboarduserList");
	}


	
	public List<Report> reportBoardList() {
		
		return session.selectList("adminMapper.reportBoardList");
	}
	public List<Report> reportReplyList() {
		return session.selectList("adminMapper.reportReplyList");
	}
	public int deleteReport(int reportNo) {
		return session.update("adminMapper.deleteReport",reportNo);
	}
	public Board selectReportBoard(int reportNo) {
		return session.selectOne("adminMapper.selectReportBoard",reportNo);
	}
	public List<Attachment> selectReportImgList(int reportNo) {
		return session.selectList("adminMapper.selectReportImgList",reportNo);
	}
	public int deleteBoardReport(int boardNo) {
		return session.update("adminMapper.deleteBoardReport",boardNo);
	}
	public int deleteReportList(int boardNo) {
		return session.update("adminMapper.deleteReportList",boardNo);
	}
	public Reply selectReply(int replyNo) {
		return session.selectOne("adminMapper.selectReply",replyNo);
	}
	public int deleteReplyDatailReport(int replyNo) {
		return session.update("adminMapper.deleteReplyDatailReport",replyNo);
	}
	public int deleteReportReplyList(int replyNo) {
		return session.update("adminMapper.deleteReportReplyList",replyNo);
	}
	
	public List<Reply> ReplyList() {
		return session.selectList("adminMapper.ReplyList");
	}

	public List<Reply> ReplyTodayList() {
		return session.selectList("adminMapper.ReplyTodayList");
	}
	
	public List<Product> productList() {
		return session.selectList("adminMapper.productList");
				}
		public int selectProgramCount(Map<String, Object> map) {
			return session.selectOne("adminMapper.selectProgramCount",map);
		}

		public List<Program> programList(PageInfo pi, Map<String, Object> map) {
			int limit = pi.getBoardLimit();
			int offset=(pi.getCurrentPage()-1)*limit;
			
			RowBounds rowBounds = new RowBounds(offset,limit);
			
			return session.selectList("adminMapper.programList",map,rowBounds);
		}
		public int selectDonateCount(Map<String, Object> map) {
			return session.selectOne("adminMapper.selectDonateCount",map);
		}

		public List<Donate> donateList(PageInfo pi, Map<String, Object> map) {
			int limit = pi.getBoardLimit();
			int offset=(pi.getCurrentPage()-1)*limit;
			
			RowBounds rowBounds = new RowBounds(offset,limit);
			
			return session.selectList("adminMapper.donateList",map,rowBounds);
		}

		public int deleteReply(int replyNo) {
			return session.update("adminMapper.deleteReply",replyNo);
		}

		public int confirmProduct(int productNo) {
			return session.update("adminMapper.confirmProduct",productNo);
		}

		public int deleteProduct(int productNo) {
			return session.delete("adminMapper.deleteProduct",productNo);
		}
		public List<Product> productConfirmList() {
			return session.selectList("adminMapper.productConfirmList");
		}
		public List<Program> programPeople(int programNo) {
			return session.selectList("adminMapper.programPeople",programNo);
		}

		public Program programPeopleCount(int programNo) {
			return session.selectOne("adminMapper.programPeopleCount",programNo);
		}
		public int deleteProgram(int programNo) {
			return session.update("adminMapper.deleteProgram",programNo);
		}

		public int deleteDonate(int donateNo) {
			return session.update("adminMapper.deleteDonate",donateNo);
		}
		public List<Program> selectProgramEndList() {
			return session.selectList("adminMapper.selectProgramEndList");
		}
		
		public List<Donate> selectDonateEndList() {
			return session.selectList("adminMapper.selectDonateEndList");
		}
		
		public List<ActivityReport> selectReportList(Map<String, Object> map) {
			return session.selectList("adminMapper.selectReportList", map);
		}

		public List<ActivityReport> selectDonateReportList(Map<String, Object> map) {
			return session.selectList("adminMapper.selectDonateReportList");
		}
		
	
	}
	


