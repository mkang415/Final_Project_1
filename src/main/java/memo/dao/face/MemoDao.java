package memo.dao.face;

import java.util.HashMap;
import java.util.List;

import dto.Memo;

public interface MemoDao {

	List<HashMap<String, Object>> memoList(Memo memo);

	void write(Memo memo);

	void update(Memo memo);

	void delete(int memo_idx);

	void mark(int memo_idx);

	void unmark(int memo_idx);

}
