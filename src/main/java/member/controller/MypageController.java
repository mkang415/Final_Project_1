package member.controller;

import java.io.FileOutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.Diary;
import member.service.face.MypageService;


@Controller
public class MypageController {

	@Autowired MypageService mypageService;
	
	//마이페이지
	@RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
	public String myview(
			Diary viewDiary,
			Model model,
			HttpSession session
			) {
		
		viewDiary = mypageService.diaryView(viewDiary);
		model.addAttribute("view", viewDiary);
		return "/member/mypage";
	}



    @RequestMapping(value = "/schedule/calendar", method=RequestMethod.POST) 
	public String pdf(Model model, HttpServletResponse response, HttpServletRequest request) throws Exception  {
    	
    	String binaryData = request.getParameter("imgSrc"); 
    	FileOutputStream stream = null; 
		
    	JSONObject obj = new JSONObject();
    	
    	try{ System.out.println("binary file " + binaryData); 
		
    	if(binaryData == null || binaryData=="") { 
			throw new Exception(); 
		} 
			binaryData = binaryData.replaceAll("data:image/png;base64,", ""); 
			byte[] file = Base64.decodeBase64(binaryData); 
			System.out.println("file :::::::: " + file + " || " + file.length); 
			String fileName= UUID.randomUUID().toString(); 
			stream = new FileOutputStream("D:\\ex"+fileName+".png"); 
			stream.write(file); stream.close(); 
			System.out.println("파일 작성 완료"); 
			obj.put("result", 1); 
		}catch(Exception e){ 
			System.out.println("파일이 정상적으로 넘어오지 않았습니다"); 
			obj.put("result", 0); 
		}finally{ 
			stream.close(); 
		} 
    	
		
		
		
		
		return obj.toString();
		
		
	}


















}





















