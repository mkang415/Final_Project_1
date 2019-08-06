package qna.dao.face;

import java.util.HashMap;
import java.util.List;

import dto.Qna;
import util.QnaPaging;

public interface QnaDao {

	int qnaCnt(QnaPaging search);

	List<HashMap<String, Object>> getNewList(QnaPaging qnaPaging);

	Qna qnaView(int qna_idx);

	void write(Qna qna);

	void setUpdate(Qna qna);

	void delete(int qna_idx);

	int checkAdmin(int member_idx);

	Qna getAnswer(int qna_idx);

	void setAnswer(Qna qna);

}
