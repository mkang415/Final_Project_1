package member.service.impl;

import javax.mail.MessagingException;
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
		// memberClass 가 0 이거나 1일 때 로그인
		Member memberClass = new Member();
		
		
		memberClass = memberDao.selectAuth(member);
		
		if(memberDao.selectCntLogin(member) > 0) {
	
		if(memberClass.getMemberClass()==0 || memberClass.getMemberClass()==1 ) 
		{
			return true;
			
		}
		
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
		
		// 임의의 authkey 생성
		String authkey = new TempKey().getKey(50, false);

		member.setAuth_key(authkey);
		memberDao.updateAuthkey(member);

		// mail 작성 관련 
		MailUtils sendMail = new MailUtils(mailSender);
		
		sendMail.setSubject("회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://localhost:8088/member/joinConfirm?auth_key=")
				.append(member.getAuth_key())
				.append("'>이메일 인증 확인</a>")
				.toString());
		sendMail.setFrom("figh202@gmail.com", "jaehyun");
		sendMail.setTo(member.getEmail());
		sendMail.send();

	}

	@Override
	public void updateAuth_status(Member member) {
			memberDao.updateAuth_status(member);
	}

	@Override
	public void sendCode(Member member) throws Exception {
		// 임의의 authkey 생성
		String authkey = new TempKey().getKey(10, false);

		member.setAuth_key(authkey);
		memberDao.updateAuthkey(member);


		// mail 작성 관련 
		MailUtils sendMail = new MailUtils(mailSender);
		
		sendMail.setSubject("비밀번호찾기 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<h2>인증코드</h2>")
				.append("<h3>")
				.append(member.getAuth_key())
				.append("</h3>")
				.toString());
		sendMail.setFrom("figh202@gmail.com", "jaehyun");
		sendMail.setTo(member.getEmail());
		sendMail.send();

	}

	@Override
	public boolean findMember(String code) {
	
		if(memberDao.selectCntByCode(code) > 0) {
			return true;
		}
		
		else
			return false;
		
	}

	@Override
	public void update(Member member) {
		memberDao.pwUpdate(member);
		
	}

	@Override
	public boolean pwCheck(Member member) {
		
		if(memberDao.pwCheck(member) > 0) {
			return true;
		}
		
		return false;
	}
	

	

	
}		


