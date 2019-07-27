package schedule.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.CalendarDto;
import schedule.dao.face.CalendarDao;
import schedule.service.face.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService{
	
	@Autowired CalendarDao calendarDao;

	//일정
	@Override
	public List<CalendarDto> getCalendarList(CalendarDto dto) {
		return calendarDao.getCalendarList(dto);
	}

	//일정 추가
	@Override
	public boolean calWrite(CalendarDto dto) {
		return calendarDao.calWrite(dto);
	}
	
	
	//일정 상세 보기
	@Override
	public CalendarDto calDetail(CalendarDto detail) {
		return calendarDao.calDetail(detail);
	}

	//일정 삭제
	@Override
	public boolean calDelete(int calendar_idx) {
		return false;
	}

	@Override
	public void calupdate(CalendarDto dto) {
		calendarDao.calupdate(dto);
	}

	

	

}
