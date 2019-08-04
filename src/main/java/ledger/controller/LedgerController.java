package ledger.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ledger.service.face.LedgerService;
import util.LedgerPaging;

@Controller
public class LedgerController {
	public static Logger logger = LoggerFactory.getLogger(LedgerController.class);
	
	@Autowired LedgerService ledgerService;
	
	@RequestMapping(value = "/ledger/ledger", method=RequestMethod.GET)
	public void ledger(
			@RequestParam(defaultValue = "1") 
			int curPage,
			Model model) {
		
		LedgerPaging LP = ledgerService.getCurpage(curPage);
		model.addAttribute("LP", LP);
		
		List<HashMap<String, Object>> list = ledgerService.select(LP);
		model.addAttribute("list", list);
		
	}
}
