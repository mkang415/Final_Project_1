package memo.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.Memo;
import memo.dao.face.MemoDao;
import memo.service.face.MemoService;
import util.ImpMemoPaging;
import util.MemoPaging;

@Service
public class MemoServiceImpl implements MemoService{
	@Autowired MemoDao memoDao;

	//	로그인한 유저의 새 메모 페이징
	@Override
	public MemoPaging getMemoPage(int curPage, HttpSession session) {
		int member_idx = (int) session.getAttribute("member_idx");

		Memo memo = new Memo();
		memo.setMember_idx(member_idx);
		memo.setMark(1);
		
		//	메모 개수
		int totalCnt = memoDao.memoCnt(memo);
		
		MemoPaging paging = new MemoPaging(totalCnt, curPage);
		return paging;
	}

	//	로그인한 유저의 중요 메모 페이징
	@Override
	public ImpMemoPaging impGetMemoPage(int curPage, HttpSession session) {
		int member_idx = (int) session.getAttribute("member_idx");

		Memo memo = new Memo();
		memo.setMember_idx(member_idx);
		memo.setMark(2);
		
		//	메모 개수
		int totalCnt = memoDao.memoCnt(memo);
		
		ImpMemoPaging paging = new ImpMemoPaging(totalCnt, curPage);
		return paging;
	}
	
	//	로그인한 유저의 메모 리스트 가져오기
	@Override
	public List<HashMap<String, Object>> getMemoList(MemoPaging memoPaging) {
		
		return memoDao.memoList(memoPaging);
	}
	
	//	로그인한 유저의 메모 리스트 가져오기
	@Override
	public List<HashMap<String, Object>> getImpMemoList(ImpMemoPaging impMemoPaging) {
		
		return memoDao.impMemoList(impMemoPaging);
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

	//	수정할 메모 데이터 불러오기
	@Override
	public Memo getUpdate(int memo_idx) {
		
		return memoDao.view(memo_idx);
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
