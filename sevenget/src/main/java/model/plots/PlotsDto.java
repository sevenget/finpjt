package model.plots;

import java.sql.Date;

public class PlotsDto {
	String memid;
	String plotpng;
	Date savedtime;
	
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
	public Date getSavedtime() {
		return savedtime;
	}
	public void setSavedtime(Date savedtime) {
		this.savedtime = savedtime;
	}
}
