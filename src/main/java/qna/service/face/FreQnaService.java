package qna.service.face;

import java.util.HashMap;
import java.util.List;

import dto.FreQna;

public interface FreQnaService {

	List<HashMap<String, Object>> getfreList();

	void write(FreQna freqna);

	FreQna getUpdate(int freqna_idx);

	void setUpdate(FreQna freqna);

	void delete(int index);

}
