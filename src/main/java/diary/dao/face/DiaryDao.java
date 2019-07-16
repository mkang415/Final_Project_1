package diary.dao.face;

import java.util.List;

import dto.Diary;

public interface DiaryDao {

	public int getMemberIdxById(String id);
	
	public List<Diary> getDiaryList(int member_idx);

}
