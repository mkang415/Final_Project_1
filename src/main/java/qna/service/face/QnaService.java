package qna.service.face;

import java.util.HashMap;
import java.util.List;

import dto.Qna;
import util.QnaPaging;

public interface QnaService {

	QnaPaging getqnaPage(int curPage, QnaPaging search);

	List<HashMap<String, Object>> getNewList(QnaPaging qnaPaging);

	Qna qnaView(int qnaidx);

}
