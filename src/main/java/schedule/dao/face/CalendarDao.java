package schedule.dao.face;

import java.util.List;

import dto.CalendarDto;
import util.SchedulePaging;

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

	//게시글 전체 조회
	public List selectAll();

	//게시글 전체 수
	public int countAll();

	//페이지 게시글 조회
	public int countSearch(SchedulePaging search);

	//검색어 적용한 게시글 수
	public List selectPage(SchedulePaging paging);

	//검색어 적용한 게시글 목록 조회
	public List selectPageSearch(SchedulePaging search);



}
