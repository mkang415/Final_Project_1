package dto;

import java.util.Date;

public class Vote {
	private int vote_idx;
	private String title;
	private String explain;
	private int member_idx;
	private int poll1;
	private int poll2;
	private int poll3;
	private int poll4;
	private int poll5;
	private int poll6;
	private int poll7;
	private int poll8;
	private int poll9;
	private int poll10;
	private int hit;
	private Date votedate;
	private Date writtendate;
	@Override
	public String toString() {
		return "Vote [vote_idx=" + vote_idx + ", title=" + title + ", explain=" + explain + ", member_idx=" + member_idx
				+ ", poll1=" + poll1 + ", poll2=" + poll2 + ", poll3=" + poll3 + ", poll4=" + poll4 + ", poll5=" + poll5
				+ ", poll6=" + poll6 + ", poll7=" + poll7 + ", poll8=" + poll8 + ", poll9=" + poll9 + ", poll10="
				+ poll10 + ", hit=" + hit + ", votedate=" + votedate + ", writtendate=" + writtendate + "]";
	}
	public int getVote_idx() {
		return vote_idx;
	}
	public void setVote_idx(int vote_idx) {
		this.vote_idx = vote_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getPoll1() {
		return poll1;
	}
	public void setPoll1(int poll1) {
		this.poll1 = poll1;
	}
	public int getPoll2() {
		return poll2;
	}
	public void setPoll2(int poll2) {
		this.poll2 = poll2;
	}
	public int getPoll3() {
		return poll3;
	}
	public void setPoll3(int poll3) {
		this.poll3 = poll3;
	}
	public int getPoll4() {
		return poll4;
	}
	public void setPoll4(int poll4) {
		this.poll4 = poll4;
	}
	public int getPoll5() {
		return poll5;
	}
	public void setPoll5(int poll5) {
		this.poll5 = poll5;
	}
	public int getPoll6() {
		return poll6;
	}
	public void setPoll6(int poll6) {
		this.poll6 = poll6;
	}
	public int getPoll7() {
		return poll7;
	}
	public void setPoll7(int poll7) {
		this.poll7 = poll7;
	}
	public int getPoll8() {
		return poll8;
	}
	public void setPoll8(int poll8) {
		this.poll8 = poll8;
	}
	public int getPoll9() {
		return poll9;
	}
	public void setPoll9(int poll9) {
		this.poll9 = poll9;
	}
	public int getPoll10() {
		return poll10;
	}
	public void setPoll10(int poll10) {
		this.poll10 = poll10;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getVotedate() {
		return votedate;
	}
	public void setVotedate(Date votedate) {
		this.votedate = votedate;
	}
	public Date getWrittendate() {
		return writtendate;
	}
	public void setWrittendate(Date writtendate) {
		this.writtendate = writtendate;
	}
	
	
}
