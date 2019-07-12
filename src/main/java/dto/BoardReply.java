package dto;

import java.util.Date;

public class BoardReply {
	private int reply_idx;
	private int board_idx;
	private int member_idx;
	private String reply;
	private Date writtendate;
	
	@Override
	public String toString() {
		return "BoardReply [reply_idx=" + reply_idx + ", board_idx=" + board_idx + ", member_idx=" + member_idx
				+ ", reply=" + reply + ", writtendate=" + writtendate + "]";
	}

	public int getReply_idx() {
		return reply_idx;
	}

	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}

	public int getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
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
