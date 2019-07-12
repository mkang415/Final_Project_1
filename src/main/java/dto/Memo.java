package dto;

import java.util.Date;

public class Memo {
	private int memo_idx;
	private String title;
	private String memo;
	private int member_idx;
	private int mark;
	private Date markdate;
	@Override
	public String toString() {
		return "Memo [memo_idx=" + memo_idx + ", title=" + title + ", memo=" + memo + ", member_idx=" + member_idx
				+ ", mark=" + mark + ", markdate=" + markdate + "]";
	}
	public int getMemo_idx() {
		return memo_idx;
	}
	public void setMemo_idx(int memo_idx) {
		this.memo_idx = memo_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getMark() {
		return mark;
	}
	public void setMark(int mark) {
		this.mark = mark;
	}
	public Date getMarkdate() {
		return markdate;
	}
	public void setMarkdate(Date markdate) {
		this.markdate = markdate;
	}
	
}
