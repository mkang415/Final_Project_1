package dto;

public class Image {
	private int image_idx;
	private int board_idx;
	private String originname;
	private String storename;
	private int filesize;
	@Override
	public String toString() {
		return "Image [image_idx=" + image_idx + ", board_idx=" + board_idx + ", originname=" + originname
				+ ", storename=" + storename + ", filesize=" + filesize + "]";
	}
	public int getImage_idx() {
		return image_idx;
	}
	public void setImage_idx(int image_idx) {
		this.image_idx = image_idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
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
