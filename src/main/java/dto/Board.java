package dto;

import java.util.Date;

public class Board {
	private int board_idx;
	private String title;
	private String content;
	private int member_idx;
	private int hit;
	private int recommend;
	private int divide;
	private Date writtendate;
	
	@Override
	public String toString() {
		return "Board [board_idx=" + board_idx + ", title=" + title + ", content=" + content + ", member_idx="
				+ member_idx + ", hit=" + hit + ", recommend=" + recommend + ", divide=" + divide + ", writtendate="
				+ writtendate + "]";
	}
	
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
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
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public int getDivide() {
		return divide;
	}
	public void setDivide(int divide) {
		this.divide = divide;
	}
	public Date getWrittendate() {
		return writtendate;
	}
	public void setWrittendate(Date writtendate) {
		this.writtendate = writtendate;
	}
		
}
