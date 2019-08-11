package member.dao.face;

import dto.Member;

public interface MemberDao {

	Member test();

	public int selectCntLogin(Member member);

	public Member selectMemberbyMemberId(String userid);

	public void insert(Member member);

	public void updateAuthkey(Member member);

	public void updateAuth_status(Member member);

	public Member selectAuth(Member member);

	public int selectCntByCode(String code);

	public void pwUpdate(Member member);

	public int pwCheck(Member member);

}
