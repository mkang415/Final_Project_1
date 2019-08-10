package report.dao.face;

import dto.Report;

public interface ReportDao {

	void boardReport(Report report);

	int getMemberidx(Report report);

}
