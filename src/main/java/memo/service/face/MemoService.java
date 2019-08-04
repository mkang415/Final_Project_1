package memo.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import dto.Memo;
import util.ImpMemoPaging;
import util.MemoPaging;

public interface MemoService {

	MemoPaging getMemoPage(int curPage, HttpSession session);

	List<HashMap<String, Object>> getMemoList(MemoPaging memoPaging);

	void write(Memo memo, HttpSession session);

	void setUpdate(Memo memo);

	void delete(int memoidx);

	void mark(int memoidx);

	void unmark(int memoidx);

	ImpMemoPaging impGetMemoPage(int impCurPage, HttpSession session);

	List<HashMap<String, Object>> getImpMemoList(ImpMemoPaging impMemoPaging);

}
