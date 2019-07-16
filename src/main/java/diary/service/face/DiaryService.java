package diary.service.face;

import java.util.List;

import dto.Diary;

public interface DiaryService {

	public List<Diary> getDiaries(String id);
	
	public int getUserIdx(String id);

}
