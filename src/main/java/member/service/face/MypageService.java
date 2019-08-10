package member.service.face;



import dto.Diary;
import dto.Member;

public interface MypageService {

	public Diary diaryView(Diary viewDiary);

	public void delete(Member member_idx);

	public void upinfo(Member dto);



}
