package admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import util.AdminBoardPaging;
import util.AdminMemberInfoPaging;
import util.AdminMemberPaging;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired AdminService adminService;
	
	@RequestMapping(value = "/admin/list", method = RequestMethod.GET)
	public void boardList(
			@RequestParam(defaultValue = "1")
			int curPage ,
			Model model) {
		
		AdminBoardPaging ABP = adminService.getCurpage(curPage);
		model.addAttribute("ABP", ABP);
		
		List<HashMap<String, Object>> list = adminService.select(ABP);
		model.addAttribute("list", list);
		
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
		
}
