package board.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import dto.Board;
import dto.Image;
import util.BoardPaging;

public interface BoardService {

	BoardPaging getFreePage(int curPage);

	List<HashMap<String, Object>> getFreeList(BoardPaging boardPaging);

	Board freeview(int brdidx, HttpSession session);

	Boolean checkId(HttpSession session, Board freeView);

	void write(Board board, HttpSession session);

}
