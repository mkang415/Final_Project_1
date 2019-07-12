package dto;

import java.util.Date;

public class Ledger {
	private int ledger_idx;
	private int member_idx;
	private String item;
	private int cost;
	private Date writtendate;
	@Override
	public String toString() {
		return "Ledger [ledger_idx=" + ledger_idx + ", member_idx=" + member_idx + ", item=" + item + ", cost=" + cost
				+ ", writtendate=" + writtendate + "]";
	}
	public int getLedger_idx() {
		return ledger_idx;
	}
	public void setLedger_idx(int ledger_idx) {
		this.ledger_idx = ledger_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public Date getWrittendate() {
		return writtendate;
	}
	public void setWrittendate(Date writtendate) {
		this.writtendate = writtendate;
	}
	
}
