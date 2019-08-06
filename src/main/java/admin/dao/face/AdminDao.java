package admin.dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.Board;
import dto.Member;
import util.AdminBoardPaging;
import util.AdminMemberBanPaging;
import util.AdminMemberPaging;

public interface AdminDao {

	int selectCntAll();
	
	List<HashMap<String, Object>> selectAll(AdminBoardPaging ABP);

	Board select(int board_idx);
	// 게시글 상세보기
	
	void deleteBoardList(String names);
	// 게시글 리스트에서 게시글 삭제하기
	
	int countSearch(AdminBoardPaging search);
	// 검색어 적용한 게시글 수

	List<HashMap<String, Object>> selectPageSearch(AdminBoardPaging search);
	// 검색어 적용한 게시글 목록 조회

	
	
	int selectCntAll2();
	// 회원 목록

	List<HashMap<String, Object>> selectAll2(AdminMemberPaging AMP);
	// 회원 목록 리스트 페이징

	Member select2(int member_idx);
	// 회원정보 상세보기
	
	

	int selectCntAll3(int member_idx);
	// 회원정보 상세보기 페이징
	
	List<HashMap<String, Object>> selectAll3(Map<String, Object> map);
	// 회원정보 상세보기 리스트 

	void ban(int member_idx);
	// 회원정보 인덱스로 영구정지

	
	
	int selectCntAll4();
	// 회원 벤 영구정지 페이징

	List<HashMap<String, Object>> selectAll4(AdminMemberBanPaging AMBP);
	// 회원 벤 영구정지 리스트

	void noban(int member_idx);
	
	
	
	

}
