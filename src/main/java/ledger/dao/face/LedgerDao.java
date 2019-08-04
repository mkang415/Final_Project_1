package ledger.dao.face;

import java.util.HashMap;
import java.util.List;

import dto.Ledger;
import util.LedgerPaging;

public interface LedgerDao {

	int selectCntAll();

	List<HashMap<String, Object>> selectAll(LedgerPaging LP);

}
