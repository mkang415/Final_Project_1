package member.dao.face;


import dto.Diary;
import dto.Member;

public interface MypageDao {

	public Diary selectDiaryBydiary_idx(Diary viewDiary);

	public void delete(Member member_idx);

	public void upinfo(Member dto);


	

}
