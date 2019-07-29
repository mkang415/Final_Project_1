package schedule.dao.face;

import java.util.List;

import dto.CalendarDto;

public interface CalendarDao {

	//일정
	public List<CalendarDto> getCalendarList(CalendarDto dto);
	

	//일정 추가
	public boolean calWrite(CalendarDto dto);
	
	//일정보기
	public CalendarDto calDetail(CalendarDto detail);

	//일정 삭제
	public void caldel(CalendarDto dto);

	public void calupdate(CalendarDto dto);



}
