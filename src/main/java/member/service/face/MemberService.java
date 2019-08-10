package member.service.face;

import javax.servlet.http.HttpSession;

import dto.Member;

public interface MemberService {

	Member test();

	public boolean login(Member member);

	public Member getMemberInfo(HttpSession session);

	public void insertMember(Member member) throws Exception;

	public void updateAuth_status(Member member);

	public void sendCode(Member member) throws Exception;

	public boolean findMember(String code);


	public void update(Member member);

	public boolean pwCheck(Member member);

	



}
