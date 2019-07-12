package memo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.Memo;
import memo.dao.face.MemoDao;
import memo.service.face.MemoService;

@Service
public class MemoServiceImpl implements MemoService{
	@Autowired MemoDao memoDao;

	@Override
	public Memo test() {
		
		return memoDao.test();
	}
}
