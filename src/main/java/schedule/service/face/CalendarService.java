package schedule.service.face;

import java.util.List;

import dto.CalendarDto;

public interface CalendarService {

	public List<CalendarDto> getCalendarList(CalendarDto dto);

	public boolean calWrite(CalendarDto dto);
	
	public CalendarDto calDetail(CalendarDto detail);

	public boolean calDelete(int calendar_idx);

	public void calupdate(CalendarDto dto);

//	public CalendarDto calview(CalendarDto viewcal);

}
