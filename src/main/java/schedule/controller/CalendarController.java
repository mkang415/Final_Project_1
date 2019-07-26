package schedule.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.CalendarDto;
import schedule.CalendarUtil;
import schedule.service.face.CalendarService;

@Controller
public class CalendarController {

	@Autowired CalendarService CalendarService;
	
	public static Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@RequestMapping(value = "/schedule/calendar", method = {RequestMethod.GET, RequestMethod.POST})
	public String schedule (
			HttpSession session,
			HttpServletRequest req,
			Model model,
			CalendarDto dto
			) throws Exception {
		
		//id값 구하기
//		if(req.getSession().getAttribute("login")==null) {
//			return "/login";
//		}
		
//		int member_idx = (((Member) req.getSession().getAttribute("login")).getMember_idx());
		
		CalendarUtil util = new CalendarUtil();
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DATE, 1); //1일
		cal.get(Calendar.YEAR);
		cal.get(Calendar.MONTH);
		
		String syear = req.getParameter("year");
		String smonth = req.getParameter("month");
		String sdate = req.getParameter("date");
		
		int year = cal.get(Calendar.YEAR);
		if(util.nvl(syear) == false){	// 넘어온 파라메터가 있음
			year = Integer.parseInt(syear);
		}
		
		int month = cal.get(Calendar.MONTH) + 1;
		if(util.nvl(smonth) == false){
			month = Integer.parseInt(smonth);
		}
		
		int date = cal.get(Calendar.DATE);
		if(util.nvl(sdate) == false ) {
			date = Integer.parseInt(sdate);
		}
		
		if(month < 1){
			month = 12;
			year--;
		}
		if(month > 12){
			month = 1;
			year++;
		}
		
		cal.set(year, month-1 , 1);
		
		
		
		
		String yyyymm = util.yyyymm(year, month);
		int idx = cal.get(dto.getMember_idx());
		
		//rdate에 넣기
		dto = new CalendarDto(idx, yyyymm);
		logger.info(yyyymm);
		
		//DB처리
		List<CalendarDto> list = CalendarService.getCalendarList(dto);
		
		
		//얻어온 list보내기
		model.addAttribute("list", list);
		
		//날짜 정보 보내기(연도, 월)
		model.addAttribute("jcal", cal);
		
		
		
		
		
		return "/schedule/calendar";
	}
	

	//일정 추가
	@RequestMapping (value = "/schedule/calwrite", method= RequestMethod.GET)
	public void write() {}	
			
	
	@RequestMapping(value = "/schedule/calwrite", method=RequestMethod.POST)
	public String writeproc ( 
			Model model,
			CalendarDto dto,
			HttpSession session,
			String year,
			String month,
			String day
			)throws Exception {
		
		
		//id값 구하기
//		if(req.getSession().getAttribute("login")==null) {
//		return "/login";
//	}
//		logger.info(dto.toString());
		
		CalendarService.calWrite(dto);
		
		System.out.println("year : "+ year+", month : "+ month+", day : " + day);
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
	
		
		return "redirect:/schedule/calendar";
		
		
	}
	
	
	
	
	//일정자세히보기
	@RequestMapping(value = "/schedule/caldetail", method= {RequestMethod.GET, RequestMethod.POST})
	public String caldetail (
			Model model,
			int calendar_idx
			) throws Exception {
		
		CalendarDto dto = CalendarService.calDetail(calendar_idx);

		model.addAttribute("dto", dto);
		
		return "/schedule/caldetail";
	}
	
	
	
	
	
	@RequestMapping (value = "/schedule/caldel", method= {RequestMethod.GET,RequestMethod.POST})
	public String caldel(
			Model model,
			int calendar_idx
			) {
		
		boolean calDelete = CalendarService.calDelete(calendar_idx);
		
		return "/schedule/calendar";
	}
	
	
//	@RequestMapping (value = "/schedule/calview",method=RequestMethod.GET)
//	public String view(
//			CalendarDto viewcal,
//			Model model,
//			HttpSession session
//			) {
//		
//		//calidx가 1보다 작으면 목록으로보내기
//		if(viewcal.getCalendar_idx()<1) {
//		return "redirect:/schedule/calendar";
//		}
//		
//		//게시글 상세 정보 전달
//		viewcal = CalendarService.calview(viewcal);
//		
//		
//		return "/schedule/caldetail";
//		}
}



































