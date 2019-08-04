package qna.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import dto.Qna;
import util.QnaPaging;

public interface QnaService {

	QnaPaging getqnaPage(int curPage, QnaPaging search);

	List<HashMap<String, Object>> getNewList(QnaPaging qnaPaging);

	Qna qnaView(int qnaidx);

	void write(HttpSession session, Qna qna);

	Qna getUpdate(int qnaidx);

	Boolean checkId(HttpSession session, Qna qna);

	void setUpdate(Qna qna);

	void delete(int qnaidx);

	Boolean checkAdmin(HttpSession session);

	Qna getAnswer(int qna_idx);

	void setAnswer(Qna qna);
}
