package schedule.service.face;

import java.util.List;

import dto.CalendarDto;

public interface CalendarService {

	public List<CalendarDto> getCalendarList(CalendarDto dto);

	public boolean calWrite(CalendarDto dto);

	
	public CalendarDto calDetail(int calendar_idx);

	public boolean calDelete(int calendar_idx);

//	public CalendarDto calview(CalendarDto viewcal);

}
