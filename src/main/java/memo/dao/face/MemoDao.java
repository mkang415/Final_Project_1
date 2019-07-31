package memo.dao.face;

import java.util.HashMap;
import java.util.List;

import dto.Memo;
import util.ImpMemoPaging;
import util.MemoPaging;

public interface MemoDao {

	int memoCnt(Memo memo);

	List<HashMap<String, Object>> memoList(MemoPaging memoPaging);

	void write(Memo memo);

	Memo view(int memo_idx);

	void update(Memo memo);

	void delete(int memo_idx);

	void mark(int memo_idx);

	void unmark(int memo_idx);

	List<HashMap<String, Object>> impMemoList(ImpMemoPaging impMemoPaging);

}
