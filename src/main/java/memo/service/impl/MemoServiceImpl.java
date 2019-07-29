package memo.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.Memo;
import memo.dao.face.MemoDao;
import memo.service.face.MemoService;
import util.MemoPaging;

@Service
public class MemoServiceImpl implements MemoService{
	@Autowired MemoDao memoDao;

	//	로그인한 유저의 메모 페이징
	@Override
	public MemoPaging getMemoPage(int curPage, HttpSession session) {
		int member_idx = (int) session.getAttribute("member_idx");
		
		//	메모 개수
		int totalCnt = memoDao.memoCnt(member_idx);
		
		MemoPaging paging = new MemoPaging(totalCnt, curPage);
		return paging;
	}

	//	로그인한 유저의 메모 리스트 가져오기
	@Override
	public List<HashMap<String, Object>> getMemoList(MemoPaging memoPaging) {
				
		return memoDao.memoList(memoPaging);
	}

	//	작성한 메모 DB에 저장
	@Override
	public void write(Memo memo, HttpSession session) {
		
		memo.setMember_idx((int)session.getAttribute("member_idx"));
		
		memoDao.write(memo);
		
	}

	//	메모 상세보기
	@Override
	public Memo view(int memo_idx) {
		
		return memoDao.view(memo_idx);
	}
}
