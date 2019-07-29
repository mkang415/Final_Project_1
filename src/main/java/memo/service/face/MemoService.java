package memo.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import dto.Memo;
import util.MemoPaging;

public interface MemoService {

	MemoPaging getMemoPage(int curPage, HttpSession session);

	List<HashMap<String, Object>> getMemoList(MemoPaging memoPaging);

	void write(Memo memo, HttpSession session);

	Memo view(int memo_idx);

}
