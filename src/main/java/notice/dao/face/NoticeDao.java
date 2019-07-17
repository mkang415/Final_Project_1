package notice.dao.face;

import java.util.List;

import dto.Member;
import dto.Notice;
import dto.NoticeFile;
import util.NoticePaging;

public interface NoticeDao {

	public List<Notice> selectAll(NoticePaging paging);

	public int selectCntAll();

	public void updateHit(Notice notice);

	public Notice selectNoticeByNoticeno(Notice notice);

	public void insertNotice(Notice notice);

	public Member selectMemberbyMemberEmail(String id);

	public void update(Notice notice);

	public void delete(Notice notice);

	public void insertFile(NoticeFile filetest);

	public int selectNoticeno();

	public NoticeFile selectFilebyNoticeno(Notice notice);

	public NoticeFile getFilebyFileNo(int fileno);
}
