package report.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.Report;
import report.service.face.ReportService;

@Controller
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	@Autowired ReportService reportService;
	
	//	신고글 저장
	@RequestMapping(value = "/report/boardreport", method = RequestMethod.POST)
	public String boardReport(
			Report report
			) {
		logger.info(report.toString());
		reportService.boardReort(report);
		
		return "redirect: /board/view?brdidx="+report.getBoard_idx();
	}
}
