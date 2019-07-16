package diary.service.face;

import java.util.List;

import dto.Diary;
import util.DiaryPaging;

public interface DiaryService {

	public DiaryPaging getCurPage(String param);
	
	public List<Diary> getDiaries(String id, DiaryPaging paging);
	
	public int getUserIdx(String id);

}
