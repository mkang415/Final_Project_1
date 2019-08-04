package ledger.service.face;

import java.util.HashMap;
import java.util.List;

import dto.Ledger;
import util.LedgerPaging;

public interface LedgerService {

	LedgerPaging getCurpage(int curPage);

	List<HashMap<String, Object>> select(LedgerPaging LP);

}
