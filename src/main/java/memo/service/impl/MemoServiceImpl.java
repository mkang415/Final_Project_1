package memo.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.Memo;
import memo.dao.face.MemoDao;
import memo.service.face.MemoService;

@Service
public class MemoServiceImpl implements MemoService{
	@Autowired MemoDao memoDao;

	//	로그인한 유저의 메모 리스트 가져오기
	@Override
	public List<HashMap<String, Object>> getMemoList(HttpSession session, int mark) {
		
		int member_idx = (int)session.getAttribute("member_idx");
		
		Memo memo = new Memo();
		memo.setMember_idx(member_idx);
		memo.setMark(mark);
		
		return memoDao.memoList(memo);
	}


	//	작성한 메모 DB에 저장
	@Override
	public void write(Memo memo, HttpSession session) {
		
		memo.setMember_idx((int)session.getAttribute("member_idx"));
		
		memoDao.write(memo);
		
	}

	//	수정한 메모 입력
	@Override
	public void setUpdate(Memo memo) {
		
		memoDao.update(memo);
		
	}

	//	메모 삭제
	@Override
	public void delete(int memo_idx) {

		memoDao.delete(memo_idx);
		
	}

	//	중요 메모 db 설정
	@Override
	public void mark(int memo_idx) {
		
		memoDao.mark(memo_idx);
		
	}

	//	중요 메모 해제 db 설정
	@Override
	public void unmark(int memo_idx) {

		memoDao.unmark(memo_idx);
	}

}
