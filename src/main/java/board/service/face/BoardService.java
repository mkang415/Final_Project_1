package board.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import dto.Board;
import util.BoardPaging;

public interface BoardService {

	BoardPaging getFreePage(int curPage);

	List<HashMap<String, Object>> getFreeList(BoardPaging boardPaging);

	Board freeview(int brdidx, HttpSession session);

}
