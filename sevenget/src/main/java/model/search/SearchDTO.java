package model.search;

import java.sql.Date;

public class SearchDTO {
	private Date searchDate;
	private String keyword;
	private String searchMem;
	
	public SearchDTO(){}

	public Date getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(Date searchDate) {
		this.searchDate = searchDate;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearchMem() {
		return searchMem;
	}

	public void setSearchMem(String searchMem) {
		this.searchMem = searchMem;
	}
	
	
}
