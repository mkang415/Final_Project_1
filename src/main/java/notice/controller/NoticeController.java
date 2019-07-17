package notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.Member;
import dto.Notice;
import dto.NoticeFile;
import member.service.face.MemberService;
import notice.service.face.NoticeService;
import util.NoticePaging;



@Controller
public class NoticeController {
	public static Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired NoticeService noticeService;
	@Autowired MemberService memberService;

	
	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)
	public void list( Model model, 
					  HttpServletRequest req
					) {
		
		logger.info("게시판 리스트");
		
		NoticePaging page = noticeService.getCurPage(req);
		
		//MODEL로 Paging 객체 넣기
		req.setAttribute("paging", page);
		
		List<Notice> list =	noticeService.list(page);

		model.addAttribute("list",list);
		
	}
	

	@RequestMapping(value="/notice/view", method=RequestMethod.GET)
	public void view(HttpServletRequest req,
					 Model model) {
	
		logger.info("게시판 상세보기");

		Notice notice = noticeService.getNoticeno(req);
		
		notice = noticeService.view(notice);
		NoticeFile noticeFile = noticeService.viewFile(notice);
		
		model.addAttribute("notice",notice);
		model.addAttribute("noticeFile",noticeFile);
			
		
	}
	
	@RequestMapping(value="/notice/write", method=RequestMethod.GET)
		public void write( 
						  HttpSession session,
						  Model model) {
		
		logger.info("글쓰기 폼");
		
		Member member = memberService.getMemberInfo(session);
		
		model.addAttribute("member",member);
		
		
	}

	@RequestMapping(value="/notice/write", method=RequestMethod.POST)
		public String writeProc(Notice notice
							,Member member
							,HttpSession session
							,@RequestParam(value="file")MultipartFile fileupload //변수 이름 다를 때 전달파라미터랑
								) 			
		
	{
	
		
		logger.info("글쓰기 처리");
		
		logger.info("notice: "+notice); 
		
		noticeService.writeNotice(notice, session,fileupload); //form에서 받아온 매개변수를 그대로 쓸수 있다.
		
		return "redirect:"+"/notice/list"; //write.jsp 에서 다른 URL 경로로 갈 때
	
}
	
	@RequestMapping(value="/file/download", method=RequestMethod.GET)
	public ModelAndView download(
			int fileno, //파일 번호 전달 파라미터
			
			ModelAndView mav
			) {
		
		logger.info("파일번호: "+fileno);
		
		//파일번호에 해당하는 파일 정보 가져오기
		NoticeFile file = noticeService.getFile(fileno);

		logger.info("조회된 파일정보: "+file);
		
		//파일정보 model로 값 넘기기
		mav.addObject("downFile", file);
		
		//viewName 지정
		mav.setViewName("down");

		return mav;
	}

	

	@RequestMapping(value="/notice/update", method=RequestMethod.GET)
	public void update(HttpServletRequest req,
						Model model,
						HttpSession session) {
	

		Notice notice = noticeService.getNoticeno(req);

		Member member = memberService.getMemberInfo(session);
		
		notice = noticeService.view(notice);
		
		model.addAttribute("notice",notice); //수정할 제목과 본문 보여주기
		model.addAttribute("member",member); // 아이디 닉네임 보여주기

		logger.info("글 수정 폼");

	
	
}

	

	@RequestMapping(value="/notice/update", method=RequestMethod.POST)
	public String updateProc(int notice_no,
						   Notice notice ) {

		logger.info("글 수정 처리");
		logger.info("파라미터 notice_no는: "+notice_no);
		// 파라미터로 받은 notice_no 객체에 저장하기
		notice.setNotice_idx(notice_no);
		
		
		noticeService.updateNotice(notice);
		
		return "redirect:"+"/notice/list"; // 다른 URL 경로로 갈 때

		

   }
		
	@RequestMapping(value="/notice/delete", method=RequestMethod.GET)
	public String delete( int notice_no,   //GET 메소드 일때만 브라우저에서 ?파라미터 값이 받아짐 
						Notice notice) {
		
			logger.info("글 삭제 처리");
			
			notice.setNotice_idx(notice_no);
			
			noticeService.deleteNotice(notice);
			
			return "redirect:"+"/notice/list"; //다른 URL 경로로 갈 때
			
   }
	


}
