package ledger.controller;



import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.Ledger;
import ledger.service.face.LedgerService;
import util.LedgerPaging;

@Controller
public class LedgerController {
	public static Logger logger = LoggerFactory.getLogger(LedgerController.class);
	
	@Autowired LedgerService ledgerService;
	
	@RequestMapping(value = "/ledger/ledger", method=RequestMethod.GET)
	public void ledger(
			@RequestParam(defaultValue = "1") int curPage,
			HttpSession session,
			Ledger ledger,
			Model model) {
		
		ledger.setMember_idx( (Integer) session.getAttribute("member_idx"));
		
		LedgerPaging LP = ledgerService.getCurpage(curPage, ledger);
		model.addAttribute("LP", LP);
		
		LP.setMember_idx( (Integer) session.getAttribute("member_idx"));
		
		List<HashMap<String, Object>> list = ledgerService.select(LP);
		model.addAttribute("list", list);
		
		Ledger totalplus = ledgerService.getTotal(ledger);
		model.addAttribute("totalplus", totalplus);
		
		Ledger totalminus = ledgerService.getTotal2(ledger);
		model.addAttribute("totalminus", totalminus);
		
		model.addAttribute("ledger", ledger);
		logger.info(ledger.getDatepicker());
		logger.info(ledger.getDatepicker2());
		
	}
	
	@RequestMapping(value = "/ledger/write", method = RequestMethod.POST)
	public String ledgerWrite(
			Ledger ledger,
			HttpSession session) {
		
		int minus = (ledger.getMinusM()*-1);
		logger.info("마이너스"+minus);
		ledger.setMinusM(minus);
		
		ledgerService.write(ledger, session);
		
		return "redirect: /ledger/ledger";
	}
	
	
	
	@RequestMapping(value = "/ledger/search", method = RequestMethod.POST)
	public void ledgerSearch(
			String datepicker,
			String datepicker2,
			Model model) {
		
		logger.info(datepicker);
		logger.info(datepicker2);

		List<HashMap<String, Object>> picker = ledgerService.select2(datepicker, datepicker2);
		model.addAttribute("picker", picker);
		
		
	}
	
}
