package notice.controller;

import java.io.IOException;
import java.io.Writer;
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
import dto.NoticeReply;
import member.service.face.MemberService;
import notice.service.face.NoticeService;
import util.NoticePaging;

@Controller
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	@Autowired NoticeService noticeService;
	@Autowired MemberService memberService;



	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)
	public void list(Model model,
			HttpServletRequest req
			) {

		logger.info("공지사항 리스트");

		NoticePaging paging = noticeService.getCurpage(req);

		req.setAttribute("paging",paging);

		List<Notice> list = noticeService.list(paging);

		model.addAttribute("list",list);


	}

	@RequestMapping(value="/notice/view", method=RequestMethod.GET)
	public void view(int notice_idx,
			Model model) {

		logger.info("공지사항 상세보기");

		//공지사항 리스트 전달
		Notice notice = noticeService.getBoardno(notice_idx);

		notice  = noticeService.view(notice);
		NoticeFile noticeFile = noticeService.viewFile(notice);

		model.addAttribute("notice",notice);
		model.addAttribute("noticeFile",noticeFile);
		
		//댓글 리스트 전달
		NoticeReply comment = new NoticeReply();
		List<NoticeReply> commentList = noticeService.getCommentList(notice);
		model.addAttribute("commentList", commentList);
		
	



	}


	@RequestMapping(value="/notice/write", method=RequestMethod.GET)
	public void write( 
			HttpSession session,
			Model model) {

		logger.info("글쓰기 페이지");

		Member member = memberService.getMemberInfo(session);

		model.addAttribute("member",member);


	}

	@RequestMapping(value="/notice/write", method=RequestMethod.POST)
	public String writeProc(Notice notice
			,Member member
			,HttpSession session
			,@RequestParam(value="file")MultipartFile fileupload
			) 			

	{


		logger.info("글쓰기 처리");

		logger.info("Board: "+notice); 

		noticeService.writeBoard(notice, session,fileupload);

		return "redirect:"+"/notice/list"; //write.jsp 와 url 다를 때

	}

	@RequestMapping(value="/file/download", method=RequestMethod.GET)
	public ModelAndView download(
			int fileno, 

			ModelAndView mav
			) {


		logger.info("파일번호: "+fileno);


		NoticeFile file = noticeService.getFile(fileno);

		logger.info("다운받을 파일정보: "+file);


		mav.addObject("downFile", file);

		//viewname 지정
		mav.setViewName("down");

		return mav;
	}	
	
	@RequestMapping(value="/noticeReply/insert", method=RequestMethod.POST)
	public String noticeReplyInsert( 
			NoticeReply noticeReply) {

		NoticeReply comment = noticeReply;
		
		noticeService.insertComment(comment);
		
		
		return "redirect:"+"/notice/view?notice_idx="+comment.getNotice_idx();
		

	}

	@RequestMapping(value="/noticeReply/delete", method=RequestMethod.POST)
	public void noticeReplyDelete( 
			NoticeReply noticeReply,
			Writer out
			) {

			
		boolean success = noticeService.deleteComment(noticeReply);;
		
		try {
			out.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	
	@RequestMapping(value="/notice/update", method=RequestMethod.GET)
	public void update( int notice_idx,
						Model model,
						HttpSession session) {
	
		logger.info("업데이트 창");

		Notice notice = noticeService.getBoardno(notice_idx);

		Member member = memberService.getMemberInfo(session);
		
		notice = noticeService.view(notice);
		
		model.addAttribute("notice",notice);
		model.addAttribute("member",member);

	
	
}

	

	@RequestMapping(value="/notice/update", method=RequestMethod.POST)
	public String updateProc(int notice_idx,
						   Notice notice ) {

		logger.info("업데이트 처리");
		
		notice.setNotice_idx(notice_idx);
		
		
		noticeService.updateNotice(notice);
		
		return "redirect:"+"/notice/list"; 

		

   }
		
	@RequestMapping(value="/notice/delete", method=RequestMethod.GET)
	public String delete( int notice_idx,    
						Notice notice) {
		
			logger.info("글 삭제");
			
			notice.setNotice_idx(notice_idx);
			
			noticeService.deleteNotice(notice);
			
			return "redirect:"+"/notice/list"; 
			
   }

	
	

}
