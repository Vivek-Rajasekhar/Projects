package com.entity;

public class StateDtls {

    private int stateid;
    private String statename;
    private int year;
    private double stolen;
    private double recovered;
    private double percentager;

    public StateDtls(String statename, int year, double stolen, double recovered) {
        this.statename = statename;
        this.year = year;
        this.stolen = stolen;
        this.recovered = recovered;
        this.percentager = calculatePercentage(stolen, recovered);
    }

    private double calculatePercentage(double stolen, double recovered) {
        if (stolen == 0) {
            return 0.0; // to avoid division by zero
        }
        return (recovered / stolen) * 100.0;
    }
	
	public int getStateid() {
		return stateid;
	}
	public void setStateid(int stateid) {
		this.stateid = stateid;
	}
	public String getStatename() {
		return statename;
	}
	public void setStatename(String statename) {
		this.statename = statename;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public double getStolen() {
		return stolen;
	}
	public void setStolen(double stolen) {
		this.stolen = stolen;
	}
	public double getRecovered() {
		return recovered;
	}
	public void setRecovered(double recovered) {
		this.recovered = recovered;
	}
	public double getPercentager() {
		return percentager;
	}
	public void setPercentager(double percentager) {
		this.percentager = percentager;
	}

	@Override
	public String toString() {
		return "StateDtls [stateid=" + stateid + ", statename=" + statename + ", year=" + year + ", stolen=" + stolen
				+ ", recovered=" + recovered + ", percentager=" + percentager + "]";
	}
	
	
	
}
