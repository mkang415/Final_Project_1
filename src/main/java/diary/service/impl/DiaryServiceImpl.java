package diary.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import diary.dao.face.DiaryDao;
import diary.service.face.DiaryService;
import dto.Diary;
import dto.DiaryFile;
import util.DiaryPaging;

@Service
public class DiaryServiceImpl implements DiaryService{
	
	@Autowired DiaryDao diaryDao;
	@Autowired DiaryService diaryService;

	@Override
	public DiaryPaging getCurPage(int member_idx, String param) {

		int curPage = 0;
		
		if(!"".equals(param)&&param!=null) {
			curPage = Integer.parseInt(param);
		}
		
		// 전체 게시글 수
		int totalCount = diaryDao.selectCntAll(member_idx);

		// 페이징 객체 생성
		DiaryPaging paging = new DiaryPaging(totalCount, curPage);
		System.out.println(paging); // test

		return paging;
		
	}
	
	@Override
	public List<Diary> getDiaries(int member_idx, DiaryPaging paging) {
		
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("member_idx", member_idx);
		map.put("paging", paging);
		
		List<Diary> diaryList = diaryDao.getDiaryList(map);
		
//		System.out.println(diaryList.toString())
		
		return diaryList;
	}

	@Override
	public int getMemberIdx(String id) {
		int member_idx = diaryDao.getMemberIdxById(id);
		return member_idx;
	}

	@Override
	public void insertDiary(int member_idx, Diary diary) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("member_idx", member_idx);
		map.put("diary", diary);
		
		diaryDao.insertDiary(map);
		
	}

	@Override
	public String fileUploadForSummernote(int member_idx, int diary_idx, MultipartFile file, ServletContext context) {

		//파일이 저장될 경로
		String storedPath = context.getRealPath("resources/diaryFiles");
		
		//UUID
		String uId = UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일의 이름 (원본이름 + UUID)
		String name = uId+"_"+file.getOriginalFilename();

		
		//저장될 파일 객체
		File dest = new File(storedPath, name);
		
		
		//파일 저장
		try {
			file.transferTo(dest); //실제 저장
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		//DB에 저장 (업로드 정보 기록)
		DiaryFile diaryFile = new DiaryFile();
		diaryFile.setDiary_idx(diary_idx);
		diaryFile.setOriginname(file.getOriginalFilename());
		diaryFile.setStorename(name);
		diaryFile.setFilesize(file.getSize());
		
		diaryDao.insertFileForSummernote(diaryFile);
		
		return diaryFile.getStorename();
		
	}






}
