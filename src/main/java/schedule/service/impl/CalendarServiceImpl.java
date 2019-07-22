package schedule.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.Schedule;
import schedule.dao.face.ScheduleDao;
import schedule.service.face.ScheduleService;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired ScheduleDao scheduleDao;

	@Override
	public Schedule test() {
		
		return scheduleDao.test();
	}

}
