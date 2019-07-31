package qna.service.impl;

import java.util.HashMap;
import java.util.List;

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
}
