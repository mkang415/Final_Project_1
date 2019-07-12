package dto;

import java.util.Date;

public class Member {
	private int member_idx;
	private String email;
	private String pw;
	private String nickname;
	private int memberClass;
	private Date joindate;
	@Override
	public String toString() {
		return "Member [member_idx=" + member_idx + ", email=" + email + ", pw=" + pw + ", nickname=" + nickname
				+ ", memberClass=" + memberClass + ", joindate=" + joindate + "]";
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getMemberClass() {
		return memberClass;
	}
	public void setMemberClass(int memberClass) {
		this.memberClass = memberClass;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	
}
