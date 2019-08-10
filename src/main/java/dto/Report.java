package dto;

import java.util.Date;

public class Report {
	private int report_idx;
	private String content;
	private int member_idx;
	private Date writtendate;
	private int board_idx;
	
	@Override
	public String toString() {
		return "Report [report_idx=" + report_idx + ", content=" + content + ", member_idx=" + member_idx
				+ ", writtendate=" + writtendate + ", board_idx=" + board_idx + "]";
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
	public Date getWrittendate() {
		return writtendate;
	}
	public void setWrittendate(Date writtendate) {
		this.writtendate = writtendate;
	}
	
}
