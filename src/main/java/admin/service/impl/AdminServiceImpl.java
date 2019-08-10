package admin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.face.AdminDao;
import admin.service.face.AdminService;
import dto.Board;
import dto.Member;
import util.AdminBoardPaging;
import util.AdminMemberBanPaging;
import util.AdminMemberInfoPaging;
import util.AdminMemberPaging;
import util.AdminReportPaging;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired AdminDao adminDao;

	@Override
	public AdminBoardPaging getCurpage(int curPage) {

		int totalCount = adminDao.selectCntAll();
		
		AdminBoardPaging ABP = new AdminBoardPaging(totalCount, curPage);
		
		return ABP;
	}

	@Override
	public List<HashMap<String, Object>> select(AdminBoardPaging ABP) {
		return adminDao.selectAll(ABP);
	}

	
	@Override
	public int getTotal(AdminBoardPaging search) {
		return adminDao.countSearch(search);
	}

	@Override
	public List<HashMap<String, Object>> getSearchPagingList(AdminBoardPaging search) {
		return adminDao.selectPageSearch(search);
	}


	@Override
	public Board view(int board_idx) {
		
		return adminDao.select(board_idx);
		
		// 게시판 상세보기
	}
	
	@Override
	public void boardListDelete(String names) {
		adminDao.deleteBoardList(names);
		
		// 게시판 리스트 다중삭제
	}

	@Override
	public AdminMemberPaging getCurpage2(int curPage) {
		
		int totalCount = adminDao.selectCntAll2();
		
		AdminMemberPaging AMP = new AdminMemberPaging(totalCount, curPage);
		
		return AMP;
		
		// 회원목록 페이징
	}

	@Override
	public List<HashMap<String, Object>> select(AdminMemberPaging AMP) {

		return adminDao.selectAll2(AMP);
		
		//회원목록 리스트
	}

	@Override
	public Member info(int member_idx) {
		
		return adminDao.select2(member_idx);
		
		//회원정보 상세보기
	}

	@Override
	public AdminMemberInfoPaging getCurpage3(int curPage, int member_idx) {

		int totalCount = adminDao.selectCntAll3(member_idx);
		
		AdminMemberInfoPaging AMIP = new AdminMemberInfoPaging(totalCount, curPage);
		
		return AMIP;
		
		//회원 상세정보 페이징 (해당 회원이 쓴 글)
	}

	@Override
	public List<HashMap<String, Object>> select(AdminMemberInfoPaging AMIP, int member_idx) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("AMIP", AMIP);
		map.put("member_idx", member_idx);
		
		return adminDao.selectAll3(map);
		
		//회원 상세정보 리스트 (해당 회원이 쓴 글)
	}

	@Override
	public void ban(int member_idx) {
		
		adminDao.ban(member_idx);
		
		// 해당 회원 정보변경 memberclass 1-> 2 회원정지
	}

	@Override
	public AdminMemberBanPaging getcurPage4(int curPage) {
	
		int totalCount = adminDao.selectCntAll4();
		
		AdminMemberBanPaging AMBP = new AdminMemberBanPaging(totalCount, curPage);
		
		return AMBP;
		
		//회원 벤 영구정지 페이징
	}

	@Override
	public List<HashMap<String, Object>> select(AdminMemberBanPaging AMBP) {
		
		return adminDao.selectAll4(AMBP);
		
		//회원 벤 영구정지 리스트
	}

	@Override
	public void noban(int member_idx) {

		adminDao.noban(member_idx);
		
		// 해당 회원 정보변경 memberclass 2-> 1 
		
	}

	@Override
	public AdminReportPaging getcurPage5(int curPage) {

		int totalCount = adminDao.selectCntAll5();
		
		AdminReportPaging ARP = new AdminReportPaging(totalCount, curPage);
		
		return ARP;
		
		// 회원 게시글신고 페이지
	}

	@Override
	public List<HashMap<String, Object>> select(AdminReportPaging ARP) {
		
		return adminDao.selectAll5(ARP);
		
		// 회원 게시글신고 리스트
	}

	@Override
	public void viewcheck(int report_idx) {
		
		adminDao.viewcheck(report_idx);
	}

	
	

	

	


	

	
}
