package com.kh.hope.donate.controller;

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

import com.kh.hope.common.Template.model.vo.Pagenation;
import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.donate.model.service.DonateService;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.payment.model.service.PaymentService;
//import com.kh.hope.payment.model.service.PaymentService;
import com.kh.hope.payment.model.vo.PaymentInfo;
import com.kh.hope.user.model.service.UserService;
import com.kh.hope.user.model.vo.User;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@SessionAttributes({"loginUser"})
public class DonateController {

	@Autowired
	private DonateService service;
	private UserService userService;
	private PaymentService paymentService;
	
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
	
	
	@GetMapping("/donate/detail/{donateNo}")
	public String donateDetail(@PathVariable int donateNo,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
							Model model,
							@RequestParam Map<String,Object> map,
							HttpServletRequest req,
							HttpServletResponse res,
							HttpSession session) {
		
//		List<CurrentUser> currentUser = service.selectCurrentUser(donateNo);
		Donate donate = service.donateDetail(donateNo);
		
//		model.addAttribute("currentUser",currentUser);
		
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
		
		
//		User user = this.userService.loginUser("qq@gmail.com");
//		int paymentId = (int)System.currentTimeMillis();
//		
////		PaymentData paymentData = this.service.save(paymentData);
//		
//		//멀티PG 분기(db로 관리할 수 있다)
//		String[] pg_code = {"nice"};
//		String[] channelKey = {"channel-key-be913655-023d-46c3-8d64-730c0335ab55"};
//		
//		long seleted_pg = donateNo % 2;
//		
//		//스토어 아이디
//		model.addAttribute("storeId", "store-8f6f306a-dbde-4b32-b80e-d224a95b48a9" );
//		
//		//pg사 채널키
//		model.addAttribute("channelKey", channelKey[(int)seleted_pg]);
//		
//		//상점주문번호
//		model.addAttribute("paymentId", paymentId);
//		
//		//회원, 도네이트, 주문정보
//		model.addAttribute("user", user);
//		model.addAttribute("donate", donate);
//		model.addAttribute("paymentData", paymentData);
		
		return "donate/donateDetail";
	}
	
	
	
	@GetMapping("/donate/insert/{donateNo}")
	public String donateInsert(@PathVariable int donateNo, Model model) {
//		PaymentInfo p = service.getPayment(donateNo);
//		model.addAttribute("p", p);
		return "donate/donateForm";
	}
	
	@GetMapping("/donate/boardInsert/{donateNo}")
	public String donateBoardInsert(@PathVariable int donateNo, Model model) {
		
		return "donate/donateBoardForm";
	}
	
	
//	@PostMapping("/donate/insert/{donateNo}")
//	public String saveObject(@PathVariable int donateNo, @ModelAttribute("paymentInfo") PaymentInfo paymentInfo, Model model){
//		int payment = service.save(paymentInfo);
////			KakaoPayReadyResponse ready = paymentService.kakaoPayReadyResponse(paymentInfo);		
////			model.addAttribute("tid", ready.getTid());
//		return "redirect:/donate/list";
//	}
	
}
