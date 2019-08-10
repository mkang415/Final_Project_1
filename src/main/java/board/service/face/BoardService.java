package board.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import dto.Board;
import dto.Image;
import dto.Recommend;
import util.BoardPaging;

public interface BoardService {

	BoardPaging getFreePage(int curPage, BoardPaging search);

	List<HashMap<String, Object>> getFreeList(BoardPaging boardPaging);

	Board freeview(int brdidx, HttpSession session);

	Boolean checkId(HttpSession session, Board freeView);

	void write(HttpSession session, Board board);

	Image imgSave(MultipartFile fileupload, ServletContext context, HttpSession session);

	Board getUpdate(int brdidx);

	void setUpdate(Board board);

	void delete(int brdidx);

	BoardPaging getEpilPage(int curPage, BoardPaging search);

	List<HashMap<String, Object>> getEpilList(BoardPaging boardPaging);

	BoardPaging getPhotoPage(int curPage, BoardPaging search);

	List<HashMap<String, Object>> getPhotoList(BoardPaging boardPaging);

	Image getImage(String storename);

	void setBrdidx(Image setImage, Integer integer);

	void deleteImg(int brdidx);

	void delnullimg(HttpSession session);

	int getRecoCnt(String board_idx);

	boolean checkReco(int board_idx, HttpSession session);

	void unreco(Recommend recommend);

	void reco(Recommend recommend);

	int getmemidx(int board_idx);

}
