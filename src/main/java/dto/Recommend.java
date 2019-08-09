package dto;

public class Recommend {

	private int recommend_idx;
	private int member_idx;
	private int board_idx;
	
	@Override
	public String toString() {
		return "Recommend [recommend_idx=" + recommend_idx + ", member_idx=" + member_idx + ", board_idx=" + board_idx
				+ "]";
	}
	
	public int getRecommend_idx() {
		return recommend_idx;
	}
	public void setRecommend_idx(int recommend_idx) {
		this.recommend_idx = recommend_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	
	
}
