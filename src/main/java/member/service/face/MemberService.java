package member.service.face;

import javax.servlet.http.HttpSession;

import dto.Member;

public interface MemberService {

	Member test();

	public boolean login(Member member);

	public Member getMemberInfo(HttpSession session);

	public void insertMember(Member member) throws Exception;

	public void updateAuth_status(Member member);



}
