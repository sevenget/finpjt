package model.company;

public class CompanyBasicDTO {
	int cid;
	String clogo;
	String cname;
	String cmission;
	int sales;
	String salsesource;
	String cdiscription;
	int interestedTimes;
	
	public CompanyBasicDTO(){	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getClogo() {
		return clogo;
	}

	public void setClogo(String clogo) {
		this.clogo = clogo;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCmission() {
		return cmission;
	}

	public void setCmission(String cmission) {
		this.cmission = cmission;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public String getSalsesource() {
		return salsesource;
	}

	public void setSalsesource(String salsesource) {
		this.salsesource = salsesource;
	}

	public String getCdiscription() {
		return cdiscription;
	}

	public void setCdiscription(String cdiscription) {
		this.cdiscription = cdiscription;
	}

	public int getInterestedTimes() {
		return interestedTimes;
	}

	public void setInterestedTimes(int interestedTimes) {
		this.interestedTimes = interestedTimes;
	}
	
	
}
