package admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.service.face.AdminService;
import dto.Board;
import dto.Member;
import member.service.face.MemberService;
import util.AdminBoardPaging;
import util.AdminMemberBanPaging;
import util.AdminMemberInfoPaging;
import util.AdminMemberPaging;
import util.AdminReportPaging;

@Controller
public class AdminController {
	private static Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired AdminService adminService;

	
	@RequestMapping(value = "/admin/list", method = RequestMethod.GET)
	public String boardList(
			@RequestParam(defaultValue = "1") int curPage ,
			AdminBoardPaging search,
			Model model) {

		
		int totalCount = adminService.getTotal(search); //검색어 적용 게시글 수
		
		AdminBoardPaging ABP = new AdminBoardPaging(totalCount, curPage);
		ABP.setSearch(search.getSearch()); //검색어 추가
		model.addAttribute("ABP", ABP);
																		
		List<HashMap<String, Object>> list = adminService.getSearchPagingList(ABP); //검색어 적용 게시글 조회
		model.addAttribute("list", list);
		
		return "/admin/list";
		// 게시글 관리 페이지
	}
	
	@RequestMapping(value="/admin/boardview", method=RequestMethod.GET)
	public void boardView(
			int board_idx,
			Model model) {
		
		Board board = adminService.view(board_idx);
		model.addAttribute("board", board);
		
		// 게시글 상세보기
	}
	
	@RequestMapping(value="/admin/deletelist", method=RequestMethod.POST)
	public String deleteList(String names) {
			
			if(!"".equals(names)&&names != null) {
					adminService.boardListDelete(names);
			}
		
			return "redirect:/admin/list";
			
			// 게시글 다중삭제
	}
	
	

	
	@RequestMapping(value="/admin/member", method=RequestMethod.GET)
	public void memberList(
			@RequestParam(defaultValue = "1")
			int curPage ,
			Model model) {
		
		AdminMemberPaging AMP = adminService.getCurpage2(curPage);
		model.addAttribute("AMP", AMP);
		
		List<HashMap<String, Object>> list = adminService.select(AMP);
		model.addAttribute("list", list);
		
		// 회원 목록 페이지
	}
	
	@RequestMapping(value="/admin/memberinfo", method=RequestMethod.GET)
	public void memberinfo(
			int member_idx,
			@RequestParam(defaultValue = "1")
			int curPage,
			Model model) {
		
		Member member = adminService.info(member_idx);
		model.addAttribute("member", member);
		
		// 회원 정보 상세보기 - 개인정보
		
		AdminMemberInfoPaging AMIP = adminService.getCurpage3(curPage, member_idx);
		model.addAttribute("AMIP", AMIP);
		
		List<HashMap<String, Object>> list = adminService.select(AMIP, member_idx);
		model.addAttribute("list", list);
		
		// 회원 정보 상세보기 - 해당 회원이 쓴 글만
	}
	
	@RequestMapping(value="/admin/ban", method=RequestMethod.GET)
	public String ban(int member_idx) {
		
		adminService.ban(member_idx);
		
		return "redirect:/admin/banlist";
		
		// 영구정지 버튼누르면 memberclass 값이 2로 바뀌고 banlist로 리다이렉트
	}
	
	@RequestMapping(value="/admin/noban", method=RequestMethod.GET)
	public String noban(int member_idx) {
		
		adminService.noban(member_idx);
		
		return "redirect:/admin/member";
	}
	
	
	@RequestMapping(value="/admin/banlist", method=RequestMethod.GET)
	public void banlist(
			@RequestParam(defaultValue = "1")
			int curPage ,
			Model model) {
		
		AdminMemberBanPaging AMBP = adminService.getcurPage4(curPage);
		model.addAttribute("AMBP", AMBP);
		
		List<HashMap<String, Object>> list = adminService.select(AMBP);
		model.addAttribute("list", list);
		
		// 회원 영구정지 페이지
	}
	
	@RequestMapping(value = "/interceptor/adminFail", method = RequestMethod.GET)
	public void adminFail() {
		logger.info("관리자 외 접근금지");
		
		// 관리자페이지 접근제한 인터셉터
	}
	
	@RequestMapping(value="/admin/report", method=RequestMethod.GET)
	public String reportlist(
			@RequestParam(defaultValue = "1") int curPage,
			Model model) {
		
		AdminReportPaging ARP = adminService.getcurPage5(curPage);
		model.addAttribute("ARP", ARP);
		
		List<HashMap<String, Object>> list = adminService.select(ARP);
		model.addAttribute("list", list);

		return "/admin/report";
		
		// 회원신고목록 페이지
	}
	
	@RequestMapping(value="/admin/viewcheck", method=RequestMethod.GET)
	public String viewcheck(int report_idx) {
		
		adminService.viewcheck(report_idx);
		
		return "redirect:/admin/report";
	}
	
	
}
