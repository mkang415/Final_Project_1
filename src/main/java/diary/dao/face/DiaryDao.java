package diary.dao.face;

import java.util.List;
import java.util.Map;

import dto.Diary;
import dto.DiaryFile;

public interface DiaryDao {

	public int selectCntAll(int member_idx);
	
	public int getMemberIdxById(String id);
	
	public List<Diary> getDiaryList(Map<String, Object> map);

	public void insertDiary(Map<String, Object> map);
	
	public void insertFileForSummernote(DiaryFile diaryFile);
}
