package qna.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.FreQna;
import qna.dao.face.FreQnaDao;
import qna.service.face.FreQnaService;

@Service
public class FreQnaServiceImpl implements FreQnaService{

	@Autowired FreQnaDao freQnaDao;
	
	//	자주 묻는 질문 리스트 가져오기
	@Override
	public List<HashMap<String, Object>> getfreList() {
		
		return freQnaDao.getfreList();
	}

	//	자주 묻는 질문 작성
	@Override
	public void write(FreQna freqna) {
		
		freQnaDao.write(freqna);
	}

	//	수정할 자주 묻는 페이지 불러오기
	@Override
	public FreQna getUpdate(int freqna_idx) {
		
		return freQnaDao.getUpdate(freqna_idx);
	}

	//	자주 묻는 페이지 수정 데이터 저장
	@Override
	public void setUpdate(FreQna freqna) {
		
		freQnaDao.setUpdate(freqna);
	}

	//	자주 묻는 페이지 데이터 삭제
	@Override
	public void delete(int freqna_idx) {
	
		freQnaDao.delete(freqna_idx);
		
	}
	
}
