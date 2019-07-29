package memo.dao.face;

import java.util.HashMap;
import java.util.List;

import dto.Memo;
import util.MemoPaging;

public interface MemoDao {

	int memoCnt(int member_idx);

	List<HashMap<String, Object>> memoList(MemoPaging memoPaging);

	void write(Memo memo);

	Memo view(int memo_idx);

}
