package board.dao.face;

import java.util.HashMap;
import java.util.List;

import dto.Board;
import dto.Image;
import util.BoardPaging;

public interface BoardDao {

	int freeCnt(BoardPaging search);

	List<HashMap<String, Object>> getFreeList(BoardPaging boardPaging);

	Board freeView(int brdidx);

	void hitPlus(int brdidx);

	void write(Board board);

	void imgSave(Image image);

	Board getUpdate(int board_idx);

	void setUpdate(Board board);

	void delete(int board_idx);

	void setRecommend(Board board);

	int epilCnt(BoardPaging search);

	List<HashMap<String, Object>> getEpilList(BoardPaging boardPaging);

	int photoCnt(BoardPaging search);

	List<HashMap<String, Object>> getPhotoList(BoardPaging boardPaging);

	Image getImage(String storename);

	void setBrdidx(Image setImage);

	void deleteImg(int board_idx);

	void delnullimg(int member_idx);

	int getmemidx(int board_idx);

	List<HashMap<String, Object>> getimgList(int board_idx);
}
