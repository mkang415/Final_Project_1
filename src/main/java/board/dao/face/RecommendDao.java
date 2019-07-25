package board.dao.face;

import dto.Board;

public interface RecommendDao {

	int selectCountRecommend(Board board);

	void deleteRecommend(Board board);

	void insertRecommend(Board board);

	int selectTotalRecommend(Board board);

}
