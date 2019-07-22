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
			HttpServletRequest req,
			Model model
			) throws Exception {
		
//		logger.info("Controller schedule : " + new Date());
//		logger.info("toString : " + toString());
		
		//id값 구하기
//		if(req.getSession().getAttribute("login")==null) {
//			return "/login";
//		}
		
//		int member_idx = (((Member) req.getSession().getAttribute("login")).getMember_idx());
		
		CalendarUtil util = new CalendarUtil();
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DATE, 1); //1일
		
		String syear = req.getParameter("year");
		String smonth = req.getParameter("month");
		
		int year = cal.get(Calendar.YEAR);
		if(util.nvl(syear) == false){	// 넘어온 파라메터가 있음
			year = Integer.parseInt(syear);
		}
		
		int month = cal.get(Calendar.MONTH) + 1;
		if(util.nvl(smonth) == false){
			month = Integer.parseInt(smonth);
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
		
		String yyyymm = year + "" + month;
		
		//rdate에 넣기
		CalendarDto caldto = new CalendarDto("3", yyyymm);
		
		//DB처리
		List<CalendarDto> list = CalendarService.getCalendarList(caldto);
		
		//얻어온 list보내기
		model.addAttribute("flist", list);
		
		//날짜 정보 보내기(연도, 월)
		model.addAttribute("jcal", cal);
		
		
		
		
		return "/schedule/calendar";
	}
	
	//일정 추가
	@RequestMapping (value = "/schedule/calwrite", method= {RequestMethod.GET, RequestMethod.POST})
	public String calwrite(
			Model model,
			HttpServletRequest req,
			HttpSession session,
			String year,
			String month,
			String day
			) throws Exception {
		
		//id값 구하기
//		if(req.getSession().getAttribute("login")==null) {
//		return "/login";
//	}
		
		
		System.out.println("year : "+ year+", month : "+ month+", day : " + day);
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		
		return "/schedule/calwrite";
	}
	
	
	
	
	
	
	//일정자세히보기
	@RequestMapping(value = "/schedule/caldetail", method= {RequestMethod.GET, RequestMethod.POST})
	public String caldetail (
			Model model,
			int calendar_idx
			) throws Exception {
		
		CalendarDto dto = CalendarService.calDetail(calendar_idx);

		model.addAttribute("dtd", dto);
		
		return "/schedule/caldetail";
	}
	
	
	
	
	
}



































