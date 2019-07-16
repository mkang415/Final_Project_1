package diary.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import diary.dao.face.DiaryDao;
import diary.service.face.DiaryService;
import dto.Diary;

@Service
public class DiaryServiceImpl implements DiaryService{
	
	@Autowired DiaryDao diaryDao;
	@Autowired DiaryService diaryService;

	@Override
	public List<Diary> getDiaries(String id) {
		
		int member_idx = diaryService.getUserIdx(id);
		
		List<Diary> diaryList = diaryDao.getDiaryList(member_idx);
		
		System.out.println(diaryList.toString());
		
		return diaryList;
	}

	@Override
	public int getUserIdx(String id) {
		int member_idx = diaryDao.getMemberIdxById(id);
		return member_idx;
	}


}
