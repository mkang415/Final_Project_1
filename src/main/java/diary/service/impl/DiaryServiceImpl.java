package diary.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import diary.dao.face.DiaryDao;
import diary.service.face.DiaryService;
import dto.Diary;

@Service
public class DiaryServiceImpl implements DiaryService{
	
	@Autowired DiaryDao diaryDao;

	@Override
	public Diary test() {
		
		return diaryDao.test();
	}
}
