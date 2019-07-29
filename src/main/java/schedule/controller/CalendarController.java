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
				
		String yyyymm = util.yyyymm(year, month);
		int member_idx = 1; // member_idx 로 바꾸기 ( 세션 )
		
		//rdate에 넣기
		dto = new CalendarDto(member_idx, yyyymm);
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
			CalendarDto dto,
			HttpSession session,
			HttpServletRequest req
			)throws Exception {
		
		
		//id값 구하기
//		if(req.getSession().getAttribute("login")==null) {
//		return "/login";
//	}
		int member_idx = 1; // member_idx 로 바꾸기 ( 세션 )
		
		CalendarUtil util = new CalendarUtil();
		
		int year = Integer.parseInt(req.getParameter("year"));
		int month = Integer.parseInt(req.getParameter("month"));
		int day = Integer.parseInt(req.getParameter("day"));
		
		String yyyymmdd = util.yyyymmdd(year, month, day);
		
		logger.info("닐짜 파라미터 확인 : " + year + ", " + month + ", " + day);
		logger.info(dto.toString()); // 날짜 넣기전 
		
		dto.setRdate(yyyymmdd);
		dto.setMember_idx(member_idx);
		
		logger.info(dto.toString()); // 날짜 넣고 난 뒤 
		
		CalendarService.calWrite(dto);
		
		
		return "redirect:/schedule/calendar";
		
		
	}
	
	
	
	
	//제목눌렀을때 일정자세히보기
	@RequestMapping(value = "/schedule/caldetail", method= RequestMethod.GET)
	public String caldetail (
			CalendarDto detail,
			Model model,
			HttpServletRequest req
			) throws Exception {
		
		int calendar_idx = Integer.parseInt(req.getParameter("calendar_idx"));
		logger.info("캘린더idx" + calendar_idx+"");
		
		
		logger.info("서비스넘어감"+detail.getCalendar_idx()+"");
		detail = CalendarService.calDetail(detail);
		
		
		detail.setCalendar_idx(calendar_idx);
		logger.info(detail.toString());
		
		model.addAttribute("detail", detail);
		
		return "/schedule/caldetail";
	}
	
	
	//일정 수정
	@RequestMapping(value = "/schedule/calupdate", method= RequestMethod.GET)
	public String update(
			CalendarDto dto,
			HttpSession session,
			Model model
			) {
		
		dto = CalendarService.calDetail(dto);
		
		model.addAttribute("detail", dto);
		
				return "schedule/calupdate";
	}
	
	@RequestMapping (value = "/schedule/calupdate", method=RequestMethod.POST)
	public String updateProc (CalendarDto dto) {
		CalendarService.calupdate(dto);
		
		return "redirect:/schedule/calendar";
	}
	
	
	
	
	//일정삭제
	@RequestMapping (value = "/schedule/caldel", method= RequestMethod.GET)
	public String caldel(
			Model model,
			CalendarDto dto
			) {
		
		CalendarService.caldel(dto);
		
		model.addAttribute("msg", "게시글 삭제 완료");
		model.addAttribute("url", "/schedule/calendar");
		
		return "redirect:/schedule/calendar";
	}
	
	

}



































