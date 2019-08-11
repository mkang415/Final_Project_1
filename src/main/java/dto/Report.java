package dto;

import java.util.Date;

public class Report {
	private int report_idx;
	private String content;
	private int member_idx;
	private String nickname;
	private String title;
	private int viewcheck;
	private Date writtendate;
	private int board_idx;
	
	@Override
	public String toString() {
		return "Report [report_idx=" + report_idx + ", content=" + content + ", member_idx=" + member_idx
				+ ", nickname=" + nickname + ", title=" + title + ", viewcheck=" + viewcheck + ", writtendate="
				+ writtendate + ", board_idx=" + board_idx+"]";
	}


  public int getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
  
	public int getReport_idx() {
		return report_idx;
	}

	public void setReport_idx(int report_idx) {
		this.report_idx = report_idx;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getViewcheck() {
		return viewcheck;
	}

	public void setViewcheck(int viewcheck) {
		this.viewcheck = viewcheck;
	}

	public Date getWrittendate() {
		return writtendate;
	}

	public void setWrittendate(Date writtendate) {
		this.writtendate = writtendate;
	}
	
	
	
	
	
	
}
