package com.kh.hope.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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

import com.kh.hope.attachment.model.vo.Attachment;
import com.kh.hope.board.model.service.BoardService;
import com.kh.hope.board.model.vo.Board;
import com.kh.hope.board.model.vo.BoardExt;
import com.kh.hope.common.Template.model.vo.Pagenation;
import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.config.Utils;
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
@SessionAttributes({ "loginUser" })
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;

	@Autowired
	private ServletContext application;

	/*
	 * 각 페이지 리스트조회* /*공지사항
	 */
	@GetMapping("/N")
	public String NoticeList(Model m, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam Map<String, Object> map) {
		int listCount = service.selectListCount(map);
		int pageLimit = 10;
		int boardLimit = 10;

		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		List<Board> list = service.noticeList(pi, map);
		m.addAttribute("list", list);
		m.addAttribute("pi", pi);
		m.addAttribute("param", map);

		return "board/SnoticeList";
	}

	/* 공지사항 등록 */
	@GetMapping("/insert/{boardTypeNo}")
	public String noticeInsert(
			Model m,
			RedirectAttributes ra,
			@PathVariable("boardTypeNo") String boardTypeNo) {
		
		// 게시판 유형에 따라 다른 JSP 파일 선택
	    String url;
	    if (boardTypeNo.equals("N")) {
	        url = "board/SnoticeInsert"; // 공지사항
	    } else if (boardTypeNo.equals("C")) {
	        url = "board/SstoryInsert"; //자유게시판
	    } else {
	        url = "board/SreviewInsert"; // 기타
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
			@PathVariable("boardTypeNo") String boardTypeNo // 추가된 부분
	) {
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
			result = service.insertNotice(b, imgList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String url = "";
		if (result > 0) {
			ra.addFlashAttribute("alertMsg", "작성에 성공하였습니다.");
			url = "redirect:/board/"+boardTypeNo;
		} else {
			m.addAttribute("errorMsg", "다시 작성해주세요");
			url = "common/errorPage";
		}
		return url;

	}

	@GetMapping("/detail/N/{bno}")
	public String selectBoard(@PathVariable("bno") int boardNo, Model m, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) {
		
		Board b = service.selectBoard(boardNo);

		if (b != null) {
			List<Attachment> imgList = service.selectImgList(boardNo);
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
					result = service.increaseCount(boardNo);

				} else {
					String[] arr = cookie.getValue().split("/");
					List<String> list = Arrays.asList(arr);
					if (list.indexOf(boardNo + "") == -1) {
						result = service.increaseCount(boardNo);
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

		return "board/SnoticeDetail";
	}

	@GetMapping("/fileDownload/{boardTypeNo}/{fileNo}")
	public ResponseEntity<Resource> fileDownload(
			@PathVariable("fileNo") int fileNo,
			@PathVariable("boardTypeNo") String boardTypeNo) {
		// DB에서 해당 게시물의 첨부 파일 정보 조회
		Attachment attachment = service.selectImg(fileNo);

		// 다운로드할 파일이 없는 경우 404 응답 반환
		if (attachment == null) {
			return ResponseEntity.notFound().build();
		}

		// 파일에 대한 다운로드 링크를 담을 리스트 생성
		ResponseEntity<Resource> responseEntities = null;

		// 각 파일에 대한 다운로드 링크 생성하여 리스트에 추가
		// 파일 경로 설정
		String saveDirectory = application.getRealPath("/resources/images/board/"+boardTypeNo+"/");
		File downFile = new File(saveDirectory, attachment.getChangeName());

		// 파일이 존재하는지 확인
		if (!downFile.exists()) {
			return ResponseEntity.notFound().build();
		} else {
			// 파일 Resource로 변환
			Resource resource = new FileSystemResource(downFile);

			// 파일 이름을 ISO-8859-1로 변환하여 헤더에 설정
			String encodedFileName;
			try {
				encodedFileName = new String(attachment.getOriginName().getBytes("UTF-8"), "ISO-8859-1");
			} catch (UnsupportedEncodingException e) {
				encodedFileName = attachment.getOriginName();
			}

			// 파일 다운로드를 위한 ResponseEntity 생성 및 리스트에 추가
			responseEntities = ResponseEntity.ok()
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE)
					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=\"" + encodedFileName + "\"")
					.body(resource);
		}

		// 다운로드할 파일들에 대한 ResponseEntity 리스트 반환
		return responseEntities;
	}
	/*
	 * @GetMapping("/update/N/{boardNo}") public String
	 * updateNotice(@PathVariable("boardNo") int boardNo, Model m) { Board b =
	 * service.selectUpdateBoard(boardNo);
	 * 
	 * if (b != null) { String boardContent = b.getBoardContent(); if (boardContent
	 * != null) { b.setBoardContent(Utils.newLineClear(boardContent)); }
	 * m.addAttribute("b", b); System.out.println(b); return "board/SnoticeModify";
	 * } else { m.addAttribute("errorMsg", "게시물을 찾을 수 없습니다."); return
	 * "common/errorPage"; } }
	 * 
	 * @PostMapping("/update/N/{boardNo}") public String
	 * updateNoticeInsert(@PathVariable("boardNo") int boardNo, Model m, Board b,
	 * RedirectAttributes ra,
	 * 
	 * @RequestParam(value = "upfiles", required = false) List<MultipartFile>
	 * upfiles, String deleteList) { b.setBoardNo(boardNo);
	 * 
	 * int result = service.updateBoardInsert(b, deleteList, upfiles);
	 * 
	 * if (result > 0) { ra.addFlashAttribute("alertMsg", "게시글 수정 성공"); return
	 * "redirect:/board/detail/N/" + boardNo;
	 * 
	 * } else { ra.addFlashAttribute("alertMsg", "게시글 수정 실패"); return
	 * "redirect:/board/detail/N/" + boardNo; }
	 * 
	 * }
	 */
	
	 /*삭제하기*/
	 
	 @GetMapping("/delete/{boardNo}") 
	 public String deleteBoard(
			 @PathVariable ("boardNo") int boardNo,
			 @RequestParam("boardTypeNo") String boardTypeNo, // 추가된 부분
			 Model m,
			 RedirectAttributes ra
			 ) {
		 int result = service.deleteNotice(boardNo);
		 
		 if(result>0) {
			 ra.addFlashAttribute("alertMsg","게시글 삭제에 성공하였습니다.");
			 
		 }else {
			 ra.addFlashAttribute("alertMsg", "삭제에 실패하였습니다.");
		 }
		 
		 return "redirect:/board/" + boardTypeNo;
		 
	 }
	 
	 

	/* 자주묻는질문 */
	@GetMapping("/Q")
	public String faqList(Model m) {
		List<Board> list = service.faqList();
		m.addAttribute("list", list);
		return "board/SFAQList";
	}

	/* 자주묻는질문 물품기부 */
	@GetMapping("/Q/1")
	public String faqList1(Model m) {
		List<Board> list = service.faqList1();
		m.addAttribute("list", list);
		return "board/SFAQListProduct";
	}

	@GetMapping("/Q/2")
	public String faqList2(Model m) {
		List<Board> list = service.faqList2();
		m.addAttribute("list", list);
		return "board/SFAQListProduct2";
	}

	@GetMapping("/Q/3")
	public String faqList3(Model m) {
		List<Board> list = service.faqList3();
		m.addAttribute("list", list);
		return "board/SFAQListProduct3";
	}
	@GetMapping("/insert/Q")
	public String FaqInsert() {
		
		return "board/SFAQInsert";
	}
	@PostMapping("/insert/Q")
	public String insertFaq(Board b, @ModelAttribute("loginUser") User loginUser, Model m,
			
			RedirectAttributes ra) {
		
		b.setUserNo(loginUser.getUserNo());
		int result = 0;
		try {
			result = service.insertFaq(b);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String url = "";
		if (result > 0) {
			ra.addFlashAttribute("alertMsg", "작성에 성공하였습니다.");
			url = "redirect:/board/Q";
		} else {
			m.addAttribute("errorMsg", "다시 작성해주세요");
			url = "common/errorPage";
		}
		return url;
		
	}

	/*이야기*/
	@GetMapping("/C")
	public String storyList(
			Model m,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			@RequestParam Map<String,Object> map
			) {		
		int listCount = service.selectStoryCount(map);
		int pageLimit = 10;
		int boardLimit = 6;
		
		PageInfo pi = Pagenation.getPageInfo(listCount,currentPage,pageLimit,boardLimit);
		 List<Board> list = service.storyList(pi,map);
		 m.addAttribute("list", list);
	 	 m.addAttribute("pi",pi);
		 m.addAttribute("param",map);	 
		return "board/SstoryList";
	}
	/*이야기 상세보기*/
	@GetMapping("/detail/C/{bno}")
	public String selectStory(@PathVariable("bno") int boardNo, Model m, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) {
		
		Board b = service.selectBoard(boardNo);

		if (b != null) {
			List<Attachment> imgList = service.selectImgList(boardNo);
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
					result = service.increaseCount(boardNo);

				} else {
					String[] arr = cookie.getValue().split("/");
					List<String> list = Arrays.asList(arr);
					if (list.indexOf(boardNo + "") == -1) {
						result = service.increaseCount(boardNo);
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

		return "board/SstoryDetail";
	}
	@GetMapping("/update/{boardTypeNo}/{boardNo}")
	public String updateBoard(@PathVariable("boardNo") int boardNo, 
			@PathVariable ("boardTypeNo") String boardTypeNo,
			Model m) {
		Board b = service.selectUpdateBoard(boardNo);

		if (b != null) {
			String boardContent = b.getBoardContent();
			if (boardContent != null) {
				b.setBoardContent(Utils.newLineClear(boardContent));
			}
			m.addAttribute("b", b);
			System.out.println(b);			 String url;
			    if (boardTypeNo.equals("N")) {
			        url = "board/SnoticeModify"; // 공지사항
			    } else if (boardTypeNo.equals("C")) {
			        url = "board/SstoryModify"; //자유게시판
			    } else {
			        url = "board/SreviewModify"; // 기타
			    }
			    
			    return url;
			
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

		int result = service.updateBoardInsert(b,boardTypeNo, deleteList, upfiles);

		if (result > 0) {
			ra.addFlashAttribute("alertMsg", "게시글 수정 성공");
			return "redirect:/board/detail/"+boardTypeNo+"/" + boardNo;

		} else {
			ra.addFlashAttribute("alertMsg", "게시글 수정 실패");
			return "redirect:/board/detail/"+boardTypeNo+"/" + boardNo;
		}

	}
	/*나눔후기*/
	@GetMapping("/R")
	public String reviewList(
			Model m,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			@RequestParam Map<String,Object> map
			) {		
		int listCount = service.selectReviewCount(map);
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagenation.getPageInfo(listCount,currentPage,pageLimit,boardLimit);
		 List<Board> list = service.reviewList(pi,map);
		 m.addAttribute("list", list);
	 	 m.addAttribute("pi",pi);
		 m.addAttribute("param",map);
		return "board/SreviewList";
	}
	/*나눔후기 상세*/
	@GetMapping("/detail/R/{bno}")
	public String selectReview(@PathVariable("bno") int boardNo, Model m, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) {
		
		Board b = service.selectBoard(boardNo);

		if (b != null) {
			List<Attachment> imgList = service.selectImgList(boardNo);
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
					result = service.increaseCount(boardNo);

				} else {
					String[] arr = cookie.getValue().split("/");
					List<String> list = Arrays.asList(arr);
					if (list.indexOf(boardNo + "") == -1) {
						result = service.increaseCount(boardNo);
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

		return "board/SreviewDetail";
	}
	
}
