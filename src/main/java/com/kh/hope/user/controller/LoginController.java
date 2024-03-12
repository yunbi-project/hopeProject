package com.kh.hope.user.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hope.user.model.service.UserService;
import com.kh.hope.user.model.vo.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes({"loginUser"}) // Model 안에 추가된 값의 key값과 일치하는 값이 같으면 해당값을 세션스코프에 이관
// 리퀘스트 스코프와 세션 스코프는 명백한 차이가있음.
@Slf4j
public class LoginController {
	

	private UserService userService;

	private PasswordEncoder passwordEncoder;
	
	@Autowired	// 의존성 주입은 생성자 주입을 사용해야함.
	public LoginController(UserService userService) {
		this.userService = userService;
		this.passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
	
	public LoginController() {
		
	}
	

	
	@GetMapping("/login")	// 로그인 페이지 
	public String home1() {
		return "member/login";
	}
	
	@PostMapping("/login.me")	// 로그인 요청
	public ModelAndView login (
			User user,
			HttpSession session,
			Model model, 
			ModelAndView mv,
			RedirectAttributes redirectAttributes){
		
		String email = user.getEmail();
		User loginUser = userService.loginUser(email);
		
		 // 로그인 성공 시 세션의 타임아웃을 30분으로 설정
		session.setAttribute("expiryTime", System.currentTimeMillis() + 10 * 1000); // 30분.
		
		// 세션로그인 비밀번호 확인 및 로그인 타입이 세션로그인인지 확인하는 절차. passwordEncoder 단방향 암호화
		if(loginUser != null && passwordEncoder.matches(user.getPassword(), loginUser.getPassword()) && user.getLoginType().equals("1")) {
			model.addAttribute("loginUser", loginUser);
			log.info("loginUser {} ", loginUser);
			
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("expiryTime", System.currentTimeMillis() + 10 * 1000); 
			log.info("expiryTime {} ", System.currentTimeMillis());
			mv.setViewName("redirect:/");
		}else {
			
			redirectAttributes.addFlashAttribute("errorMsg", "회원정보를 정확히 입력해주세요"); 
			mv.setViewName("redirect:" + "/login");
		}
		
		
		
		return mv;
	}
	
	@GetMapping("singup.me")
	public String insertUser() {
		return "member/signUp";
	}
	
	// 회원가입
	@PostMapping("singup.me")		
	public String insertUser(
			User user, 
			@RequestParam("postcode") String postcode,
			@RequestParam("address") String address,
			@RequestParam("detailAddress") String detailAddress,
			Model model,
			HttpSession session
			) {
	
		// 암호화 
		String encPwd = passwordEncoder.encode(user.getPassword());
		user.setPassword(encPwd);
		
		// api로부터 받아온 정보 합쳐서 address에 추가.
		String total =  address +  "," + postcode +  "," + detailAddress;
		user.setAddress(total);
		
		int result = userService.insertUser(user);
		
		String url = "";
		if(result > 0) {
			session.setAttribute("alertMsg", "회원가입성공");
			url = "redirect:" + "/login";
		}else {
			model.addAttribute("errorMsg","회원가입실패");
		}
		return url;
	}
	
	// 아이디 유효성 검사
	@ResponseBody 
	@GetMapping("/idcheck")			
	public String idCheck(String email) {
	

	    int result = userService.idCheck(email);
	    return result + "";
	}

	
	@GetMapping("/idfind")
	public String idfind() {
		return "member/usersumfind";
	}
	@GetMapping("/passwordfind")
	public String passwordfind() {
		return "member/usersumfind";
	}
	// 아이디 찾기
	@PostMapping("idfind.me")	
	public String idfind(
			User user, 
			Model model,
			HttpSession session
			) {
		
		// 핸드폰 + 이름
		User user1 = userService.idfind(user);
		
		
		if(user1 != null) {
			session.setAttribute("alertMsg", "아이디 찾기 성공");	
			session.setAttribute("idfind", user1);
			
			return "member/useridfind";	
			
		}else {
		model.addAttribute("errorMsg","아이디 찾기 실패");
		
		return "member/usersumfind";
		}
		
	}
	
//  휴대폰 전화번호 인증
  @PostMapping("/idcheck.me") //jsp 페이지 넘긴 mapping 값
  @ResponseBody    
      public String sendSMS(String phone) {
   
	  
          Random rand  = new Random(); //랜덤숫자 생성하기 !!
          String numStr = "";
          for(int i=0; i<4; i++) {
              String ran = Integer.toString(rand.nextInt(10));
              numStr+=ran;
          }
          
          
          userService.certifiedPhoneNumber(phone, numStr); //휴대폰 api 쪽으로 가기 !!

           
            return numStr;
      }
  
//비밀번호 찾기
	@PostMapping("pwdfind.me") 
	public String pwdfind(
			User user, 
			Model model,
			HttpSession session
			) {
		User user1 = userService.pwdfind(user);
		
		if(user1 != null) { // user1이 null이 아니면 비밀번호 찾기 성공 
			session.setAttribute("alertMsg", "비밀번호 찾기 성공");	
			session.setAttribute("pwdemail", user1.getEmail());
			return "member/repassword";		
		}else {

		return "member/errorPage";

		}
	}
	
	@PostMapping("repassword.me")	// 비밀번호 재설정
	public String repassword(
	        User user,
	        HttpSession session,
	        HttpServletRequest request
	) {
		// pwdfind.me 에서 세션에 저장한 email 
	    String email = (String) session.getAttribute("pwdemail");
	    
	    if (email == null) { // 세션에 이메일이 없을 경우 처리
	        return "redirect:/member/usersumfind.jsp"; // 비밀번호 찾기 페이지로 리다이렉트
	    }
	    // 비밀번호
	    String password1 = user.getPassword();
	    // 비밀번호 재확인
	    String ConfirmPassword = user.getConfirmPassword();

	    if (!password1.equals(ConfirmPassword)) { // 비밀번호가 일치하지 않을 경우 처리
	        session.setAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
	        
	        return "redirect:/member/repassword.jsp"; // 비밀번호 재설정 페이지로 리다이렉트
	    }
	    
	    String password = passwordEncoder.encode(password1);
	    int result = userService.repassword(password, email);

	    if (result > 0) {
	        session.setAttribute("alertMsg", "비밀번호 변경 성공");
	        return "redirect:" + "/login";  // 비밀번호 변경 성공 시 로그인 페이지로 리다이렉트
	    } else {
	        // 비밀번호 변경 실패 시 처리
	        session.setAttribute("errorMsg", "비밀번호 변경 실패");
	        return "redirect:/main/repassword.jsp"; // 비밀번호 재설정 페이지로 리다이렉트
	    }
	}
	@GetMapping("logout.me")	// 로그아웃
	public String logoutMember(HttpSession session, SessionStatus status) {
		
		session.invalidate();
		status.setComplete(); // @SessionAttribute , model session scope 이관된 데이터 비워줘야함
		
		return "redirect:/"; // 메인페이지 이동
	}
}


