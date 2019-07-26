package board.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import dto.Board;
import dto.Image;
import util.BoardPaging;

public interface BoardService {

	BoardPaging getFreePage(int curPage, BoardPaging search);

	List<HashMap<String, Object>> getFreeList(BoardPaging boardPaging);

	Board freeview(int brdidx, HttpSession session);

	Boolean checkId(HttpSession session, Board freeView);

	void write(Board board, HttpSession session);

	String imgSave(MultipartFile fileupload, ServletContext context);

	Board getUpdate(int brdidx);

	void setUpdate(Board board);

	void delete(int brdidx);

	boolean recommend(Board board);

	int getRecommend(Board board);

	BoardPaging getEpilPage(int curPage, BoardPaging search);

	List<HashMap<String, Object>> getEpilList(BoardPaging boardPaging);

}
