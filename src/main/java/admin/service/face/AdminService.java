package admin.service.face;

import java.util.HashMap;
import java.util.List;

import dto.Board;
import dto.Member;
import util.AdminBoardPaging;
import util.AdminMemberInfoPaging;
import util.AdminMemberPaging;

public interface AdminService {

	AdminBoardPaging getCurpage(int curPage);
	// 게시판 페이징

	List<HashMap<String, Object>> select(AdminBoardPaging ABP);
	// 게시판 리스트

	Board view(int board_idx);
	// 게시판 상세보기

	AdminMemberPaging getCurpage2(int curPage);
	// 회원목록 페이징

	List<HashMap<String, Object>> select(AdminMemberPaging AMP);
	// 회원 목록 리스트

	Member info(int member_idx);
	// 회원 정보 상세보기

	AdminMemberInfoPaging getCurpage3(int curPage, int member_idx);
	// 회원 정보 상세보기 페이징 ( 해당 회원이 작성한 글만 )

	List<HashMap<String, Object>> select(AdminMemberInfoPaging AMIP, int member_idx);
	// 회원 정보 상세보기 리스트 ( 해당 회원이 작성한 글만 )
	
}
