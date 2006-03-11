package org.alt60m.crs.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class Report extends DBIOEntity {
	// IDENTITY
	private int reportID;

	private String name = "";

	private String sorts = "";

	private String sortNames = "";

	private String query = "";

	private String xsl = "";

	private int reportGroup;

	public static String[] reportGroupNames = { "General Reports",
			"Student Reports", "Staff Reports", "Guest Reports" };

	public Report() {
	}

	public void localinit() throws DBIOEntityException {
		String table = "crs_Report";
		setMetadata("ReportID", "reportID", "IDENTITY");

		setMetadata("Name", "name", table);
		setMetadata("SortNames", "sortNames", table);
		setMetadata("Sorts", "sorts", table);
		setMetadata("Query", "query", table);
		setMetadata("XSL", "xsl", table);
		setMetadata("ReportGroup", "reportGroup", table);

		setAutodetectProperties(false);
	}

	public boolean isPKEmpty() {
		return reportID == 0;
	}

	public int getReportID() {
		return reportID;
	}

	public void setReportID(int reportID) {
		this.reportID = reportID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSortNames() {
		return sortNames;
	}

	public void setSortNames(String name) {
		this.sortNames = name;
	}

	public String getSorts() {
		return sorts;
	}

	public void setSorts(String sorts) {
		this.sorts = sorts;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public String getXSL() {
		return xsl;
	}

	public void setXSL(String xsl) {
		this.xsl = xsl;
	}

	public int getReportGroup() {
		return reportGroup;
	}

	public void setReportGroup(int reportGroup) {
		this.reportGroup = reportGroup;
	}
}