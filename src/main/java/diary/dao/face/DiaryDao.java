package diary.dao.face;

import java.util.List;
import java.util.Map;

import dto.Diary;

public interface DiaryDao {

	public int selectCntAll();
	
	public int getMemberIdxById(String id);
	
	public List<Diary> getDiaryList(Map<String, Object> map);

}
