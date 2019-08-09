package report.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import report.service.face.ReportService;

@Controller
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	@Autowired ReportService reportService;
}
