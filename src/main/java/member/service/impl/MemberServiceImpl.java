package member.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import dto.MailUtils;
import dto.Member;
import dto.TempKey;
import member.dao.face.MemberDao;
import member.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired private JavaMailSender mailSender;
	@Autowired MemberDao memberDao;

	@Override
	public Member test() {
		
		return memberDao.test();
	}

	@Override
	public boolean login(Member member) {
		//�α��� ������ Count�� ����� 0���� ũ�� �α��� ����
		if( memberDao.selectCntLogin(member) > 0) {
			return true;
			
		}
		
		return false;

	}

	@Override
	public Member getMemberInfo(HttpSession session) {
		String userid = (String)session.getAttribute("loginEmail");
		
		Member member= new Member();
		
		member = memberDao.selectMemberbyMemberId(userid);
		
		return member;
	}

	@Override
	public void insertMember(Member member) throws Exception {
		memberDao.insert(member);
		
		// ������ authkey ����
		String authkey = new TempKey().getKey(50, false);

		member.setAuth_key(authkey);
		memberDao.updateAuthkey(member);

		// mail �ۼ� ���� 
		MailUtils sendMail = new MailUtils(mailSender);
		
		sendMail.setSubject("ȸ������ �̸��� ����");
		sendMail.setText(new StringBuffer().append("<h1>[�̸��� ����]</h1>")
				.append("<p>�Ʒ� ��ũ�� Ŭ���Ͻø� �̸��� ������ �Ϸ�˴ϴ�.</p>")
				.append("<a href='http://localhost:8088/member/joinConfirm?auth_key='")
				.append(authkey)
				.append(">�̸��� ���� Ȯ��</a>")
				.toString());
		sendMail.setFrom("figh202@gmail.com", "jaehyun");
		sendMail.setTo(member.getEmail());
		sendMail.send();

	}

	@Override
	public void updateAuth_status(Member member) {
			memberDao.updateAuth_status(member);
	}

	

	
}		


