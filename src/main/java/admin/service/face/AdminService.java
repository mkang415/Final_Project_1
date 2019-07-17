package admin.service.face;

import java.util.HashMap;
import java.util.List;

import dto.Board;
import util.AdminBoardPaging;

public interface AdminService {

	AdminBoardPaging getCurpage(int curPage);

	List<HashMap<String, Object>> select(AdminBoardPaging ABP);

	void delete(String names);

}
