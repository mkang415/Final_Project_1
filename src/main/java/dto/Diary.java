package dto;

import java.util.Date;

public class Diary {
	private int diary_idx;
	private String title;
	private String content;
	private int member_idx;
	private Date writtendate;
	@Override
	public String toString() {
		return "Diary [diary_idx=" + diary_idx + ", title=" + title + ", content=" + content + ", member_idx="
				+ member_idx + ", writtendate=" + writtendate + "]";
	}
	public int getDiary_idx() {
		return diary_idx;
	}
	public void setDiary_idx(int diary_idx) {
		this.diary_idx = diary_idx;
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
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public Date getWrittendate() {
		return writtendate;
	}
	public void setWrittendate(Date writtendate) {
		this.writtendate = writtendate;
	}
	
}
