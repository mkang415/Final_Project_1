package board.dao.face;

import java.util.HashMap;
import java.util.List;

import dto.Board;
import dto.Image;
import util.BoardPaging;

public interface BoardDao {

	int freeCntAll();

	List<HashMap<String, Object>> getFreeList(BoardPaging boardPaging);

	Board freeView(int brdidx);

	void hitPlus(int brdidx);

	void write(Board board);

	void imgSave(Image image);

	Board getUpdate(int board_idx);

	void setUpdate(Board board);

	void delete(int board_idx);

}
