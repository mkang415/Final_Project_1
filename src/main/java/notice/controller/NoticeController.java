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
		
		logger.info("�Խ��� ����Ʈ");
		
		NoticePaging page = noticeService.getCurPage(req);
		
		//MODEL�� Paging ��ü �ֱ�
		req.setAttribute("paging", page);
		
		List<Notice> list =	noticeService.list(page);

		model.addAttribute("list",list);
		
	}
	

	@RequestMapping(value="/notice/view", method=RequestMethod.GET)
	public void view(HttpServletRequest req,
					 Model model) {
	
		logger.info("�Խ��� �󼼺���");

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
		
		logger.info("�۾��� ��");
		
		Member member = memberService.getMemberInfo(session);
		
		model.addAttribute("member",member);
		
		
	}

	@RequestMapping(value="/notice/write", method=RequestMethod.POST)
		public String writeProc(Notice notice
							,Member member
							,HttpSession session
							,@RequestParam(value="file")MultipartFile fileupload //���� �̸� �ٸ� �� �����Ķ���Ͷ�
								) 			
		
	{
	
		
		logger.info("�۾��� ó��");
		
		logger.info("notice: "+notice); 
		
		noticeService.writeNotice(notice, session,fileupload); //form���� �޾ƿ� �Ű������� �״�� ���� �ִ�.
		
		return "redirect:"+"/notice/list"; //write.jsp ���� �ٸ� URL ��η� �� ��
	
}
	
	@RequestMapping(value="/file/download", method=RequestMethod.GET)
	public ModelAndView download(
			int fileno, //���� ��ȣ ���� �Ķ����
			
			ModelAndView mav
			) {
		
		logger.info("���Ϲ�ȣ: "+fileno);
		
		//���Ϲ�ȣ�� �ش��ϴ� ���� ���� ��������
		NoticeFile file = noticeService.getFile(fileno);

		logger.info("��ȸ�� ��������: "+file);
		
		//�������� model�� �� �ѱ��
		mav.addObject("downFile", file);
		
		//viewName ����
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
		
		model.addAttribute("notice",notice); //������ ����� ���� �����ֱ�
		model.addAttribute("member",member); // ���̵� �г��� �����ֱ�

		logger.info("�� ���� ��");

	
	
}

	

	@RequestMapping(value="/notice/update", method=RequestMethod.POST)
	public String updateProc(int notice_no,
						   Notice notice ) {

		logger.info("�� ���� ó��");
		logger.info("�Ķ���� notice_no��: "+notice_no);
		// �Ķ���ͷ� ���� notice_no ��ü�� �����ϱ�
		notice.setNotice_idx(notice_no);
		
		
		noticeService.updateNotice(notice);
		
		return "redirect:"+"/notice/list"; // �ٸ� URL ��η� �� ��

		

   }
		
	@RequestMapping(value="/notice/delete", method=RequestMethod.GET)
	public String delete( int notice_no,   //GET �޼ҵ� �϶��� ���������� ?�Ķ���� ���� �޾��� 
						Notice notice) {
		
			logger.info("�� ���� ó��");
			
			notice.setNotice_idx(notice_no);
			
			noticeService.deleteNotice(notice);
			
			return "redirect:"+"/notice/list"; //�ٸ� URL ��η� �� ��
			
   }
	


}
