package model.search;

import java.util.HashMap;
import java.util.Map;

public class FilterDTO {
	private String dateget;
	private String marryget;
	private String babyget;
	private String houseget;
	private String relationget;
	private String dreamget;
	private String hopeget;

	private String dateloss;
	private String marryloss;
	private String babyloss;
	private String houseloss;
	private String relationloss;
	private String dreamloss;
	private String hopeloss;

	public FilterDTO() {
	}

	public String getDateget() {
		return dateget;
	}

	public void setDateget(String dateget) {
		this.dateget = dateget;
	}

	public String getMarryget() {
		return marryget;
	}

	public void setMarryget(String marryget) {
		this.marryget = marryget;
	}

	public String getBabyget() {
		return babyget;
	}

	public void setBabyget(String babyget) {
		this.babyget = babyget;
	}

	public String getHouseget() {
		return houseget;
	}

	public void setHouseget(String houseget) {
		this.houseget = houseget;
	}

	public String getRelationget() {
		return relationget;
	}

	public void setRelationget(String relationget) {
		this.relationget = relationget;
	}

	public String getDreamget() {
		return dreamget;
	}

	public void setDreamget(String dreamget) {
		this.dreamget = dreamget;
	}

	public String getHopeget() {
		return hopeget;
	}

	public void setHopeget(String hopeget) {
		this.hopeget = hopeget;
	}

	public String getDateloss() {
		return dateloss;
	}

	public void setDateloss(String dateloss) {
		this.dateloss = dateloss;
	}

	public String getMarryloss() {
		return marryloss;
	}

	public void setMarryloss(String marryloss) {
		this.marryloss = marryloss;
	}

	public String getBabyloss() {
		return babyloss;
	}

	public void setBabyloss(String babyloss) {
		this.babyloss = babyloss;
	}

	public String getHouseloss() {
		return houseloss;
	}

	public void setHouseloss(String houseloss) {
		this.houseloss = houseloss;
	}

	public String getRelationloss() {
		return relationloss;
	}

	public void setRelationloss(String relationloss) {
		this.relationloss = relationloss;
	}

	public String getDreamloss() {
		return dreamloss;
	}

	public void setDreamloss(String dreamloss) {
		this.dreamloss = dreamloss;
	}

	public String getHopeloss() {
		return hopeloss;
	}

	public void setHopeloss(String hopeloss) {
		this.hopeloss = hopeloss;
	}

	public Map getFilterMap() {
		HashMap map = new HashMap();

		if (dateget!=null && dateget.equals("T")) {
			map.put("dateget", "T");
		} else {
			map.put("dateget", "F");
		}

		if (marryget!= null &&marryget.equals("T")) {
			map.put("marryget", "T");
		} else {
			map.put("marryget", "F");
		}

		if (babyget!= null&&babyget.equals("T")) {
			map.put("babyget", "T");
		} else {
			map.put("babyget", "F");
		}

		if (houseget!= null&&houseget.equals("T")) {
			map.put("houseget", "T");
		} else {
			map.put("houseget", "F");
		}

		if (relationget!= null&&relationget.equals("T")) {
			map.put("relationget", "T");
		} else {
			map.put("relationget", "F");
		}
		if (dreamget!= null&&dreamget.equals("T")) {
			map.put("dreamget", "T");
		} else {
			map.put("dreamget", "F");
		}

		if (hopeget!= null&&hopeget.equals("T")) {
			map.put("hopeget", "T");
		} else {
			map.put("hopeget", "F");
		}

		if (dateloss!= null&&dateloss.equals("X")) {
			map.put("dateloss", "T");
		} else {
			map.put("dateloss", "F");
		}

		if (marryloss!= null&&marryloss.equals("X")) {
			map.put("marryloss", "T");
		} else {
			map.put("marryloss", "F");
		}
		
		if (babyloss!= null&&babyloss.equals("X")) {
			map.put("babyloss", "T");
		} else {
			map.put("babyloss", "F");
		}
		
		if (houseloss!= null&&houseloss.equals("X")) {
			map.put("houseloss", "T");
		} else {
			map.put("houseloss", "F");
		}
		
		if (relationloss!= null&&relationloss.equals("X")) {
			map.put("relationloss", "T");
		} else {
			map.put("relationloss", "F");
		}

		if (dreamloss!= null&&dreamloss.equals("X")) {
			map.put("dreamloss", "T");
		} else {
			map.put("dreamloss", "F");
		}

		if (hopeloss!= null&&hopeloss.equals("X")) {
			map.put("hopeloss", "T");
		} else {
			map.put("hopeloss", "F");
		}

		return map;
	}
	// 나중에 점검 필요
	// public String toString(){
	// }
}
