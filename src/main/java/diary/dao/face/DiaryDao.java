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
	
	public int selectCntDiaryFile();
	
	public void updateDiaryFileIdx(int diary_idx);
	
	public int selectMaxDiaryIdx();
	
	public void deleteDiary(int diary_idx);

	public void deleteDiaryFile(int diary_idx);
	
	public Diary getDiary(int diary_idx);
	
	public void updateDiary(Map<String, Object> map);
}
