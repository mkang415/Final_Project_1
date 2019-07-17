package dto;

import java.util.Date;

public class Notice {
	private int notice_idx;
	private String title;
	private String content;
	private String writer_email;
	private String writer_nick;
	private int member_idx;
	private int hit;
	private Date writtendate;

	
	@Override
	public String toString() {
		return "Notice [notice_idx=" + notice_idx + ", title=" + title + ", content=" + content + ", writer_email="
				+ writer_email + ", writer_nick=" + writer_nick + ", member_idx=" + member_idx + ", hit=" + hit
				+ ", writtendate=" + writtendate + "]";
	}

	
	
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getWrittendate() {
		return writtendate;
	}
	public void setWrittendate(Date writtendate) {
		this.writtendate = writtendate;
	}



	public String getWriter_email() {
		return writer_email;
	}



	public void setWriter_email(String writer_email) {
		this.writer_email = writer_email;
	}



	public String getWriter_nick() {
		return writer_nick;
	}



	public void setWriter_nick(String writer_nick) {
		this.writer_nick = writer_nick;
	}

	
	
}
