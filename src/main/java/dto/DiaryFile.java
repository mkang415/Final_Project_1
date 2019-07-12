package dto;

public class DiaryFile {
	private int file_idx;
	private int diary_idx;
	private String originname;
	private String storename;
	private int filesize;
	@Override
	public String toString() {
		return "DiaryFile [file_idx=" + file_idx + ", diary_idx=" + diary_idx + ", originname=" + originname
				+ ", storename=" + storename + ", filesize=" + filesize + "]";
	}
	public int getFile_idx() {
		return file_idx;
	}
	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}
	public int getDiary_idx() {
		return diary_idx;
	}
	public void setDiary_idx(int diary_idx) {
		this.diary_idx = diary_idx;
	}
	public String getOriginname() {
		return originname;
	}
	public void setOriginname(String originname) {
		this.originname = originname;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	
}
