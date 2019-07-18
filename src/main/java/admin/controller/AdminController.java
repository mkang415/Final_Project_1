package admin.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.service.face.AdminService;
import util.AdminBoardPaging;

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
		
	}
	
	@RequestMapping(value = "/admin/delete", method = RequestMethod.POST)
	public void boardDelete(
			@RequestParam(value = "chbox[]" ) List<String> chArr) {
		

	}
		
}
