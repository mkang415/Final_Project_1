package ledger.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import dto.Ledger;
import util.LedgerPaging;

public interface LedgerService {

	LedgerPaging getCurpage(int curPage, Ledger ledger);

	List<HashMap<String, Object>> select(LedgerPaging LP);

	Ledger getTotal(Ledger ledger);

	Ledger getTotal2(Ledger ledger);

	void write(Ledger ledger, HttpSession session);

	


}
