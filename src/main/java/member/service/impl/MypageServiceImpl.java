package member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.Diary;
import member.dao.face.MypageDao;
import member.service.face.MypageService;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired MypageDao mypageDao;
	
	
	@Override
	public Diary diaryView(Diary viewDiary) {
		return mypageDao.selectDiaryBydiary_idx(viewDiary);
	}

}
