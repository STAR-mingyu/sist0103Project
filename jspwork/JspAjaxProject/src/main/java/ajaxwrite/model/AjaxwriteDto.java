package ajaxwrite.model;

import java.sql.Timestamp;

public class AjaxwriteDto {
	private String num;
	private String witer;
	private String subject;
	private String story;

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getWiter() {
		return witer;
	}

	public void setWiter(String witer) {
		this.witer = witer;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getStory() {
		return story;
	}

	public void setStory(String story) {
		this.story = story;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public Timestamp getWriteday() {
		return writeday;
	}

	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}

	private String image;
	private int likes;
	private Timestamp writeday;
}
