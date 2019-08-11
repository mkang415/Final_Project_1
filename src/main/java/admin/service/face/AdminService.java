package admin.service.face;

import java.util.HashMap;
import java.util.List;

import dto.Board;
import dto.Member;
import util.AdminBoardPaging;
import util.AdminMemberBanPaging;
import util.AdminMemberInfoPaging;
import util.AdminMemberPaging;
import util.AdminReportPaging;

public interface AdminService {

	AdminBoardPaging getCurpage(int curPage);
	
	List<HashMap<String, Object>> select(AdminBoardPaging ABP);

	Board view(int board_idx);
	// 게시판 상세보기
	
	void boardListDelete(String names);
	// 게시판 리스트에서 게시글 다중삭제
	
	int getTotal(AdminBoardPaging search);
	// 검색어 적용 게시글 수 조회
	
	List<HashMap<String, Object>> getSearchPagingList(AdminBoardPaging search);
	// 검색결과에 페이징 처리한 게시글 목록
	
	

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

	void ban(int member_idx);
	// 영구정지 눌러서 멤버인덱스 넘겨주기

	
	
	
	AdminMemberBanPaging getcurPage4(int curPage);
	// 회원 벤 영구정지 페이징

	List<HashMap<String, Object>> select(AdminMemberBanPaging AMBP);
	// 회원 벤 영구정지 리스트

	void noban(int member_idx);
	
	

	AdminReportPaging getcurPage5(int curPage);
	// 회원 게시글 신고 페이지
	
	List<HashMap<String, Object>> select(AdminReportPaging ARP);
	// 회원 신고게시글 리스트

	
	
	void viewcheck(int report_idx);
	// report_idx로 체크변화
	
	
	
	
	
	
}
