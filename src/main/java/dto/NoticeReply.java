package dto;

import java.util.Date;

public class NoticeReply {
	private int reply_idx;
	private int notice_idx;
	private int member_idx;
	private String reply;
	private Date writtendate;
	@Override
	public String toString() {
		return "NoticeReply [reply_idx=" + reply_idx + ", notice_idx=" + notice_idx + ", member_idx=" + member_idx
				+ ", reply=" + reply + ", writtendate=" + writtendate + "]";
	}
	public int getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public Date getWrittendate() {
		return writtendate;
	}
	public void setWrittendate(Date writtendate) {
		this.writtendate = writtendate;
	}
	
}
