package ledger.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.Ledger;
import ledger.service.face.LedgerService;

@Controller
public class LedgerController {
	public static Logger logger = LoggerFactory.getLogger(LedgerController.class);
	
	@Autowired LedgerService ledgerService;
	
	@RequestMapping(value = "/ledger/test", method = RequestMethod.GET)
	public void ledgerTest() {
		Ledger test = ledgerService.test();
		logger.info(test.toString());
	}
}
