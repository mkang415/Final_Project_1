package dto;

import java.sql.Date;

public class Image {
	private int image_idx;
	private String originname;
	private String storename;
	private long filesize;
	private int board_idx;
	private int member_idx;
	
	@Override
	public String toString() {
		return "Image [image_idx=" + image_idx + ", originname=" + originname + ", storename=" + storename
				+ ", filesize=" + filesize + ", board_idx=" + board_idx + ", member_idx=" + member_idx + "]";
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public int getBoard_idx() {
		return board_idx;
	}


	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}


	public int getImage_idx() {
		return image_idx;
	}

	public void setImage_idx(int image_idx) {
		this.image_idx = image_idx;
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

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}

}
