package com.kh.hope;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hope.board.model.vo.Board;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.main.model.service.MainService;
import com.kh.hope.main.model.vo.MainTotal;

import jakarta.servlet.ServletContext;

@Controller
public class HomeController {
	
	
	@Autowired
	private MainService mainService;
	
	
	
	@Autowired
	private ServletContext application;
	
	// 날짜를 원하는 포맷으로 변환하는 메소드
	private String formatDate(Date date, String pattern) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
	    return dateFormat.format(date);
	}
	
	@GetMapping("/")
	public String selectAll(Model m,
			@RequestParam Map<String, Object> map) {
		
		
		// 최신 공지사항 5개 list
		List<Board> noticeList = mainService.selectNoticeList5(map);
		m.addAttribute("noticeList", noticeList);
		
		// 현재 날짜
		Calendar calendar = Calendar.getInstance();
		Date currentDate = calendar.getTime();
		
		m.addAttribute("currentDate", currentDate);
		// 7일을 뺍니다.
		calendar.add(Calendar.DATE, -7);

		// 결과를 Date 객체로 가져옴
		Date sevenDaysAgo = calendar.getTime();

		// 포맷을 지정
		String pattern = "yyyy-MM-dd";
		// 포맷을 적용하여 sevenDaysAgo를 문자열로 변환
		String formattedSevenDaysAgo = formatDate(sevenDaysAgo, pattern);

		m.addAttribute("sevenDaysAgo", formattedSevenDaysAgo);
		
		// 나눔소식 List
		List<Board> shareList = mainService.selectShareListTop(map);
		
		m.addAttribute("shareList", shareList);
		
		// 후원 마감 랜덤값
		Donate donate = mainService.selectDonateEnd();
		
		m.addAttribute("donate", donate);
		
		// 후원 리스트
		List<Donate> donateList = mainService.selectDonateList(map);
		
		m.addAttribute("donateList", donateList);
		
		// 총 후원자 수, 총 봉사지원자 수
		MainTotal total = mainService.selectTotal();
		
		m.addAttribute("total", total);
	    
		return "mainPage";
	}

	@GetMapping("/errorPage")
	public String errorPage() {
		return "common/errorPage";
	}
}
