package ledger.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public LedgerPaging getCurpage(int curPage, Ledger ledger) {

		int totalCount = ledgerDao.selectCntAll(ledger);
		
		LedgerPaging LP = new LedgerPaging(totalCount, curPage);
		
		LP.setDatepicker(ledger.getDatepicker());
		LP.setDatepicker2(ledger.getDatepicker2());
		
		return LP;
		
	}

	@Override
	public List<HashMap<String, Object>> select(LedgerPaging LP) {

		return ledgerDao.selectAll(LP);
	}

	@Override
	public Ledger getTotal(Ledger ledger) {
		
		return ledgerDao.total(ledger);
	}

	@Override
	public Ledger getTotal2(Ledger ledger) {

		return ledgerDao.total2(ledger);
	}

	@Override
	public void write(Ledger ledger, HttpSession session) {

		ledger.setMember_idx((Integer)session.getAttribute("member_idx"));
		
		ledgerDao.write(ledger);
	}

	@Override
	public List<HashMap<String, Object>> select2(String datepicker, String datepicker2) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("datepicker", datepicker);
		map.put("datepicker2", datepicker2);
		
		return ledgerDao.picker(map);
	}

	
	

	
}
