package schedule.dao.face;

import java.util.List;

import dto.CalendarDto;

public interface CalendarDao {

	//일정
	public List<CalendarDto> getCalendarList(CalendarDto dto);
	
	public boolean addCalendar(CalendarDto caldto);

	//일정 추가
	public boolean calWrite(CalendarDto dto);
	
	//일정보기
	public CalendarDto calDetail(int calendar_idx);

	//일정 삭제
	public boolean calDelete(int calendar_idx);


//	public CalendarDto selectCalendar_idx(CalendarDto viewcal);


}
