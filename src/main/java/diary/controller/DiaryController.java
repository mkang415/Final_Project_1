package diary.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import diary.service.face.DiaryService;
import dto.Diary;
import util.DiaryPaging;

@Controller
public class DiaryController {
	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);
	
	@Autowired ServletContext context;
	
	@Autowired DiaryService diaryService;
	
	@RequestMapping(value = "/diary", method = RequestMethod.GET)
	public String diary(Model model, HttpSession session, @Parameter String curPage) {

		String id = (String)session.getAttribute("loginEmail");

		String param = curPage;
		
		int member_idx = diaryService.getMemberIdx(id);
		
		DiaryPaging paging = diaryService.getCurPage(member_idx, param);
		
		List<Diary> diaryList = diaryService.getDiaries(member_idx, paging);

		model.addAttribute("diaryList", diaryList);
		model.addAttribute("paging", paging);
		
		return "/diary/diary";
	}
	
	@RequestMapping(value="/diary/write", method=RequestMethod.GET)
	public void write() {
		
	}
	
	@RequestMapping(value="/diary/write", method=RequestMethod.POST)
	public String writeSubmit(HttpSession session, Diary diary) {
		
		String id = (String)session.getAttribute("loginEmail");
		
		System.out.println(diary.toString());
		
		int member_idx = diaryService.getMemberIdx(id);
		
		diaryService.insertDiary(member_idx, diary);
		
		return "redirect:/diary";
	}
	
	@RequestMapping(value="/diary/write/fileUpload", method=RequestMethod.POST)
	public void fileUpload(HttpSession session, MultipartFile file, HttpServletResponse resp) throws IOException {
		
		logger.info("일단 됨");
		
		PrintWriter out = resp.getWriter();
		
		String id = (String)session.getAttribute("loginEmail");

		int member_idx = diaryService.getMemberIdx(id);
		
		logger.info("파일업로드 처리");
		
		int diary_idx = 0; // 임시 파일들이 저장될 인덱스 번호
		
		logger.info("글번호 : " + diary_idx);
		logger.info("파일 : " + file.getOriginalFilename());
		logger.info(context.getRealPath("upload/diaryFiles"));
		
		
		//첨부파일 저장
		String res = diaryService.fileUploadForSummernote(member_idx, diary_idx, file, context);
		
		out.println("upload/diaryFiles/"+res);
		out.close();
		
		
	}
}
