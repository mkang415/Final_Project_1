package schedule.service.face;

import java.util.List;

import dto.CalendarDto;
import util.SchedulePaging;

public interface CalendarService {

	//달력일정
	public List<CalendarDto> getCalendarList(CalendarDto dto);

	//일정쓰기
	public boolean calWrite(CalendarDto dto);
	
	//일정 보기
	public CalendarDto calDetail(CalendarDto detail);

	//일정 수정
	public void calupdate(CalendarDto dto);

	//일정 삭제
	public void caldel(CalendarDto dto);

	//게시글 전체 조회
	public List getList();
	
	//게시글 전체 수 조회
	public int getTotal();
	
	//게시글 전체 수 조회
	public int getTotal(SchedulePaging search);

	//선택된 페이지에 알맞는 게시글 리스트 조회
	public List getSchedulePagingList(SchedulePaging paging);
	
	//검색 결과에 페이징 처리한 게시글 목록
	public List getSearchPagingList(SchedulePaging search);



}
