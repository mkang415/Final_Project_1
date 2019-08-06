package diary.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

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
		
		if(diaryService.diaryChk(member_idx)==0) {
			
			Diary diary = new Diary();
			
			diary.setMember_idx(member_idx);
			diary.setTitle("fileDBtemp");
			diary.setContent("fileDBtemp");
			
			diaryService.insertDiary(member_idx, diary);
			
		}
		
		DiaryPaging paging = diaryService.getCurPage(member_idx, param);
		
		List<Diary> diaryList = diaryService.getDiaries(member_idx, paging);

		model.addAttribute("diaryList", diaryList);
		model.addAttribute("paging", paging);
		
		return "/diary/diary";
	}
	
	@RequestMapping(value="/diary/write", method=RequestMethod.GET)
	public void write(Model model) {
		
	}
	
	@RequestMapping(value="/diary/write", method=RequestMethod.POST)
	public String writeSubmit(HttpSession session, Diary diary) {
		
		String id = (String)session.getAttribute("loginEmail");
		
		System.out.println(diary.toString());
		
		int member_idx = diaryService.getMemberIdx(id);
		
		diaryService.insertDiary(member_idx, diary);
		
		return "redirect:/diary";
	}
	
//	@RequestMapping(value="/diary/write/fileUpload", method=RequestMethod.POST)
//	public void fileUpload(HttpSession session, MultipartFile file, HttpServletResponse resp) throws IOException {
//		
//		logger.info("일단 됨");
//		
//		PrintWriter out = resp.getWriter();
//		
//		String id = (String)session.getAttribute("loginEmail");
//
//		int member_idx = diaryService.getMemberIdx(id);
//		
//		logger.info("파일업로드 처리");
//		
//		int diary_idx = 0; // 임시 파일들이 저장될 인덱스 번호
//		
//		logger.info("글번호 : " + diary_idx);
//		logger.info("파일 : " + file.getOriginalFilename());
//		logger.info(context.getRealPath("resources/diaryFiles"));
//		
//		String path = context.getRealPath("resources/diaryFiles");
//		
////		JSONObject jobj = new JSONObject();
////		jobj.put()
//		
//		//첨부파일 저장
//		String res = diaryService.fileUploadForSummernote(member_idx, diary_idx, file, context);
//		
//		out.println(context.getRealPath("resources/diaryFiles/")+res);
//		out.close();
//		
//		
//	}
	
    @PostMapping("/diary/write/fileTemp")
    @ResponseBody
    public ResponseEntity<?> handleFileUpload(@RequestParam("file") MultipartFile file, HttpSession session) {
        try {
        	
    		String id = (String)session.getAttribute("loginEmail");

    		int member_idx = diaryService.getMemberIdx(id);
    		
    		int diary_idx = 0; // 임시 파일들이 저장될 인덱스 번호
        	
    		String path = context.getRealPath("resources/diary/diaryFiles");
    		    		
    		//첨부파일 저장
    		String res = diaryService.fileUploadForSummernote(member_idx, diary_idx, file, context);
    		

            return ResponseEntity.ok().body("/resources/diary/diaryFiles/"+res);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().build();
        }
    }
    
    @RequestMapping(value="/diary/delete", method=RequestMethod.GET) 
    public String delete(@Parameter int diary_idx) {
    	diaryService.delete(diary_idx);
    	
    	return "redirect:/diary";
    }

    
    @RequestMapping(value="/diary/modify", method=RequestMethod.GET)
    public void modify(@Parameter int diary_idx, Model model) {
    	
    	Diary modifyDiary = diaryService.getDiary(diary_idx);
    	
    	model.addAttribute("modifyDiary", modifyDiary);
    	
    }

    @RequestMapping(value="/diary/modify", method=RequestMethod.POST)
    public String modifySubmit(@Parameter int diary_idx, Diary diary) {
    	
    	diaryService.modify(diary_idx, diary);
    	
    	return "redirect:/diary";
    	
    }
    
	@RequestMapping(value="/navermap/send", method=RequestMethod.GET)
	public void test(@RequestParam String data, HttpServletResponse resp) {
		
		try {
			
			resp.setContentType("text/html;charset=UTF-8");
//			System.out.println(data);
			String placename = URLEncoder.encode(data, "UTF-8");
			String coordinate="127.1054328,37.3595963";
				
			String curl = "https://naveropenapi.apigw.ntruss.com/map-place/v1/search?query="+placename
				+ "&coordinate="+coordinate+"";
				
			URL url;
			url = new URL(curl);
			try {
				HttpURLConnection urlconnection = (HttpURLConnection)url.openConnection();
				urlconnection.setRequestProperty("X-NCP-APIGW-API-KEY-ID", "l0hnqofc58");
				urlconnection.setRequestProperty("X-NCP-APIGW-API-KEY", "6sRsSy26mRvrpU4fdb6o3MerZIzdRnIv6yhNcYHf");
				urlconnection.setRequestProperty("Accept", "application/json");

				BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));
				
				String jsonData;
					
				StringBuffer response = new StringBuffer();
					
				while((jsonData = br.readLine())!=null) {
					response.append(jsonData);
				}
					
				br.close();
					
					
				System.out.println("body : "+response.toString());
					
				JsonParser jsonParser = new JsonParser();
					
				String json = response.toString();
					
				JsonObject jobj = (JsonObject)jsonParser.parse(json);
					
				PrintWriter pw = resp.getWriter();
					
				pw.print(jobj);
					
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
}
}
