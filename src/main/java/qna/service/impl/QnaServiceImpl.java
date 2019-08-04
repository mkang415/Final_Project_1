package qna.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.Qna;
import qna.dao.face.QnaDao;
import qna.service.face.QnaService;
import util.QnaPaging;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired QnaDao qnaDao;

	//	QnA 페이징 생성
	@Override
	public QnaPaging getqnaPage(int curPage, QnaPaging search) {
		
		int totalCnt = qnaDao.qnaCnt(search);
		
		QnaPaging qnaPaging = new QnaPaging(totalCnt, curPage);
		
		return qnaPaging;
	}

	//	QnA 리스트 가져오기
	@Override
	public List<HashMap<String, Object>> getNewList(QnaPaging qnaPaging) {
		
		return qnaDao.getNewList(qnaPaging);
	}

	//	DB에서 idx로 검색하여 값 리턴
	@Override
	public Qna qnaView(int qna_idx) {

		return qnaDao.qnaView(qna_idx);
	}


	@Override
	public Boolean checkId(HttpSession session, Qna qna) {
		
		String id = (String) session.getAttribute("loginEmail");
		if (id != null && !"".equals(id)) {
			int memIdx = (int) session.getAttribute("member_idx");
			if (memIdx == qna.getMember_idx()) {
				return true;
			}
		}
		return false;
	}
	
	//	작성 질문글 저장 후 qnaidx 반환
	@Override
	public void write(HttpSession session, Qna qna) {
		
		qna.setMember_idx((int)session.getAttribute("member_idx"));
		
		qnaDao.write(qna);
	}

	//	수정할 qna 불러오기
	@Override
	public Qna getUpdate(int qna_idx) {
		
		return qnaDao.qnaView(qna_idx);
	}

	//	수정한 qna 저장
	@Override
	public void setUpdate(Qna qna) {
		
		qnaDao.setUpdate(qna);
		
	}

	//	qna 삭제
	@Override
	public void delete(int qna_idx) {
		
		qnaDao.delete(qna_idx);
		
	}

	//	관리자인지 체크
	@Override
	public Boolean checkAdmin(HttpSession session) {
		String id = (String) session.getAttribute("loginEmail");
		if (id != null && !"".equals(id)) {
			int memclass = qnaDao.checkAdmin((int)session.getAttribute("member_idx"));
			if(memclass == 0) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}

	//	답변 호출
	@Override
	public Qna getAnswer(int qna_idx) {
		
		return qnaDao.getAnswer(qna_idx);
	}

	//	답변 저장
	@Override
	public void setAnswer(Qna qna) {
		
		qnaDao.setAnswer(qna);
		
	}


}
