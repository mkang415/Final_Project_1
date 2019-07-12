package notice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.Notice;
import notice.dao.face.NoticeDao;
import notice.service.face.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired NoticeDao noticeDao;

	@Override
	public Notice test() {
		
		return noticeDao.test();
	}
}
