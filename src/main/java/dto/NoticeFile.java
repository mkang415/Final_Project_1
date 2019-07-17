package dto;

public class NoticeFile {

	private int fileno;
	private String title;
	private String origin_name;
	private String stored_name;
	private int notice_idx;

	
	@Override
	public String toString() {
		return "NoticeFile [fileno=" + fileno + ", title=" + title + ", origin_name=" + origin_name + ", stored_name="
				+ stored_name + ", notice_idx=" + notice_idx + "]";
	}
	public int getFileno() {
		return fileno;
	}
	public void setFileno(int fileno) {
		this.fileno = fileno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOrigin_name() {
		return origin_name;
	}
	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}
	public String getStored_name() {
		return stored_name;
	}
	public void setStored_name(String stored_name) {
		this.stored_name = stored_name;
	}
	public int getNoticeno() {
		return notice_idx;
	}
	public void setNoticeno(int noticeno) {
		this.notice_idx = noticeno;
	}
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	
	
	
		
}
