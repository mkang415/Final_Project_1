package admin.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.face.AdminDao;
import admin.service.face.AdminService;
import util.AdminBoardPaging;

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


	

	
}
