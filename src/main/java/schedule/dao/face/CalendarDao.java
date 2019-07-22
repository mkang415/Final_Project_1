package schedule.dao.face;

import java.util.List;

import dto.CalendarDto;

public interface CalendarDao {

	//일정
	List<CalendarDto> getCalendarList(CalendarDto caldto);
	
	boolean addCalendar(CalendarDto cal);

	//일정 추가
	boolean calWrite(CalendarDto dto);
	
	//일정보기
	CalendarDto calDetail(int calendar_idx);

	


}
