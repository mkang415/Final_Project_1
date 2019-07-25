package schedule;

import java.util.Calendar;
import java.util.List;

import dto.CalendarDto;

public class CalendarUtil {
	
	public CalendarUtil() {
		
	}
	
	//nvl 함수
	public boolean nvl(String msg) {
		return msg == null || msg.trim().equals("")?true:false;
	}
	
	// 날짜를 클릭하면 그날 일정이 모두 보이는 caldetail로 이동
	public String caldetail(int year, int month, int day) {
		String s = "";
		s += String.format("<a href='%s?year=%d&month=%d&day=%d'>",
				"/schedule/caldetail", year, month, day);
		s += String.format("%2d", day); //2자리
		s += "</a>";
		
		return s;
	}
	
	// 일정추가를 위해 pen이미지를 클릭하면 calwrite.jsp로 이동
	public String showPen(int year, int month, int day) {
		String s = "";
		
		String url="/schedule/calwrite";
		String image = "<img src='/resources/img/pen.gif'>";
		s = String.format("<a href='%s?year=%d&month=%d&day=%d'>%s</a>", 
				url, year, month, day, image);
		
		return s;
		
	}
	
	// 01, 02, 03 ~ 09 (두글자숫자)
	public String two(String msg) {
		return msg.trim().length()<2?"0"+msg:msg.trim();
	}
	
	//오늘날짜
	public Calendar toCalendar(int year, int month, int day) {
		Calendar cal = Calendar.getInstance();
		cal.set(year, month-1, day);
		return cal;
		
	}
	
	// 각 날짜 별로 테이블 생성
	public String makeTable(int year, int month, int day, List<CalendarDto> list) {
		
		String s = "";
		String dates = (year + "") + two(month + "") + two(day + ""); //2019+07+22 ->20190722
		
		s += "<table>";
		s += "<col width='98'>";
		
		for(CalendarDto dto : list) {
			if(dto.getRdate().substring(0,8).equals(dates)) {
				
				s += "<tr bgcolor='yellow'>";
				s += "<td>";
				
				s += "<a href='caldetail?seq=" + dto.getCalendar_idx() + "'>";
				s += "<font style='font-size:8; color:black'>";
				s += dot3(dto.getTitle());
				s += "</font>";
				s += "</a>";
				s += "</td>";
				s += "</tr>";
			}
		}
	
		s += "</table>";
		return s;
	
	}
	
	
	// 일정제목이 길면 ...처리
	public String dot3(String msg) {
		String s = "";
		if(msg.length() >= 10) {
			s = msg.substring(0,10); //임의로 7글자 까지
			s += "...";
		} else {
			s = msg.trim();
		}
		return s;
	}
	
	


}





























