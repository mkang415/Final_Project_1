package dto;

import java.util.Date;

public class CalendarDto {
	private int calendar_idx; //
	private int member_idx; //회원인덱스?
	private String title;	//제목
	private String content;	//내용
	private String rdate; //일정날짜
	private Date wdate; //작성일날짜
	
	public CalendarDto() {}
	
	
	

	@Override
	public String toString() {
		return "CalendarDto [calendar_idx=" + calendar_idx + ", member_idx=" + member_idx + ", title=" + title
				+ ", content=" + content + ", rdate=" + rdate + ", wdate=" + wdate + "]";
	}




	public int getCalendar_idx() {
		return calendar_idx;
	}


	public void setCalendar_idx(int calendar_idx) {
		this.calendar_idx = calendar_idx;
	}


	public int getMember_idx() {
		return member_idx;
	}


	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}




	public String getRdate() {
		return rdate;
	}




	public void setRdate(String rdate) {
		this.rdate = rdate;
	}




	public Date getWdate() {
		return wdate;
	}




	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}




	public CalendarDto(int calendar_idx, int member_idx, String title,
			String content, String rdate, Date wdate) {
		super();
		this.calendar_idx = calendar_idx;
		this.member_idx = member_idx;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
		this.wdate = wdate;
	}
	
	public CalendarDto(int calendar_idx, int member_idx, String title, String content, String rdate) {
		super();
		this.calendar_idx = calendar_idx;
		this.member_idx = member_idx;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
	}



	public CalendarDto( int member_idx, String rdate) {
		super();
		this.member_idx = member_idx;
		this.rdate = rdate;
	}
	
}