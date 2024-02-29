package com.kh.hope.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hope.admin.model.service.AdminService;
import com.kh.hope.admin.model.vo.BlackList;
import com.kh.hope.attachment.model.vo.Attachment;
import com.kh.hope.board.model.service.BoardService;
import com.kh.hope.board.model.vo.Board;
import com.kh.hope.chat.model.vo.Chat;
import com.kh.hope.chat.model.vo.ChatJoin;
import com.kh.hope.chat.model.vo.ChatMessage;
import com.kh.hope.common.Template.model.vo.Pagenation;
import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.config.Utils;
import com.kh.hope.user.model.vo.User;

import edu.emory.mathcs.backport.java.util.Arrays;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import java.text.NumberFormat;
import java.util.Locale;

@Slf4j
@Controller
@RequestMapping("/admin")
@SessionAttributes({"loginUser", "chatNo" , "userNo"})
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private BoardService boardService;
	
	
	// 대시보드
	// status y인 값들만 카운트
	@GetMapping("/adminIndex")
	public String index(Model model) {

		// ----- 1. 회원가입 수 리스트  -----
		List<User> totalUsers  = adminService.dashboardUser();
		
		model.addAttribute("totalUsers", totalUsers);
		
		log.info("totalUsers의 정보 {}" , totalUsers);
		
		// ----- 2. 기부금액 합계  -----
		int totalAmount = adminService.dashboardAmount();
		
		// NumberFormat 인스턴스 생성
		NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.getDefault());

		// 쉼표를 추가하여 형식화된 문자열로 변환
		String formattedTotalAmount = numberFormat.format(totalAmount);
		model.addAttribute("totalAmount" , formattedTotalAmount);
		log.info("totalAmount 금액 : {}" , formattedTotalAmount);
		
		
		// ----- 3. 게시글 합계 -----
		int totalBoard = adminService.dashboardTotalBoardCount();
		
		model.addAttribute("totalBoard" , totalBoard);
		log.info("totalBoard 게시글 수 : {} ", totalBoard);
		
		// ----- 4. 채팅방 합계 -----
		int totalChat = adminService.dashboardChatTotalCount();
		
		model.addAttribute("totalChat" , totalChat);
		log.info("totalChat 채팅방 수 : {}" , totalChat);
		
		
		// 기부금액 통계
		
		// 많이 접속한 채팅방명 5개
		return "admin/adminIndex";
	}
	
	@GetMapping("/charts")
	public String charts() {
		return "admin/charts";
	}
	
	@GetMapping("/tables")
	public String tables() {
		return "admin/tables";
	}
	
	/* ============================================== 회원 시작 ==============================================*/
	
	// 회원 리스트 조회
	@GetMapping("/memberList")
	public String memberList(Model model) {
		
		List<User> list = adminService.selectAllUser();
		
		model.addAttribute("list", list);
		
		log.info("list의 정보 {}" , list);
		
		return "admin/memberList";
	}
	

	// 사용자 삭제
	@PostMapping("/deleteUser")
	@ResponseBody
	public String deleteUser(@RequestParam("userNo") int userNo,
						     @RequestParam("reason") String reason) {
		
		int user = adminService.deleteUser(userNo, reason);
		
		log.info("userNo 값 {}" , userNo);
		log.info("comment 정보 {}" , reason);
		if(user > 0) {
			return "success";
		}
		return "error";
	}
	// 회원정보 확인
	@GetMapping("/getUserOne")
	@ResponseBody
	public User getUserOne(@RequestParam("userNo") int userNo,
							Model model
			) {
		System.out.println(userNo);
		User userOne = adminService.getUserOne(userNo);
		log.info("userOne {}" , userOne);
		
		
		return userOne;
	}
	
	// 회원정보 확인 수정
	@PostMapping("/updateUserInfo")
	@ResponseBody
	public String updateUserInfo(User user) {
		
		log.info("update user 정보 {}", user);
		int result = adminService.updateUserInfo(user);

		if(result > 0) {
			return "success";
		}
		return "error";
	}
	
	// 검색기능
	@PostMapping("/searchUserByName")
	@ResponseBody
	public List<User> searchUserByName(@RequestParam("userName") String userName) {
		
		
		List<User> userByName = adminService.searchUserByName(userName); 
		
		log.info("userByName 정보 확인 : {}" ,userByName);
		
		return userByName;
	}	
	// 블랙리스트 조회
	@GetMapping("/blackListView")
	private String blackListView(Model model) {
		
		List<BlackList> list = adminService.blackListView();
		
		model.addAttribute("list" , list);
		
		log.info("list 정보 확인 : {}" , list);
		
		
		return "admin/blackListView";
	}
	// 블랙리스트 정지풀기
	@PostMapping("/releseStop")
	@ResponseBody
	public String releseStop(@RequestParam("userNo") int userNo) {
		
		// User 테이블 정지풀기
		int result = adminService.releseStop(userNo);
		int stop = 0;
		
		if(result > 0) {
			stop = adminService.modifyUserStop(userNo);
		}
		
		if (stop > 0) { 
			return "success";
		}
		
		return "error";
	}
	
	// 블랙리스트 회원번호 검색
	@PostMapping("/searchByUserNo")
	@ResponseBody
	public List<BlackList> searchByUserNo(@RequestParam("userNo") int userNo) {
		
		log.info("userNo 정보확인 : {}" , userNo);
		
		List<BlackList> list = adminService.searchByUserNo(userNo);
		
		log.info("list 정보확인 : {}" , list);

		return list; 
	}
	
	/* ============================================== 회원 끝 ==============================================*/
	
	// 채팅방 조회
	@GetMapping("/chat")
	public String chatList(Model model, Chat c) {
		
		// 채팅방 리스트 조회
		List<Chat> list = adminService.selectChatRoomList();
		model.addAttribute("list" , list);
		log.info("list 정보 확인 {}" , list);
		
		if(list != null) {
			// 채팅방 조인 조회
			List<ChatJoin> join = adminService.selectJoinList();
			model.addAttribute("join" , join);
			log.info("join 정보 확인 {}" , join);
		}
		
		return "admin/chat";
	}
	
	// 채팅방 생성
		@PostMapping("/createChatRoom")
		@ResponseBody
		public String openChatRoom(
				Chat c,
				RedirectAttributes ra,
				@ModelAttribute("loginUser")User loginUser // 세션 스코프 꺼내옴.
				) {
			
			c.setUserNo(loginUser.getUserNo());
			log.info("chat 인설트정보 {}", c);
			
			 try {
			        int chatNo = adminService.openChatRoom(c); // 채팅방 생성 및 생성된 채팅방 내부로 이동.

			        if (chatNo > 0) {
			            return "success";
			        }
			    } catch (Exception e) {
			        log.error("채팅방 생성 중 오류 발생: {}", e.getMessage());
			    }
			    return "error";
			}
		
	
		
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
		
		// 채팅방 삭제
		@GetMapping("chat/{chatNo}/deleteChatRoom")
		@ResponseBody
		public String deleteChatRoom(
				@ModelAttribute("loginUser") User loginUser,
				@PathVariable("chatNo") int chatNo,
				ChatJoin join,
				RedirectAttributes ra
				) {
		
			join.setChatNo(chatNo);
			join.setUserNo(loginUser.getUserNo());
			
			log.info("join 삭제 정보확인  {} ", join );
			
			// chat, chatJoin 삭제
			int result = adminService.deleteChatRoom(join);
			
			if(result > 0) {
				return "success";
			}
			
			return "error";
		}
		
		// 채팅방 제목 검색
		@PostMapping("/chat/searchChatRoomByName")
		@ResponseBody
		public List<Chat> chatByName(
					Chat c
				) {
			log.info("chat 제목 검색 확인 {} "  , c);
			
			List<Chat> list = adminService.chatByName(c);
			
			return list;
		}
		
		
	/* ============================================== 게시판 시작 끝 ==============================================*/
		
		@GetMapping("/boardManagement")
		public String boardManagement() {
			return "admin/boardManagement";
		}
		@GetMapping("/Q")
		public String faqManagement(Model m) {
			List<Board> list = boardService.faqList();
			m.addAttribute("list", list);
			
			return "admin/FAQManagement";
		}
		@GetMapping("/faqList1")
		public String faqList1(Model m) {
			List<Board> list = boardService.faqList1();
			m.addAttribute("list", list);
			return "admin/FAQManagement";
		}

		@GetMapping("/faqList2")
		public String faqList2(Model m) {
			List<Board> list = boardService.faqList2();
			m.addAttribute("list", list);
			return "admin/FAQManagement";
		}

		@GetMapping("/faqList3")
		public String faqList3(Model m) {
			List<Board> list = boardService.faqList3();
			m.addAttribute("list", list);
			return "admin/FAQManagement";
		}
		
		//공지사항 리스트
		@GetMapping("/N")	
		public String noticeManagement(Model m, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
				@RequestParam Map<String, Object> map) {
			int listCount = boardService.selectListCount(map);
			int pageLimit = 10;
			int boardLimit = 14;

			PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

			List<Board> list = boardService.noticeList(pi, map);
			m.addAttribute("list", list);
			m.addAttribute("pi", pi);
			m.addAttribute("param", map);
			return "admin/noticeManagement";
			
		}
		//공지상세
		@GetMapping("/detail/N/{bno}")
		public String selectBoard(@PathVariable("bno") int boardNo, Model m, HttpServletRequest req,
				HttpServletResponse res, HttpSession session) {
			
			Board b = boardService.selectBoard(boardNo);

			if (b != null) {
				List<Attachment> imgList = boardService.selectImgList(boardNo);
				m.addAttribute("imgList", imgList);

				int userNo = 0;
				User loginUser = (User) session.getAttribute("loginUser");
				if (loginUser != null) {
					userNo = loginUser.getUserNo();
				}

				if (b.getUserNo() != userNo) {
					Cookie cookie = null;
					Cookie[] cArr = req.getCookies();
					if (cArr != null && cArr.length > 0) {
						for (Cookie c : cArr) {
							if ("readBoardNo".equals(c.getName())) {
								cookie = c;
								break;
							}
						}
					}
					int result = 0;
					if (cookie == null) {
						cookie = new Cookie("readBoardNo", boardNo + "");
						result = boardService.increaseCount(boardNo);

					} else {
						String[] arr = cookie.getValue().split("/");
						List<String> list = Arrays.asList(arr);
						if (list.indexOf(boardNo + "") == -1) {
							result = boardService.increaseCount(boardNo);
							cookie.setValue(cookie.getValue() + "/" + boardNo);
						}
					}
					if (result > 0) {
						b.setCount(b.getCount() + 1);
						cookie.setPath(req.getContextPath());
						cookie.setMaxAge(1 * 60 * 60);
						res.addCookie(cookie);
					}
				}
			} else {
				m.addAttribute("errorMsg", "조회실패");
				return "common/errorPage";
			}
			m.addAttribute("b", b);

			return "admin/adminNoticeDetail";
		}
		//공지,faq 삭제
		@GetMapping("/delete/{boardNo}")
		public String deleteBoard(
				 @PathVariable ("boardNo") int boardNo,
				 @RequestParam("boardTypeNo") String boardTypeNo, // 추가된 부분
				 Model m,
				 RedirectAttributes ra
				 ) {
			 int result = boardService.deleteNotice(boardNo);
			 
			 if(result>0) {
				 ra.addFlashAttribute("alertMsg","게시글 삭제에 성공하였습니다.");
				 
			 }else {
				 ra.addFlashAttribute("alertMsg", "삭제에 실패하였습니다.");
			 }
			
			 return "redirect:/admin/" + boardTypeNo;
			 
			 
		 }
		@PostMapping("/insert/Q")
		public String insertFaq(Board b, @ModelAttribute("loginUser") User loginUser, Model m,
				
				RedirectAttributes ra) {
			
			b.setUserNo(loginUser.getUserNo());
			int result = 0;
			try {
				result = boardService.insertFaq(b);
			} catch (Exception e) {
				e.printStackTrace();
			}
			String url = "";
			if (result > 0) {
				ra.addFlashAttribute("alertMsg", "작성에 성공하였습니다.");
				url = "redirect:/admin/Q";
			} else {
				m.addAttribute("errorMsg", "다시 작성해주세요");
				url = "common/errorPage";
			}
			return url;
			
		}
		
		@GetMapping("/update/{boardTypeNo}/{boardNo}")
		public String updateBoard(@PathVariable("boardNo") int boardNo, 
				@PathVariable ("boardTypeNo") String boardTypeNo,
				Model m) {
			Board b = boardService.selectUpdateBoard(boardNo);
			
			if (b != null) {
				String boardContent = b.getBoardContent();
				if (boardContent != null) {
					b.setBoardContent(Utils.newLineClear(boardContent));
				}
				m.addAttribute("b", b);
				System.out.println(b);			 
				
				    
				 return "admin/adminNoticeModify"; // 공지사항
				   
			} else {
				m.addAttribute("errorMsg", "게시물을 찾을 수 없습니다.");
				return "common/errorPage";
			}
		}

		@PostMapping("/update/{boardTypeNo}/{boardNo}")
		public String updateBoardInsert(@PathVariable("boardNo") int boardNo,
				@PathVariable ("boardTypeNo") String boardTypeNo,
				Model m, Board b, RedirectAttributes ra,
				@RequestParam(value = "upfiles", required = false) List<MultipartFile> upfiles, String deleteList) {
			b.setBoardNo(boardNo);

			int result = boardService.updateBoardInsert(b,boardTypeNo, deleteList, upfiles);

			if (result > 0) {
				ra.addFlashAttribute("alertMsg", "게시글 수정 성공");
				return "redirect:/admin/detail/"+boardTypeNo+"/" + boardNo;

			} else {
				ra.addFlashAttribute("alertMsg", "게시글 수정 실패");
				return "redirect:/admin/detail/"+boardTypeNo+"/" + boardNo;
			}

		}
		
		
	/* ============================================== 게시판 끝 ==============================================*/
		
}
