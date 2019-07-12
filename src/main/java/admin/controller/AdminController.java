package admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.service.face.AdminService;
import dto.Board;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired AdminService adminService;
	
	@RequestMapping(value = "/admin/test", method = RequestMethod.GET)
	public void adminTest() {
		
		Board test = adminService.test();
		logger.info(test.toString());
	}
}
