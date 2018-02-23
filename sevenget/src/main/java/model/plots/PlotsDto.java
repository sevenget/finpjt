package model.plots;

import java.sql.Date;

public class PlotsDto {
	String memid;
	int cid;
	String plotpng;
	Date SavedTime;
	
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getPlotpng() {
		return plotpng;
	}
	public void setPlotpng(String plotpng) {
		this.plotpng = plotpng;
	}
	public Date getSavedTime() {
		return SavedTime;
	}
	public void setSavedTime(Date SavedTime) {
		this.SavedTime = SavedTime;
	}
}
