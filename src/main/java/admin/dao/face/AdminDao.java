package admin.dao.face;

import java.util.HashMap;
import java.util.List;

import dto.Board;
import util.AdminBoardPaging;

public interface AdminDao {

	int selectCntAll();

	List<HashMap<String, Object>> selectAll(AdminBoardPaging ABP);

	void delete(String names);

}
