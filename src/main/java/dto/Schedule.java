package dto;

import java.util.Date;

public class Schedule {
	private int schedule_idx; //
	private String member_idx; //회원인덱스?
	private String title;	//제목
	private String content;	//내용
	private String rdate; //일정날짜
	private Date wdate; //작성일날짜
	
	public Schedule() {
		
	}
	
	
	public int getSchedule_idx() {
		return schedule_idx;
	}

	public void setSchedule_idx(int schedule_idx) {
		this.schedule_idx = schedule_idx;
	}

	public String getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(String member_idx) {
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




	@Override
	public String toString() {
		return "Schedule [schedule_idx=" + schedule_idx + ", member_idx=" + member_idx + ", title=" + title
				+ ", content=" + content + ", rdate=" + rdate + ", wdate=" + wdate + "]";
	}

	public Schedule(int schedule_idx, String member_idx, String title,
			String content, String rdate, Date wdate) {
		super();
		this.schedule_idx = schedule_idx;
		this.member_idx = member_idx;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
		this.wdate = wdate;
	}
	
	public Schedule(int schedule_idx, String member_idx, String title, String content, String rdate) {
		super();
		this.schedule_idx = schedule_idx;
		this.member_idx = member_idx;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
	}

	public Schedule(String member_idx, String rdate) {
		super();
		this.member_idx = member_idx;
		this.rdate = rdate;
	}
	
	
}