package data.dto;

import java.sql.Timestamp;

public class GusetDto {
	private String num;
	private String myid;
	private String contetn;

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getMyid() {
		return myid;
	}

	public void setMyid(String myid) {
		this.myid = myid;
	}

	public String getContetn() {
		return contetn;
	}

	public void setContetn(String contetn) {
		this.contetn = contetn;
	}

	public String getPhotoname() {
		return photoname;
	}

	public void setPhotoname(String photoname) {
		this.photoname = photoname;
	}

	public int getChu() {
		return chu;
	}

	public void setChu(int chu) {
		this.chu = chu;
	}

	public Timestamp getWriteday() {
		return writeday;
	}

	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}

	private String photoname;
	private int chu;
	private Timestamp writeday;
}
