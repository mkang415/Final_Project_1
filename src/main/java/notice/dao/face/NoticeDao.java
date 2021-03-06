package notice.dao.face;

import java.util.HashMap;
import java.util.List;

import dto.Notice;
import dto.NoticeFile;
import util.NoticePaging;

public interface NoticeDao {

	public List<Notice> selectAll(NoticePaging paging);

	public int selectCntAll(String select, String search);

	public void updateHit(Notice notice);

	public Notice selectNoticeByNoticeno(Notice notice);

	public void insertBoard(Notice notice);


	public void insertFile(NoticeFile filetest);

	public NoticeFile getFilebyFileNo(int fileno);

	public NoticeFile selectFilebynotice_idx(Notice notice);

	public void update(Notice notice);

	public void delete(Notice notice);

	public List<Notice> mainSelectAll();

	public List<HashMap<String, Object>> mainqnaList(); 

}
