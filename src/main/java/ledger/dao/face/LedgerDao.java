package ledger.dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.Ledger;
import util.LedgerPaging;

public interface LedgerDao {

	int selectCntAll(Ledger ledger);

	List<HashMap<String, Object>> selectAll(LedgerPaging LP);

	Ledger total(Ledger ledger);

	Ledger total2(Ledger ledger);

	void write(Ledger ledger);

	List<HashMap<String, Object>> picker(Map<String, Object> map);

	
	
}
