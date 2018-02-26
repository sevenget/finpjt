package model.review;

import java.sql.Date;

public class ReviewDto {
	private String writer;
	private int cid;
	private Date reviewdate;
	private String content;
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public Date getReviewdate() {
		return reviewdate;
	}
	public void setReviewdate(Date reviewdate) {
		this.reviewdate = reviewdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "ReviewDto [writer=" + writer + ", cid=" + cid + ", reviewdate=" + reviewdate + ", content=" + content
				+ "]";
	}

	
}
	
