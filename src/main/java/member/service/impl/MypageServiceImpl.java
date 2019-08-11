package member.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.Diary;
import dto.Member;
import member.dao.face.MypageDao;
import member.service.face.MypageService;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired MypageDao mypageDao;
	
	
	@Override
	public Diary diaryView(Diary viewDiary) {
		return mypageDao.selectDiaryBydiary_idx(viewDiary);
	}


	@Override
	public void delete(Member member_idx) {
		member_idx.setEmail(String.valueOf(member_idx.getMember_idx()));
		member_idx.setNickname(String.valueOf(member_idx.getMember_idx()));
		member_idx.setPw(String.valueOf(member_idx.getMember_idx()));
		System.out.println(member_idx.toString());
		mypageDao.delete(member_idx);
	}


	@Override
	public void upinfo(Member dto) {
		
		System.out.println(dto.toString());
		
		mypageDao.upinfo(dto);
	}


}
