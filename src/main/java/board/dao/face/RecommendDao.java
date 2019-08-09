package board.dao.face;

import dto.Board;
import dto.Recommend;

public interface RecommendDao {

	int getRecoCnt(int brdidx);

	int checkReco(Recommend recommend);

	void unreco(Recommend recommend);

	void reco(Recommend recommend);

}
