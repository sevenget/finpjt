package com.sevenget.PlotsDTO;

import java.sql.Date;

public class PlotsDto {
	String memid;
	String plotpng;
	Date savedTime;
	
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getPlotpng() {
		return plotpng;
	}
	public void setPlotpng(String plotpng) {
		this.plotpng = plotpng;
	}
	public Date getSavedTime() {
		return savedTime;
	}
	public void setSavedTime(Date savedTime) {
		this.savedTime = savedTime;
	}
}
