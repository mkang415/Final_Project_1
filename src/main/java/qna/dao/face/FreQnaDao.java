package qna.dao.face;

import java.util.HashMap;
import java.util.List;

import dto.FreQna;

public interface FreQnaDao {

	List<HashMap<String, Object>> getfreList();

	void write(FreQna freqna);

	FreQna getUpdate(int freqna_idx);

	void setUpdate(FreQna freqna);

	void delete(int freqna_idx);
	
}
