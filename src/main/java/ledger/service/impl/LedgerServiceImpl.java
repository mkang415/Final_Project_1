package ledger.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.Ledger;
import ledger.dao.face.LedgerDao;
import ledger.service.face.LedgerService;

@Service
public class LedgerServiceImpl implements LedgerService{

	@Autowired LedgerDao ledgerDao;

	@Override
	public Ledger test() {
		
		return ledgerDao.test();
	}
}
