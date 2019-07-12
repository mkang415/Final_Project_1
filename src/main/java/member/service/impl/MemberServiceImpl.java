package member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.Member;
import member.dao.face.MemberDao;
import member.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired MemberDao memberDao;

	@Override
	public Member test() {
		
		return memberDao.test();
	}
}
