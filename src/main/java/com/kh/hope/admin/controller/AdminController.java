package com.kh.hope.admin.controller;

import java.io.File;
import java.sql.Date;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
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

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kh.hope.activityreport.model.vo.ActivityReport;
import com.kh.hope.admin.model.service.AdminService;
import com.kh.hope.admin.model.vo.BlackList;
import com.kh.hope.attachment.model.vo.Attachment;
import com.kh.hope.board.model.service.BoardService;
import com.kh.hope.board.model.vo.Board;
import com.kh.hope.board.model.vo.Reply;
import com.kh.hope.board.model.vo.Report;
import com.kh.hope.chat.model.vo.Chat;
import com.kh.hope.chat.model.vo.ChatJoin;
import com.kh.hope.common.Template.model.vo.Pagenation;
import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.config.Utils;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.payment.model.vo.PaymentInfo;
import com.kh.hope.product.model.vo.Product;
import com.kh.hope.program.model.vo.Program;
import com.kh.hope.user.model.vo.User;

import edu.emory.mathcs.backport.java.util.Arrays;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
@SessionAttributes({"loginUser", "chatNo" , "userNo"})
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ServletContext application;
	

	@GetMapping("/adminIndex")
	public String index(Model model, HttpSession session, HttpServletRequest request) {
	    try {
	        User loginUser = (User) session.getAttribute("loginUser");
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }

	        List<User> totalUsers = adminService.dashboardUser();

	        model.addAttribute("totalUsers", totalUsers);


	        List<User> userList = adminService.dashboarduserList();

	        model.addAttribute("userList", userList);


	        int totalAmount = adminService.dashboardAmount();
	        
        	NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.getDefault());
	        String formattedTotalAmount = numberFormat.format(totalAmount);
	    
	        model.addAttribute("totalAmount", formattedTotalAmount);


	        int totalBoard = adminService.dashboardTotalBoardCount();

	        model.addAttribute("totalBoard", totalBoard);

	        int totalChat = adminService.dashboardChatTotalCount();

	        model.addAttribute("totalChat", totalChat);

	        List<PaymentInfo> list = adminService.getDailyIncome();

	        Gson gson = new Gson();
	        JsonArray jArray = new JsonArray();

	        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

	        Iterator<PaymentInfo> it = list.iterator();
	        while (it.hasNext()) {
	            PaymentInfo paymentInfo = it.next();
	            JsonObject object = new JsonObject();
	            int sale = paymentInfo.getDonateAmount();

	            Date dt = paymentInfo.getCreateDate();
	            String date = df.format(dt);

	            object.addProperty("sale", sale);
	            object.addProperty("date", date);
	            jArray.add(object);
	        }

	        String json = gson.toJson(jArray);
	        model.addAttribute("json", json);


	        List<PaymentInfo> selectDonate = adminService.selectDonate();

	        model.addAttribute("selectDonate", selectDonate);


	        return "admin/adminIndex";
	    } catch (Exception e) {
	        log.error("Error occurred while processing adminIndex request: {}", e.getMessage());
	        return "redirect:/admin/memberList"; 
	    }
	}
	
	
	
	@GetMapping("/memberList")
	public String memberList(Model model, HttpSession session, HttpServletRequest request) {
		
		User loginUser = (User) session.getAttribute("loginUser");
        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
                return "redirect:/";
            }
        }
		
		List<User> list = adminService.selectAllUser();
		
		model.addAttribute("list", list);
		
		
		return "admin/memberList";
	}
	

	@PostMapping("/deleteUser")
	@ResponseBody
	public String deleteUser(@RequestParam("userNo") int userNo,
						     @RequestParam("reason") String reason, HttpSession session, HttpServletRequest request) {
		
		User loginUser = (User) session.getAttribute("loginUser");
     
        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
                return "redirect:/";
            }
        }
		int user = adminService.deleteUser(userNo, reason);
		

		if(user > 0) {
			return "success";
		}
		return "error";
	}
	
	@GetMapping("/getUserOne")
	@ResponseBody
	public User getUserOne(@RequestParam("userNo") int userNo,
							Model model
			) {
		User userOne = adminService.getUserOne(userNo);
		
		
		return userOne;
	}
	
	@PostMapping("/updateUserInfo")
	@ResponseBody
	public String updateUserInfo(User user, HttpSession session, HttpServletRequest request) {
		
		User loginUser = (User) session.getAttribute("loginUser");
     
        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
                return "redirect:/";
            }
        }
		
		int result = adminService.updateUserInfo(user);

		if(result > 0) {
			return "success";
		}
		return "error";
	}
	
	@PostMapping("/searchUserByName")
	@ResponseBody
	public List<User> searchUserByName(@RequestParam("userName") String userName) {
		
		
		List<User> userByName = adminService.searchUserByName(userName); 
		
		
		return userByName;
	}	
	@GetMapping("/blackListView")
	private String blackListView(Model model, HttpSession session, HttpServletRequest request) {
		
		User loginUser = (User) session.getAttribute("loginUser");
     
        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
                return "redirect:/";
            }
        }
		
		List<BlackList> list = adminService.blackListView();
		
		model.addAttribute("list" , list);
		
		
		
		return "admin/blackListView";
	}
	@PostMapping("/releseStop")
	@ResponseBody
	public String releseStop(@RequestParam("userNo") int userNo, HttpSession session, HttpServletRequest request) {
		
		User loginUser = (User) session.getAttribute("loginUser");
     
        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
                return "redirect:/";
            }
        }
        
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
	
	@PostMapping("/searchByUserNo")
	@ResponseBody
	public List<BlackList> searchByUserNo(@RequestParam("userNo") int userNo) {
		
		
		List<BlackList> list = adminService.searchByUserNo(userNo);
		

		return list; 
	}
	
	@GetMapping("/tables")
	private String activityList(Model model, @RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request) {
		
		User loginUser = (User) session.getAttribute("loginUser");
     
        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
                return "redirect:/";
            }
        }
		
		List<Program> proList = adminService.selectProgramEndList();
		
		model.addAttribute("proList", proList);
		
		List<Donate> donateList = adminService.selectDonateEndList();
		
		model.addAttribute("donateList", donateList);
		
		List<ActivityReport> reportPro =  adminService.selectReportList(map);
		
		model.addAttribute("reportPro", reportPro);
		
		List<ActivityReport> reportDon =  adminService.selectDonateReportList(map);
		
		model.addAttribute("reportDon", reportDon);
		
		
		return "admin/tables";
	}
	
	
	
	@GetMapping("/chat")
	public String chatList(Model model, Chat c, HttpSession session, HttpServletRequest request) {
		
		User loginUser = (User) session.getAttribute("loginUser");
        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
                return "redirect:/";
            }
        }
		
		List<Chat> list = adminService.selectChatRoomList();
		model.addAttribute("list" , list);
		
		if(list != null) {
			List<ChatJoin> join = adminService.selectJoinList();
			model.addAttribute("join" , join);
		}
		
		return "admin/chat";
	}
	
		@PostMapping("/createChatRoom")
		@ResponseBody
		public String openChatRoom(
				Chat c,
				RedirectAttributes ra,
				@ModelAttribute("loginUser")User loginUser , HttpSession session, HttpServletRequest request) {
	     
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }
			
			c.setUserNo(loginUser.getUserNo());
			
			 try {
			        int chatNo = adminService.openChatRoom(c); 

			        if (chatNo > 0) {
			            return "success";
			        }
			    } catch (Exception e) {
			        log.error("채팅방 생성 중 오류 발생: {}", e.getMessage());
			    }
			    return "error";
			}
	
		@GetMapping("chat/{chatNo}/deleteChatRoom")
		@ResponseBody
		public String deleteChatRoom(
				@ModelAttribute("loginUser") User loginUser,
				@PathVariable("chatNo") int chatNo,
				ChatJoin join,
				RedirectAttributes ra, HttpSession session, HttpServletRequest request) {
			
	     
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }
		
			join.setChatNo(chatNo);
			join.setUserNo(loginUser.getUserNo());
			
			
			int result = adminService.deleteChatRoom(join);
			
			if(result > 0) {
				return "success";
			}
			
			return "error";
		}
		
		@PostMapping("/chat/searchChatRoomByName")
		@ResponseBody
		public List<Chat> chatByName(
					Chat c
				) {
			
			List<Chat> list = adminService.chatByName(c);
			
			return list;
		}
		
				
		
		@GetMapping("/Q")
		public String faqManagement(Model m, HttpSession session, HttpServletRequest request) {
			
			User loginUser = (User) session.getAttribute("loginUser");
	     
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }
			List<Board> list = boardService.faqList();
			m.addAttribute("list", list);
			
			return "admin/FAQManagement";
		}
		@GetMapping("/faqList1")
		public String faqList1(Model m, HttpSession session, HttpServletRequest request) {
			
			User loginUser = (User) session.getAttribute("loginUser");
	     
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }
	        
			List<Board> list = boardService.faqList1();
			m.addAttribute("list", list);
			return "admin/FAQManagement";
		}

		@GetMapping("/faqList2")
		public String faqList2(Model m, HttpSession session, HttpServletRequest request) {
			
			User loginUser = (User) session.getAttribute("loginUser");
	     
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }
	        
			List<Board> list = boardService.faqList2();
			m.addAttribute("list", list);
			return "admin/FAQManagement";
		}

		@GetMapping("/faqList3")
		public String faqList3(Model m, HttpSession session, HttpServletRequest request) {
			
			User loginUser = (User) session.getAttribute("loginUser");
	     
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }
	        
			List<Board> list = boardService.faqList3();
			m.addAttribute("list", list);
			return "admin/FAQManagement";
		}
		
		@GetMapping("/N")	
		public String noticeManagement(Model m, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
				@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request) {
			
			User loginUser = (User) session.getAttribute("loginUser");
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }
			
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
		
		@GetMapping("/delete/{boardNo}")
		public String deleteBoard(
				 @PathVariable ("boardNo") int boardNo,
				 @RequestParam("boardTypeNo") String boardTypeNo, 
				 Model m,
				 RedirectAttributes ra, HttpSession session, HttpServletRequest request) {
			
			User loginUser = (User) session.getAttribute("loginUser");
	     
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }
	        
			 int result = boardService.deleteNotice(boardNo);
			 
			 if(result>0) {
				 ra.addFlashAttribute("alertMsg","게시글 삭제에 성공하였습니다.");
				 
			 }else {
				 ra.addFlashAttribute("alertMsg", "삭제에 실패하였습니다.");
			 }
			
			 return "redirect:/admin/" + boardTypeNo;
			 
			 
		 }
		@GetMapping("/insert/Q")
		public String FaqInsert( HttpSession session, HttpServletRequest request) {
			
			User loginUser = (User) session.getAttribute("loginUser");
	     
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }
			
			return "admin/adminFAQInsert";
		}
		@PostMapping("/insert/Q")
		public String insertFaq(Board b, @ModelAttribute("loginUser") User loginUser, Model m,
				HttpServletRequest request,
				RedirectAttributes ra) {
			
			if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }
			
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
				Model m, HttpSession session, HttpServletRequest request) {
			
			User loginUser = (User) session.getAttribute("loginUser");
	     
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }
			
			Board b = boardService.selectUpdateBoard(boardNo);
			
			if (b != null) {
				String boardContent = b.getBoardContent();
				if (boardContent != null) {
					b.setBoardContent(Utils.newLineClear(boardContent));
				}
				m.addAttribute("b", b);
				System.out.println(b);			 
				
				    
				 return "admin/adminNoticeModify"; 
				   
			} else {
				m.addAttribute("errorMsg", "게시물을 찾을 수 없습니다.");
				return "common/errorPage";
			}
		}

		@PostMapping("/update/{boardTypeNo}/{boardNo}")
		public String updateBoardInsert(@PathVariable("boardNo") int boardNo,
				@PathVariable ("boardTypeNo") String boardTypeNo,
				Model m, Board b, RedirectAttributes ra,
				@RequestParam(value = "upfiles", required = false) List<MultipartFile> upfiles, 
				String deleteList, HttpSession session, HttpServletRequest request) {
			
			User loginUser = (User) session.getAttribute("loginUser");
	     
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }
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
		
		@GetMapping("/insert/{boardTypeNo}")
		public String noticeInsert(
				Model m,
				RedirectAttributes ra,
				@PathVariable("boardTypeNo") String boardTypeNo, HttpSession session, HttpServletRequest request) {
			
			User loginUser = (User) session.getAttribute("loginUser");
	     
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }
			
		    String url;
		    if (boardTypeNo.equals("N")) {
		        url = "admin/adminNoticeInsert"; 
		    } else if (boardTypeNo.equals("C")) {
		        url = "admin/adminStoryInsert"; 
		    } else {
		        url = "admin/adminReviewInsert"; 
		    }
		    
		    return url;
		
		}

		@PostMapping("/insert/{boardTypeNo}")
		public String insertNotice(
				Board b, 
				@ModelAttribute("loginUser") User loginUser, 
				Model m, 
				RedirectAttributes ra,
				@RequestParam(value = "upfiles", required = false) List<MultipartFile> upfiles,
				@PathVariable("boardTypeNo") String boardTypeNo,HttpServletRequest request
				
		) {
			  if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
		            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
		                return "redirect:/";
		            }
		        }
			
			String webPath = "/resources/images/board/"+boardTypeNo+"/";
			String serverFolderPath = application.getRealPath(webPath);
			File dir = new File(serverFolderPath);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			b.setUserNo(loginUser.getUserNo());

			List<Attachment> imgList = new ArrayList();

			if (upfiles != null) {
				for (int i = 0; i < upfiles.size(); i++) {
					if (upfiles.get(i).getOriginalFilename().equals("")) {
						continue;
					}
					String changeName = Utils.saveFile(upfiles.get(i), serverFolderPath);
					Attachment at = new Attachment();
					at.setChangeName(changeName);
					at.setOriginName(upfiles.get(i).getOriginalFilename());
					at.setImgLevel(i);
					imgList.add(at);
				}
			}

			int result = 0;
			try {
				result = boardService.insertNotice(b, imgList);
			} catch (Exception e) {
				e.printStackTrace();
			}
			String url = "";
			if (result > 0) {
				ra.addFlashAttribute("alertMsg", "작성에 성공하였습니다.");
				url = "redirect:/admin/"+boardTypeNo;
			} else {
				m.addAttribute("errorMsg", "다시 작성해주세요");
				url = "common/errorPage";
			}
			return url;

		}
		
	
		@GetMapping("/report/Board")
		public String reportBoardList(Model m, HttpSession session, HttpServletRequest request) {
			
			User loginUser = (User) session.getAttribute("loginUser");
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }
			
			  List<Report> list = adminService.reportBoardList();
			  
			  m.addAttribute("list", list);
			 
			
			return "admin/ReportBoard";
			
		}
		
		@GetMapping("/report/Reply")
		public String reportReplyList(Model m, HttpSession session, HttpServletRequest request) {
			
			
			User loginUser = (User) session.getAttribute("loginUser");
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }
			
			
			  List<Report> list = adminService.reportReplyList();
			  
			  m.addAttribute("list", list);
			 
			
			return "admin/ReportReply";
			
		}

		@GetMapping("/delete/report/Board/{reportNo}")
		public String deleteReport(
				@PathVariable ("reportNo") int reportNo,
				 Model m,
				 RedirectAttributes ra, HttpSession session, HttpServletRequest request) {
			
			User loginUser = (User) session.getAttribute("loginUser");
	     
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }
			int result = adminService.deleteReport(reportNo);
			 
			 if(result>0) {
				 ra.addFlashAttribute("alertMsg","확인하였습니다.");
				 
			 }else {
				 ra.addFlashAttribute("alertMsg", "삭제에 실패하였습니다.");
			 }
			
			 return "redirect:/admin/report/Board";
			 
			 
		}
		@GetMapping("/delete/report/Reply/{reportNo}")
		public String deleteReplyReport(
				@PathVariable ("reportNo") int reportNo,
				 Model m,
				 RedirectAttributes ra, HttpSession session, HttpServletRequest request) {
			
			User loginUser = (User) session.getAttribute("loginUser");
	     
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }			int result = adminService.deleteReport(reportNo);
			 
			 if(result>0) {
				 ra.addFlashAttribute("alertMsg","확인하였습니다.");
				 
			 }else {
				 ra.addFlashAttribute("alertMsg", "삭제에 실패하였습니다.");
			 }
			
			 return "redirect:/admin/report/Reply";
			 
			 
		}
		
		@GetMapping("/delete/report/{boardNo}")
		public String deleteBoardReport(
				@PathVariable ("boardNo") int boardNo,
				 Model m,
				 RedirectAttributes ra, HttpSession session, HttpServletRequest request) {
			
			User loginUser = (User) session.getAttribute("loginUser");
	     
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }
			int result = adminService.deleteBoardReport(boardNo);
			 
			 if(result>0) {
				 ra.addFlashAttribute("alertMsg","확인하였습니다.");
				 
			 }else {
				 ra.addFlashAttribute("alertMsg", "삭제에 실패하였습니다.");
			 }
			
			 return "redirect:/admin/report/Board";
			 
			 
		}
		@GetMapping("/delete/report/reply/{replyNo}")
		public String deleteReplyDatailReport(
				@PathVariable ("replyNo") int replyNo,
				 Model m,
				 RedirectAttributes ra, HttpSession session, HttpServletRequest request) {
			
			User loginUser = (User) session.getAttribute("loginUser");
	     
	        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
	            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
	                return "redirect:/";
	            }
	        }
	        
			int result = adminService.deleteReplyDatailReport(replyNo);
			 
			 if(result>0) {
				 ra.addFlashAttribute("alertMsg","확인하였습니다.");
				 
			 }else {
				 ra.addFlashAttribute("alertMsg", "삭제에 실패하였습니다.");
			 }
			
			 return "redirect:/admin/report/Reply";
		}
		
				@GetMapping("/report/detail/{bno}")
				public String selectReportBoard(@PathVariable("bno") int boardNo, Model m, HttpServletRequest req,
						HttpServletResponse res, HttpSession session) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (req.getRequestURI().startsWith(req.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
					
					Board b = boardService.selectBoard(boardNo);

					if (b != null) {
						List<Attachment> imgList = boardService.selectImgList(boardNo);
						m.addAttribute("imgList", imgList);
													
					} else {
						m.addAttribute("errorMsg", "조회실패");
						return "common/errorPage";
					}
					m.addAttribute("b", b);

					return "admin/ReportBoardDetail";
				}
				
				@GetMapping("/report/detail/reply/{replyNo}")
				public String selectReportReply(@PathVariable("replyNo") int replyNo, Model m, HttpServletRequest req,
						HttpServletResponse res, HttpSession session) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (req.getRequestURI().startsWith(req.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
					
					Reply b = adminService.selectReply(replyNo);

					
					m.addAttribute("b", b);

					return "admin/ReportReplyDetail";
				}
				
				
				@GetMapping("/Reply")
				public String ReplyList(Model m, HttpSession session, HttpServletRequest request) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			     
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
					List<Reply> list = adminService.ReplyList();

					m.addAttribute("list", list);

					return "admin/ReplyManagement";

				}
				@GetMapping("/Reply/today")
				public String ReplyTodayList(Model m, HttpSession session, HttpServletRequest request) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			     
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
					List<Reply> list = adminService.ReplyTodayList();

					m.addAttribute("list", list);

					return "admin/ReplyManagement";

				}	
				
				
				@GetMapping("/boardManagement")
				public String boardManagement(Model m, HttpSession session, HttpServletRequest request) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			     
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
					List<Product> list = adminService.productList();
					m.addAttribute("list",list);
					return "admin/boardManagement";
				}
				@GetMapping("/R")
			    public String searchReviewBoard(Model m, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
						@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			     
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
					int listCount = boardService.selectReviewCount(map);
					int pageLimit = 10;
					int boardLimit = 14;

					PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

					List<Board> list = boardService.reviewList(pi, map);
					m.addAttribute("list", list);
					m.addAttribute("pi", pi);
					m.addAttribute("param", map);
					return "admin/adminReviewList";
			    }
				@GetMapping("/C")
			    public String searchStoryBoard(Model m, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
						@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
			        
					int listCount = boardService.selectStoryCount(map);
					int pageLimit = 10;
					int boardLimit = 14;

					PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

					List<Board> list = boardService.storyList(pi, map);
					m.addAttribute("list", list);
					m.addAttribute("pi", pi);
					m.addAttribute("param", map);
					
					return "admin/adminStoryList";
			    }
				@GetMapping("/P")
			    public String searchProgramBoard(Model m, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
						@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
					
					int listCount = adminService.selectProgramCount(map);
					int pageLimit = 10;
					int boardLimit = 14;

					PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

					List<Program> list = adminService.programList(pi, map);
					m.addAttribute("list", list);
					m.addAttribute("pi", pi);
					m.addAttribute("param", map);
					
					return "admin/adminProgramList";
			    }
				@GetMapping("/D")
				public String donateList(Model model,@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
						@RequestParam Map<String,Object> map, HttpSession session, HttpServletRequest request) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
			        
					int listCount = adminService.selectDonateCount(map);
					int pageLimit = 10;
					int boardLimit = 14;
					
					PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
					List<Donate> list = adminService.donateList(pi,map);
					
					model.addAttribute("list", list);
					model.addAttribute("pi", pi);
					model.addAttribute("param",map);

					return "admin/adminDonateList";
				}
				
				@GetMapping("/delete/reply/{replyNo}")
				public String deleteReply(
						@PathVariable ("replyNo") int replyNo,
						 RedirectAttributes ra, HttpSession session, HttpServletRequest request) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			     
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
					int result= adminService.deleteReply(replyNo);
					
					if(result>0) {
						 ra.addFlashAttribute("alertMsg","댓글 삭제 되었습니다..");
						 
					 }else {
						 ra.addFlashAttribute("alertMsg", "삭제에 실패하였습니다.");
					 }
					
					 return "redirect:/admin/Reply";
					}
				
				@GetMapping("/confirm/{productNo}")
				public String confirmProduct(
						@PathVariable ("productNo") int productNo,
						 RedirectAttributes ra, HttpSession session, HttpServletRequest request) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			     
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
			        
					int result= adminService.confirmProduct(productNo);
					
					if(result>0) {
						 ra.addFlashAttribute("alertMsg","물품수령 확인되었습니다..");
						 
					 }else {
						 ra.addFlashAttribute("alertMsg", "확인에 실패하였습니다.");
					 }
					
					 return "redirect:/admin/boardManagement";
					}
				
				@GetMapping("/delete/product/{productNo}")
				public String deleteProduct(
						@PathVariable ("productNo") int productNo,
						 RedirectAttributes ra, HttpSession session, HttpServletRequest request) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			     
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
					int result= adminService.deleteProduct(productNo);
					
					if(result>0) {
						 ra.addFlashAttribute("alertMsg","물품기부가 삭제 되었습니다..");
						 
					 }else {
						 ra.addFlashAttribute("alertMsg", "삭제에 실패하였습니다.");
					 }
					
					 return "redirect:/admin/boardManagement";
					}
				
				@GetMapping("/confirm/product")
				public String productConfirmList(Model m, RedirectAttributes ra, HttpSession session, HttpServletRequest request) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
					
					List<Product> list = adminService.productConfirmList();
					if (list.isEmpty()) {
						ra.addFlashAttribute("alertMsg","내역이 없습니다.");
						 return "redirect:/admin/boardManagement";
				    } else {
				        m.addAttribute("list", list);
				        return "admin/adminConfirmProduct";
				    }
					
					
				}
				@GetMapping("/program/people/{programNo}")
				public String programPeople(Model m,
						@PathVariable ("programNo") int programNo,
						RedirectAttributes ra, HttpSession session, HttpServletRequest request) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			     
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
					 
					Program p = adminService.programPeopleCount(programNo);
					
					List<Program> list = adminService.programPeople(programNo);
					if (list.isEmpty()) {
					ra.addFlashAttribute("alertMsg","명단이 없습니다.");
						 return "redirect:/admin/adminProgramList";
				    } else {
				        m.addAttribute("list", list);
				        m.addAttribute("p", p);
				        return "admin/adminProgramPeople";
				    }
					
					
				}
				@GetMapping("/delete/program/{programNo}")
				public String deleteProgram(
						@PathVariable ("programNo") int programNo,
						 RedirectAttributes ra, HttpSession session, HttpServletRequest request) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
					int result= adminService.deleteProgram(programNo);
					
					if(result>0) {
						 ra.addFlashAttribute("alertMsg","봉사 프로그램이 삭제되었습니다..");
						 
					 }else {
						 ra.addFlashAttribute("alertMsg", "삭제에 실패하였습니다.");
					 }
					
					 return "redirect:/admin/P";
					}
				@GetMapping("/delete/donate/{donateNo}")
				public String deleteDonate(
						@PathVariable ("donateNo") int donateNo,
						 RedirectAttributes ra, HttpSession session, HttpServletRequest request) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
			        
					int result= adminService.deleteDonate(donateNo);
					
					if(result>0) {
						 ra.addFlashAttribute("alertMsg","후원 게시글이 삭제되었습니다..");
						 
					 }else {
						 ra.addFlashAttribute("alertMsg", "삭제에 실패하였습니다.");
					 }
					
					 return "redirect:/admin/D";
					}
				@GetMapping("/review/detail/{bno}")
				public String selectReviewBoard(@PathVariable("bno") int boardNo, Model m, HttpServletRequest req,
						HttpServletResponse res, HttpSession session) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (req.getRequestURI().startsWith(req.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
					
					Board b = boardService.selectBoard(boardNo);

					if (b != null) {
						List<Attachment> imgList = boardService.selectImgList(boardNo);
						m.addAttribute("imgList", imgList);
													
					} else {
						m.addAttribute("errorMsg", "조회실패");
						return "common/errorPage";
					}
					m.addAttribute("b", b);

					return "admin/adminReviewDetail";
				}
				@GetMapping("/delete/review/{boardNo}")
				public String deleteBoard(
						@PathVariable ("boardNo") int boardNo,
						 Model m,
						 RedirectAttributes ra, HttpSession session, HttpServletRequest request) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
					
					
					int result = boardService.deleteNotice(boardNo);
					 
					 if(result>0) {
						 ra.addFlashAttribute("alertMsg","삭제하였습니다.");
						 
					 }else {
						 ra.addFlashAttribute("alertMsg", "삭제에 실패하였습니다.");
					 }
					
					 
					 return "redirect:/admin/R";
					 
				}
				@GetMapping("/story/detail/{bno}")
				public String selectStoryBoard(@PathVariable("bno") int boardNo, Model m, HttpServletRequest req,
						HttpServletResponse res, HttpSession session) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (req.getRequestURI().startsWith(req.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
					
					Board b = boardService.selectBoard(boardNo);

					if (b != null) {
						List<Attachment> imgList = boardService.selectImgList(boardNo);
						m.addAttribute("imgList", imgList);
													
					} else {
						m.addAttribute("errorMsg", "조회실패");
						return "common/errorPage";
					}
					m.addAttribute("b", b);

					return "admin/adminStoryDetail";
				}
				
				
				@GetMapping("/delete/story/{boardNo}")
				public String deleteStory(
						@PathVariable ("boardNo") int boardNo,
						 Model m,
						 RedirectAttributes ra, HttpSession session, HttpServletRequest request) {
					
					User loginUser = (User) session.getAttribute("loginUser");
			        if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getRole())) {
			            if (request.getRequestURI().startsWith(request.getContextPath() + "/admin")) {
			                return "redirect:/";
			            }
			        }
			        
					int result = boardService.deleteNotice(boardNo);
					 
					 if(result>0) {
						 ra.addFlashAttribute("alertMsg","삭제하였습니다.");
						 
					 }else {
						 ra.addFlashAttribute("alertMsg", "삭제에 실패하였습니다.");
					 }
					
					 
					 return "redirect:/admin/C";
					 
				}


}