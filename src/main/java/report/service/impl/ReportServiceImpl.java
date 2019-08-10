package report.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.Report;
import report.dao.face.ReportDao;
import report.service.face.ReportService;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired ReportDao reportDao;
	
	@Override
	public void boardReort(Report report) {
		
		int memberidx = reportDao.getMemberidx(report);
		report.setMember_idx(memberidx);
		
		reportDao.boardReport(report);
		
	}

}
