package admin.dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.Board;
import dto.Member;
import util.AdminBoardPaging;
import util.AdminMemberPaging;

public interface AdminDao {

	int selectCntAll();
	// 게시글 목록

	List<HashMap<String, Object>> selectAll(AdminBoardPaging ABP);
	// 게시글 리스트 페이징

	Board select(int board_idx);
	// 게시글 상세보기

	int selectCntAll2();
	// 회원 목록

	List<HashMap<String, Object>> selectAll2(AdminMemberPaging AMP);
	// 회원 목록 리스트 페이징

	Member select2(int member_idx);
	// 회원정보 상세보기

	int selectCntAll3(int member_idx);
	// 회원정보 상세보기 목록
	
	List<HashMap<String, Object>> selectAll3(Map<String, Object> map);
	// 회원정보 상세보기 리스트 페이징
	

}
