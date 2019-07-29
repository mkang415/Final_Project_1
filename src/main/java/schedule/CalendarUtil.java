package schedule;

import java.util.Calendar;
import java.util.List;

import dto.CalendarDto;

public class CalendarUtil {
	
	public CalendarUtil() {
		
	}
	
	//nvl 함수
	//null값 또는 공백은 잘라낸다
	public boolean nvl(String msg) {
		return msg == null || msg.trim().equals("")?true:false;
	}
	
	// 날짜를 클릭하면 그날 일정이 모두 보이는 caldetail로 이동
	
//	public String caldetail(int year, int month, int day) {
//		String s = "";
//		s += String.format("<a href='%s?year=%d&month=%d&day=%d'>",
//				"/schedule/caldetail", year, month, day);
//		s += String.format("%2d", day); //2자리
//		s += "</a>";
//		
//		return s;
//	}
	
	public String caldetail(int year, int month, int day) {
		String s = "";
		String url = "/schedule/caldetail";
		
		s = String.format("<a href='%s?year=%d&month=%d&day=%d'></a>", 
				url, year, month, day);
		s += String.format("%2d", day); //2자리
		
		return s;
	}
	
	// 일정추가를 위해 pen이미지를 클릭하면 calwrite.jsp로 이동
	public String showPen(int year, int month, int day) {
		String s = "";
		
		String url="/schedule/calwrite";
		String image = "<img src='/resources/img/pen.jpg'>";
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
		s += "<col width='200'>";
		
		for(CalendarDto dto : list) {
			if(dto.getRdate().substring(0,8).equals(dates)) {
				
				s += "<tr bgcolor='#FFE4B5'>";
				s += "<td>";
				s += "<a href='caldetail?calendar_idx=" + dto.getCalendar_idx() + "'>";
				s += "<font style='font-size:15; color:black'>";
				s += dot3(dto.getTitle());
				s += "</font>";
				s += "</a>";
				s += "</td>";
				s += "</tr>";
				s += "<tr height=\"5px\"><td></td></tr>";
				
			}
		}
		s += "</table>";
		
		return s;
	
	}
	
	
	// 일정제목이 길면 ...처리
	public String dot3(String msg) {
		String s = "";
		if(msg.length() >= 15) {
			s = msg.substring(0,15); //임의로 10글자 까지
			s += "...";
		} else {
			s = msg.trim();
		}
		return s;
	}
	
	//rdate를 위해 사용할 코드들
	public String two(int tt) {
		return (tt+"").length()>1?(tt+""):"0"+tt;
	}
	
	
	public String yyyymm(int year, int month) {
		return ""+year+two(month);
	}
	
	public String yyyymmdd(int year, int month, int date) {
		return yyyymm(year,month)+two(date);
	}

	


}





























