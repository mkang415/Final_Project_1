package diary.service.face;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import dto.Diary;
import util.DiaryPaging;

public interface DiaryService {

	public DiaryPaging getCurPage(int member_idx, String param);
	
	public List<Diary> getDiaries(int member_idx, DiaryPaging paging);
	
	public int getMemberIdx(String id);
	
	public void insertDiary(int member_idx, Diary diary);
	
	public String fileUploadForSummernote(int member_idx, int diary_idx, MultipartFile file, ServletContext context);

}
