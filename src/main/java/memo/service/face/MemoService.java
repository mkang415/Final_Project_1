package memo.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import dto.Memo;

public interface MemoService {

	List<HashMap<String, Object>> getMemoList(HttpSession session, int mark);

	void write(Memo memo, HttpSession session);

	void setUpdate(Memo memo);

	void delete(int memoidx);

	void mark(int memoidx);

	void unmark(int memoidx);

}
