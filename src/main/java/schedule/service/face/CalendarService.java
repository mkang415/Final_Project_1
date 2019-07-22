package schedule.service.face;

import java.util.List;

import dto.CalendarDto;

public interface CalendarService {

	public List<CalendarDto> getCalendarList(CalendarDto caldto);

	public boolean calWrite(CalendarDto dto);
	
	public CalendarDto calDetail(int calendar_idx);

}
