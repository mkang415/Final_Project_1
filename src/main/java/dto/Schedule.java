package dto;

import java.util.Date;

public class Schedule {
	private int schedule_idx;
	private String title;
	private String content;
	private String member_idx;
	private Date startdate;
	private Date enddate;
	@Override
	public String toString() {
		return "Schedule [schedule_idx=" + schedule_idx + ", title=" + title + ", content=" + content + ", member_idx="
				+ member_idx + ", startdate=" + startdate + ", enddate=" + enddate + "]";
	}
	public int getSchedule_idx() {
		return schedule_idx;
	}
	public void setSchedule_idx(int schedule_idx) {
		this.schedule_idx = schedule_idx;
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
	public String getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	
}
