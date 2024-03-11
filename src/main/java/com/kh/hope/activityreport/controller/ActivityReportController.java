package com.kh.hope.activityreport.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hope.activityreport.model.service.ActivityReportService;
import com.kh.hope.activityreport.model.vo.ActivityReport;
import com.kh.hope.common.Template.model.vo.Pagenation;
import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.donate.model.vo.Donate;
import com.kh.hope.program.model.vo.Program;
import com.kh.hope.user.model.vo.User;

import edu.emory.mathcs.backport.java.util.Arrays;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@SessionAttributes({ "loginUser" })
public class ActivityReportController {
	

	@Autowired
	private ActivityReportService service;
	
	// 활동보고서 페이지
	@GetMapping("/activityreport/P")
	public String ReportList(Model m, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam Map<String, Object> map) {
		int listCount = service.selectListCount(map);
		int pageLimit = 10;
		int boardLimit = 10;

		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		List<ActivityReport> list = service.reportList(pi, map);
		m.addAttribute("list", list);
		m.addAttribute("pi", pi);
		m.addAttribute("param", map);

		return "activityreport/activityreport";
	}
	
	@GetMapping("/activityreport/P/{arno}")
	public String selectActivityReport(@PathVariable("arno") int reportNo, Model m, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) {
		
		ActivityReport ar = service.selectActivityReport(reportNo);


		if (ar != null) {

			int userNo = 0;
			User loginUser = (User) session.getAttribute("loginUser");
			if (loginUser != null) {
				userNo = loginUser.getUserNo();
			}

			if (ar.getUserNo() != userNo) {
				Cookie cookie = null;
				Cookie[] cArr = req.getCookies();
				if (cArr != null && cArr.length > 0) {
					for (Cookie c : cArr) {
						if ("readActivityReportNo".equals(c.getName())) {
							cookie = c;
							break;
						}
					}
				}
				int result = 0;
				if (cookie == null) {
					cookie = new Cookie("readActivityReportNo", reportNo + "");
					result = service.increaseCount(reportNo);

				} else {
					String[] arr = cookie.getValue().split("/");
					List<String> list = Arrays.asList(arr);
					if (list.indexOf(reportNo + "") == -1) {
						result = service.increaseCount(reportNo);
						cookie.setValue(cookie.getValue() + "/" + reportNo);
					}
				}
				if (result > 0) {
					ar.setCount(ar.getCount() + 1);
					cookie.setPath(req.getContextPath());
					cookie.setMaxAge(1 * 60 * 60);
					res.addCookie(cookie);
				}
			}
		} else {
			m.addAttribute("errorMsg", "조회실패");
			return "common/errorPage";
		}
		m.addAttribute("ar", ar);

		return "activityreport/activityreportDetail";
	}
	
	// 활동보고서 작성(봉사활동)
	@GetMapping("/activityreportinsert/P/{programNo}")
	public String showActivityReportForm(@PathVariable int programNo, Model model) {
		// 활동보고서 작성 폼을 보여주는 페이지로 이동
		
		
		Program program = service.selectProgramReport(programNo);
		
		model.addAttribute("program", program);
		
		return "activityreport/activityreportInsert";
	}
	
	@PostMapping("/activityreportinsert/P/{programNo}")
	public String insertActivityReport(
			@PathVariable int programNo,
			ActivityReport activityReport,
			RedirectAttributes ra) {
		

	    // 서비스를 통해 활동 보고서를 DB에 저장
	    int result = service.insertActivityReport(activityReport);
	    int proResult = service.updateProgramReport(programNo); 
	    
	    if(result > 0 && proResult > 0) {
	        // 저장 성공 시 메시지를 리다이렉트한 페이지로 전달
	        ra.addFlashAttribute("alertMsg", "활동 보고서가 성공적으로 저장되었습니다.");
	        return "redirect:/activityreport/P";
	    } else {
	        // 저장 실패 시 메시지를 리다이렉트한 페이지로 전달
	        ra.addFlashAttribute("alertMsg", "활동 보고서 저장에 실패하였습니다. 다시 시도해주세요.");
	        return "redirect:/errorPage";
	    }
	}
	
	// 활동보고서 수정
	@GetMapping("/activityreport/update/P/{reportNo}")
	public String activityreportUpdate(@PathVariable("reportNo") int reportNo, HttpSession session, Model model, HttpServletRequest request) {
		
		ActivityReport ar = service.selectActivityReport(reportNo);

		User loginUser = (User) session.getAttribute("loginUser");
		model.addAttribute("ar", ar);
		
        
		
		if (loginUser.getUserNo() != 1) {
			session.setAttribute("alertMsg", "사용할 수 없는 권한입니다.");
			return "redirect:/activityreport/P";
		}else {
			return "activityreport/activityreportUpdate";
		}
	}
	
	@PostMapping("/activityreport/update/P/{reportNo}")
	public String activityreportUpdate(ActivityReport activityreport, HttpSession session, Model model,RedirectAttributes ra, HttpServletRequest request) {
		
		
		
		int	result = service.updateActivityReport(activityreport);

		
		if(result > 0) {
			
			ra.addFlashAttribute("alertMsg","게시글 수정하는데 성공하였습니다.");
			
			return "redirect:/activityreport/P";
		}else {
			ra.addFlashAttribute("alertMsg","게시글 수정 실패");
			
			return "redirect:/hope/errorPage";
		}
	}
	
	// 활동보고서 삭제
	@GetMapping("/activityreport/delete/P/{reportNo}")
	public String activityreportDelete(@PathVariable("reportNo") int reportNo, Model m, RedirectAttributes ra,
			@ModelAttribute("loginUser") User loginUser, HttpSession session) {

		int result = service.deleteActivityreport(reportNo);
		
		if (loginUser.getUserNo() != 1) {
			ra.addFlashAttribute("alertMsg", "게시글 삭제 권한이 없습니다.");
			return "redirect:/errorPage";
		}
		
		if (result > 0) {
			ra.addFlashAttribute("alertMsg", "게시글 삭제에 성공하였습니다.");

		} else {
			ra.addFlashAttribute("alertMsg", "삭제에 실패하였습니다.");
		}
		return "redirect:/activityreport/P";

	}
	
	
	// =============================== 후원 후기 =================================
	// 활동보고서 페이지
	@GetMapping("/activityreport/D")
	public String reportDonateList(Model m, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam Map<String, Object> map) {
		
		int listCount = service.selectListCount(map);
		int pageLimit = 10;
		int boardLimit = 5;

		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		List<ActivityReport> list = service.reportDonateList(pi, map);
		m.addAttribute("list", list);
		m.addAttribute("pi", pi);
		m.addAttribute("param", map);

		return "activityreport/activityReportDonateList";
	}
	
	
	// 활동보고서 작성(후원후기)
	@GetMapping("/activityreportinsert/D/{donateNo}")
	public String activityDonateForm(@PathVariable int donateNo, Model model,
			@ModelAttribute("loginUser") User loginUser, RedirectAttributes ra) {
		
		
		if (loginUser.getUserNo() != 1) {
			ra.addFlashAttribute("alertMsg", "게시글 등록 권한이 없습니다.");
			return "redirect:/errorPage";
		}
		
		if(loginUser == null) {
			ra.addFlashAttribute("alertMsg", "로그인 후 이용해주세요.");
			return "redirect:/errorPage";
		}
		
		Donate donate = service.selectDonateReport(donateNo);
		
		model.addAttribute("donate", donate);
		
		return "activityreport/activityReportDonateInsert";
	}
	
	@PostMapping("/activityreportinsert/D/{donateNo}")
	public String activityInsertDonateForm(
			@PathVariable int donateNo,
			ActivityReport activityReport,
			RedirectAttributes ra) {
		

	    // 서비스를 통해 활동 보고서를 DB에 저장
	    int result = service.activityInsertDonateForm(activityReport);
	    
	    
	    int donateResult = service.updateDonateReport(donateNo); 
	    
	    if(result > 0 && donateResult > 0) {
	        // 저장 성공 시 메시지를 리다이렉트한 페이지로 전달
	        ra.addFlashAttribute("alertMsg", "후원 후기가 성공적으로 저장되었습니다.");
	        return "redirect:/activityreport/D";
	    } else {
	        // 저장 실패 시 메시지를 리다이렉트한 페이지로 전달
	        ra.addFlashAttribute("alertMsg", "후원 후기 등록에 실패하였습니다. 다시 시도해주세요.");
	        return "redirect:/errorPage";
	    }
	}
	
	// 후원후기 상세페이지
	@GetMapping("/activityreport/D/{arno}")
	public String selectActivityDonateReport(@PathVariable("arno") int reportNo, Model m, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) {
		
		ActivityReport ar = service.selectActivityDonateReport(reportNo);
		
		m.addAttribute("ar", ar);

		return "activityreport/activityReportDonateDetail";
	}
	
	// 후원후기 수정
	@GetMapping("/activityreport/update/D/{reportNo}")
	public String activityReportDonateUpdate(@PathVariable("reportNo") int reportNo, HttpSession session, Model model) {
		
		ActivityReport ar = service.selectActivityDonateReport(reportNo);

		User loginUser = (User) session.getAttribute("loginUser");
		model.addAttribute("ar", ar);
		
		
		if (loginUser.getUserNo() != 1) {
			session.setAttribute("alertMsg", "사용할 수 없는 권한입니다.");
			return "redirect:/activityreport/D";
		}else {
			return "activityreport/activityReportDonateUpdate";
		}
	}
	
	@PostMapping("/activityreport/update/D/{reportNo}")
	public String activityReportDonateUpdate(ActivityReport activityreport, HttpSession session, Model model,RedirectAttributes ra) {
		
		
		int	result = service.activityReportDonateUpdate(activityreport);

		
		if(result > 0) {
			
			ra.addFlashAttribute("alertMsg","게시글 수정하는데 성공하였습니다.");
			
			return "redirect:/activityreport/D";
		}else {
			ra.addFlashAttribute("alertMsg","게시글 수정 실패");
			
			return "redirect:/hope/errorPage";
		}
	}
	
	
	// 후원후기 삭제
	@GetMapping("/activityreport/delete/D/{reportNo}")
	public String activityㄲeportDonateDelete(@PathVariable("reportNo") int reportNo, Model m, RedirectAttributes ra,
			@ModelAttribute("loginUser") User loginUser, HttpSession session) {

		int result = service.deleteDonateActivityreport(reportNo);
		
		if (loginUser.getUserNo() != 1) {
			ra.addFlashAttribute("alertMsg", "게시글 삭제 권한이 없습니다.");
			return "redirect:/errorPage";
		}
		
		if (result > 0) {
			ra.addFlashAttribute("alertMsg", "게시글 삭제에 성공하였습니다.");

		} else {
			ra.addFlashAttribute("alertMsg", "삭제에 실패하였습니다.");
		}
		return "redirect:/activityreport/D";

	}
	
}