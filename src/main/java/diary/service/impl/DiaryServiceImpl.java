package diary.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import diary.dao.face.DiaryDao;
import diary.service.face.DiaryService;
import dto.Diary;
import util.DiaryPaging;

@Service
public class DiaryServiceImpl implements DiaryService{
	
	@Autowired DiaryDao diaryDao;
	@Autowired DiaryService diaryService;

	@Override
	public DiaryPaging getCurPage(String param) {

		int curPage = 0;
		
		if(!"".equals(param)&&param!=null) {
			curPage = Integer.parseInt(param);
		}
		
		// 전체 게시글 수
		int totalCount = diaryDao.selectCntAll();

		// 페이징 객체 생성
		DiaryPaging paging = new DiaryPaging(totalCount, curPage);
		System.out.println(paging); // test

		return paging;
		
	}
	
	@Override
	public List<Diary> getDiaries(String id, DiaryPaging paging) {
		
		int member_idx = diaryService.getUserIdx(id);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("member_idx", member_idx);
		map.put("paging", paging);
		
		List<Diary> diaryList = diaryDao.getDiaryList(map);
		
//		System.out.println(diaryList.toString())
		
		return diaryList;
	}

	@Override
	public int getUserIdx(String id) {
		int member_idx = diaryDao.getMemberIdxById(id);
		return member_idx;
	}


}
