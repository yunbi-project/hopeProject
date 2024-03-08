package com.kh.hope.donate.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hope.attachment.model.vo.Attachment;
import com.kh.hope.config.Utils;
import com.kh.hope.donate.model.service.DonateService;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.donate.model.vo.DonateTag;
import com.kh.hope.payment.model.service.PaymentService;
//import com.kh.hope.payment.model.service.PaymentService;
import com.kh.hope.payment.model.vo.PaymentInfo;
import com.kh.hope.user.model.service.UserService;
import com.kh.hope.user.model.vo.User;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes({"loginUser"})
public class DonateController {

	@Autowired
	private DonateService service;
	private UserService userService;
	private PaymentService paymentService;
	
	@Autowired
	private ServletContext application;  //application에 의존성 주입
	
	// 게시판 목록
	@GetMapping("/donate/list")
	public String donateList(Model model,
			@RequestParam Map<String,Object> map) {
		
		List<Donate> list = service.donateList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("param",map);
		
		Date currentDate = new Date();
	    model.addAttribute("currentDate", currentDate); // 현재 날짜 가져옴

		return "donate/donateList";
	}
	
	// 게시판 상세보기
	@GetMapping("/donate/detail/{donateNo}")
	public String donateDetail(@PathVariable int donateNo,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
							Model model,
							@RequestParam Map<String,Object> map,
							HttpServletRequest req,
							HttpServletResponse res,
							HttpSession session) {
		
		Donate donate = service.donateDetail(donateNo);
		
		
		Date currentDate = new Date();
		model.addAttribute("currentDate", currentDate);
		
		
		
		List<Donate> otherList = service.selectOtherDonateList(map);
		
		model.addAttribute("otherList", otherList);

		
		
		List<PaymentInfo> payPeople = service.selectPayPeople(donateNo);

		model.addAttribute("payPeople", payPeople);
		
		
		if(donate != null) {
			int userNo = 0;
			
			User loginUser = (User) session.getAttribute("loginUser");
			
			if(loginUser != null) {
				userNo = loginUser.getUserNo();
			}
			
			// 게시글 작성자의 boardWriter와 세션에서 얻어온 userNo가 같지 않은 경우에만 조회수 증가
			if(donate.getUserNo() != userNo) {
				
				// 쿠키
				Cookie cookie = null;
				
				Cookie[] cArr = req.getCookies(); // 사용자의 쿠키정보를 가져오기
				
				if(cArr != null & cArr.length > 0) {
					
					for(Cookie c : cArr) {
						// 사용자의 쿠키 목록중, 쿠키의 이름이 "readBoardNo"라는 것을 찾을예정
						if("readDonateNo".equals(c.getName())) {
							cookie = c;
							break;
						}
					}
				}
				
				int result = 0;
				
				// readBoardNo라는 이름의 쿠키가 생성된적이 없을때
				if(cookie == null) {
					// readBoardNo쿠키 생성
					cookie = new Cookie("readDonateNo", donateNo +"");
					
					// 조회수 증가 서비스 호출
					result = service.increaseCount(donateNo);
				}else {
					// readBoardNo라는 이름의 쿠키가 존재하는 케이스
					// 기존 쿠키값중에 중복되는 게시글번호가 없는 경우, 
					// 조회수증가와 함께 쿠키에 저장된 값중 현재 조회된 게시글번호를 추가
					
					String[] arr = cookie.getValue().split("/");  // 1/2/5/11  .... => [1,2,5,11...]
					// 배열을 컬렉션(List)으로 변환 → indexOf를 사용할 예정
					// List.indexOf(obj) : 컬렉션안에서 매개변수로 들어온 obj와 일치하는 부분의 인덱스를 반환해줌
					// 일치하는 값이 없다면? -1 반환
					List<String> list = Arrays.asList(arr);
					
					// 기존의 쿠키값들중 현재 게시글번호와 일치하는값이 없는 경우 => 처음 보는 게시글인 경우
					if(list.indexOf(donateNo+"") == -1) {
						// 조회수 증가
						result = service.increaseCount(donateNo);
						
						// 쿠키값에 현재 게시글번호 추가
						cookie.setValue(cookie.getValue() + "/" + donateNo);
					}
				}
				
				if(result > 0) { // 성공적으로 조회수 증가시
					donate.setCount(donate.getCount() + 1);
					
					cookie.setPath(req.getContextPath());
					cookie.setMaxAge(1 * 60 * 60);  // 1시간만 유지되도록 설정. 초단위로 작성해주어야함
					res.addCookie(cookie);
				}
			}
		}else {  // 조회된 board가 null인 경우
			model.addAttribute("erroMsg", "게시글 조회 실패....");
			return "redirect:/errorPage";
		}
		
		
		model.addAttribute("donate", donate);
		
		
		return "donate/donateDetail";
	}
	
	

	
	// 게시판 등록 페이지로 이동
	@GetMapping("/donate/boardInsert")
	public String donateBoardInsert(Model model, @ModelAttribute("loginUser") User loginUser,RedirectAttributes ra) {
		
		if (loginUser.getUserNo() != 1) {
			ra.addFlashAttribute("alertMsg", "게시글 등록 권한이 없습니다.");
			return "redirect:/errorPage";
		}
		
		List<DonateTag> tag = service.selectTagList();
		
		model.addAttribute("tag", tag);
		
		return "donate/donateBoardForm";
	}
	
	// 게시판 등록 + 사진등록
	@PostMapping("/donate/insertDonateBoard")
	public String insertDonateBoard(
			Model model,
			HttpSession session, 
			Donate donate,
			RedirectAttributes ra, 
			@RequestParam(value="upfile", required=false) MultipartFile upfile, // 첨부파일
			@RequestParam(value="upfiles", required=false) List<MultipartFile> upfiles
			) {
		
		
		String webPath = "/resources/images/donate/" + "/"; 
		String serverFolderPath = application.getRealPath(webPath);
		
		
		// resources 폴더안에는 아무것도 없기 때문에 디렉토리가 존재하지 않는다면 생성해주는 코드 추가
		File dir = new File(serverFolderPath);
		if(!dir.exists()) {   // 존재하지 않는다면 디렉토리 생성
			dir.mkdirs();  // 디렉토리를 여러개 추가해야하니까 mkdirs로 추가
		}
		
		// 사용자가 첨부파일을 등록한 경우
		// upfile은 첨부파일이 있든, 없든 무조건 객체는 생성됨.
		// 단, 첨부파일 등록을 하지 않은경우 내부에 데이터가 비어있다. ("")
		// 사용자가 전달한 파일이 있는지 없는지는 filename이 존재하는지로 확인하면 된다.

		
		List<Attachment> imgList = new ArrayList();
		
		
		if(upfiles != null) {  
			for(int i=0; i<upfiles.size(); i++) {
				
				if(upfiles.get(i).getOriginalFilename().equals("")) {
					continue; // 반복 다시 돌림
				}
				
				String changeName = Utils.saveFile(upfiles.get(i), serverFolderPath);
				Attachment at = new Attachment();
				at.setChangeName(changeName);
				at.setOriginName(upfiles.get(i).getOriginalFilename());
				// pk, refBno
				imgList.add(at);
			}
		}
	
		
		int result=0;
		
		try {
			result = service.insertDonateBoard(donate, imgList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String url = "";
    	
		if(result > 0) {
    		session.setAttribute("alertMsg", "성공적으로 게시글 등록이 되었습니다.");
    		url = "redirect:/donate/list";
    		
    	}else {
    		model.addAttribute("alertMsg", "게시글 등록에 실패하였습니다.");
    		url = "redirect:/errorPage";
    	}
    	
    	return url;
	}
	
	// 게시판 수정하기 폼 이동
	@GetMapping("/donate/update/{donateNo}")
	public String updateProductForm(
			@PathVariable int donateNo,
			HttpServletRequest request,
			Model model,
			@ModelAttribute("loginUser") User loginUser,RedirectAttributes ra
			) {
		
		if (loginUser.getUserNo() != 1) {
			ra.addFlashAttribute("alertMsg", "게시글 수정 권한이 없습니다.");
			return "redirect:/errorPage";
		}
		
	    // 세션에서 특정 플래그가 설정되어 있는지 확인
	    Boolean hasVisited = (Boolean) request.getSession().getAttribute("hasVisitedDonateProductUpdate");
	    if (hasVisited != null && hasVisited) {
	        // 플래그가 이미 설정되어 있으면 직접적인 URL 접근을 막기 위해 다른 페이지로 리다이렉트
	        return "redirect:/errorPage"; // 적절한 리다이렉트 경로로 수정
	    }
	    
	    // 플래그를 설정하여 다음에 직접적인 URL 접근을 막음
	    request.getSession().setAttribute("hasVisitedDonateUpdate", true);
	    
	    Donate donate = service.donateDetail(donateNo);
	    List<DonateTag> tag = service.selectTagList();
		
	    model.addAttribute("tag", tag);
	    
	    donate.setDonateContent(Utils.newLineClear(donate.getDonateContent()));
	    
	    model.addAttribute("donate", donate);
		
		return "donate/donateUpdateBoardForm";
	}
	
	// 게시판 수정
	@PostMapping("/donate/updateDonateBoard/{donateNo}")
	public String donateBoardUpdate(
			@PathVariable int donateNo,
			RedirectAttributes ra,
			Model model,
			Donate donate,
			HttpServletRequest request,
			@RequestParam(value="upfiles", required=false) List<MultipartFile> upfiles,
			String deleteList) {
		
		
		donate.setDonateNo(donateNo);
		
		int result = service.updateDonateBoard(donate, deleteList, upfiles);
	    
	    if(result > 0) {
    		ra.addFlashAttribute("alertMsg", "게시글이 성공적으로 수정되었습니다.");
    		return "redirect:/donate/detail/" + donateNo;
	    }else {
	    	ra.addFlashAttribute("alertMsg", "게시글 수정 실패");
    		return "redirect:/errorPage";
	    }
		
	}
	
//	게시글 삭제
	@GetMapping("/donate/delete/{donateNo}")
	public String deleteDonateBoard(@PathVariable int donateNo, Model model, Donate donate, RedirectAttributes ra) {
		
		int result = service.deleteDonateBoard(donateNo);
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "게시글이 성공적으로 삭제되었습니다.");
			return "redirect:/donate/list" ;
		}else {
			ra.addFlashAttribute("alertMsg", "게시글을 삭제하는데 실패하였습니다.");
			return "redirect:/errorPage";
		}
	}
	
	
	// 후원 페이지로 이동
	@GetMapping("/donate/insertPay/{donateNo}")
	public String donateInsert(@PathVariable int donateNo, Model model) {
		

		return "donate/donateForm";
	}
	

	
}
