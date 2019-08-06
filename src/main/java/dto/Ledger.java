package dto;

import java.util.Date;

public class Ledger {
	private int ledger_idx;
	private int member_idx;
	private String item;
	private int plusM;
	private int minusM;
	private String writtendate;
	
	@Override
	public String toString() {
		return "Ledger [ledger_idx=" + ledger_idx + ", member_idx=" + member_idx + ", item=" + item + ", plusM=" + plusM
				+ ", minusM=" + minusM + ", writtendate=" + writtendate + "]";
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

	public int getPlusM() {
		return plusM;
	}

	public void setPlusM(int plusM) {
		this.plusM = plusM;
	}

	public int getMinusM() {
		return minusM;
	}

	public void setMinusM(int minusM) {
		this.minusM = minusM;
	}

	public String getWrittendate() {
		return writtendate;
	}

	public void setWrittendate(String writtendate) {
		this.writtendate = writtendate;
	}
	
	
	
}
