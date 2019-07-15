package dto;

import java.util.Date;

public class Member {
	private int member_idx;
	private String email;
	private String pw;
	private String nickname;
	private int memberClass;
	private Date joindate;
	private String auth_key;
	private int auth_status;
	
	
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

	public String getAuth_key() {
		return auth_key;
	}
	public void setAuth_key(String auth_key) {
		this.auth_key = auth_key;
	}
	public int getAuth_status() {
		return auth_status;
	}
	public void setAuth_status(int auth_status) {
		this.auth_status = auth_status;
	}
	
	
}
