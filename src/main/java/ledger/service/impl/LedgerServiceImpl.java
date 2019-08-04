package ledger.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.Ledger;
import ledger.dao.face.LedgerDao;
import ledger.service.face.LedgerService;
import util.LedgerPaging;

@Service
public class LedgerServiceImpl implements LedgerService{

	@Autowired LedgerDao ledgerDao;

	@Override
	public LedgerPaging getCurpage(int curPage) {

		int totalCount = ledgerDao.selectCntAll();
		
		LedgerPaging LP = new LedgerPaging(totalCount, curPage);
		
		return LP;
		
	}

	@Override
	public List<HashMap<String, Object>> select(LedgerPaging LP) {

		return ledgerDao.selectAll(LP);
	}

	
}
