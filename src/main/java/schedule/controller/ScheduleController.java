package schedule.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.Schedule;
import schedule.service.face.ScheduleService;

@Controller
public class ScheduleController {

	@Autowired ScheduleService scheduleService;
	
	public static Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	@RequestMapping(value = "/schedule/test", method = RequestMethod.GET)
	public void scheduleTest() {
		Schedule test = scheduleService.test();
		
		logger.info(test.toString());
	}
}
