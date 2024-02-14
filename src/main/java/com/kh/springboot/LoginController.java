package com.kh.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.springboot.user.model.service.UserService;
import com.kh.springboot.user.model.vo.User;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@SessionAttributes({"loginUser"}) // Model 안에 추가된 값의 key값과 일치하는 값이 같으면 해당값을 세션스코프에 이관
// 리퀘스트 스코프와 세션 스코프는 명백한 차이가있음.
public class LoginController {
	

	private UserService userService;
	

//	private BCryptPasswordEncoder bCryptPasswordEncoder;
	private PasswordEncoder passwordEncoder;
	
	@Autowired	// 의존성 주입은 생성자 주입을 사용해야함.
	public LoginController(UserService userService) {
		this.userService = userService;
		this.passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
//		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
	}
	
	@GetMapping("/")	// 기본 메인페이지
	public String home() {
		return "forward:/mainPage.jsp";
	}
	
	@GetMapping("/login")	// 로그인 페이지 
	public String home1() {
		return "forward:/gunjsp/login.jsp";
	}
	
	@PostMapping("login.me")	// 로그인 요청
	public ModelAndView login (
			User user,
			HttpSession session,
			Model model, 
			ModelAndView mv){
		
		String email = user.getEmail();
		User loginUser = userService.loginUser(email);
		System.out.println(loginUser);
		
		 // 로그인 성공 시 세션의 타임아웃을 30분으로 설정
        session.setMaxInactiveInterval(30 * 60); // 30분.
		
		// 세션로그인 비밀번호 확인 및 로그인 타입이 세션로그인인지 확인하는 절차. passwordEncoder 단방향 암호화
		if(loginUser != null && passwordEncoder.matches(user.getPassword(), loginUser.getPassword()) && user.getLoginType().equals("1")) {
			model.addAttribute("loginUser",loginUser); // 리퀘스트 스코프에 세션에 담아줌
			System.out.println("로그인성공");
			
			mv.setViewName("redirect:" + "/");
			
		}else {
			System.out.println("로그인실패");
			mv.addObject("errorMsg","로그인 실패");
			mv.setViewName("redirect:" + "/login");
			
		}
		return mv;
		
		
	}
	@PostMapping("singup.me")		// 회원가입
	public String insertUser(
			User user, 
			Model model,
			HttpSession session
			) {
		// 암호화 작업 해야함
		// String encPwd = bCryptPasswordEncoder.encode(m.getPassword());
		// m.setUserPassword(encPwd);
		String encPwd = passwordEncoder.encode(user.getPassword());
		user.setPassword(encPwd);
		
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
	
	@ResponseBody // 비동기 요청시 필요
	@GetMapping("/idcheck")			// 아이디 유효성 검사
	public String idCheck(String email) {
	    // 유효성 검사
	    if (!isValidEmail(email)) {
	        return "INVALID_EMAIL";
	    }

	    int result = userService.idCheck(email);
	    return result + "";
	}

	// 이메일 유효성 검사 메서드
	private boolean isValidEmail(String email) {
	    // 이메일이 null이거나 공백인 경우 유효하지 않음
	    if (email == null || email.isBlank()) {
	        return false;
	    }

	    // 정규 표현식을 사용하여 이메일 형식을 검증
	    String regex = "^[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z]{2,}$";
	    return email.matches(regex);
	}
	
	@GetMapping("/idfind")
	public String idfind() {
		return "forward:/gunjsp/usersumfind.jsp";
	}
	@GetMapping("/passwordfind")
	public String passwordfind() {
		return "forward:/gunjsp/usersumfind.jsp";
	}
	
	@PostMapping("idfind.me")	// 아이디 찾기
	public String idfind(
			User user, 
			Model model,
			HttpSession session
			) {
		
		String name = user.getUserName();
		String phone = user.getPhone();
		
		User user1 = userService.idfind(name, phone);
		
		String url = "";
		if(user1 != null) {
			session.setAttribute("alertMsg", "아이디 찾기 성공");	
			session.setAttribute("idfind", user1);
			
			url = "redirect:/gunjsp/useridfind.jsp";	// 아이디 찾으면 세션스코프에 저장 후 useridfind에 보여준다.
		}else {
		model.addAttribute("errorMsg","아이디 찾기 실패");
		
		System.out.println("아이디 찾기실패");
		url = "redirect:/gunjsp/usersumfind.jsp";
		}
		return url;
	}
	
	@PostMapping("pwdfind.me") // 비밀번호 찾기
	public String pwdfind(
			User user, 
			Model model,
			HttpSession session
			) {
		// 암호화 작업 해야함
		// String encPwd = bCryptPasswordEncoder.encode(m.getPassword());
		// m.setUserPassword(encPwd);
		
		String email = user.getEmail();
		String phone = user.getPhone();
		
		User user1 = userService.pwdfind(email, phone);
		
		String url = "";
		if(user1 != null) { // user1이 null이 아니면 비밀번호 찾기 성공 
			session.setAttribute("alertMsg", "비밀번호 찾기 성공");	
			session.setAttribute("pwdemail", email);
			url = "redirect:/gunjsp/repassword.jsp";		// 후에 repassword.jsp 리다이렉트
		}else {
		model.addAttribute("errorMsg","아이디 찾기 실패");
		}
		return url;
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
	        return "redirect:/gunjsp/pwdfind.jsp"; // 비밀번호 찾기 페이지로 리다이렉트
	    }
	    
	    String password1 = user.getPassword();
	    String ConfirmPassword = user.getConfirmPassword();

	    if (!password1.equals(ConfirmPassword)) { // 비밀번호가 일치하지 않을 경우 처리
	        session.setAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
	        
	        System.out.println("패스워드가 일치하지 않습니다.");
	        return "redirect:/gunjsp/repassword.jsp"; // 비밀번호 재설정 페이지로 리다이렉트
	    }
	    
	    String password = passwordEncoder.encode(password1);
	    int result = userService.repassword(password, email);

	    if (result > 0) {
	        session.setAttribute("alertMsg", "비밀번호 변경 성공");
	        return "redirect:" + "/login";  // 비밀번호 변경 성공 시 로그인 페이지로 리다이렉트
	    } else {
	        // 비밀번호 변경 실패 시 처리
	        session.setAttribute("errorMsg", "비밀번호 변경 실패");
	        return "redirect:/gunjsp/repassword.jsp"; // 비밀번호 재설정 페이지로 리다이렉트
	    }
	}
}


