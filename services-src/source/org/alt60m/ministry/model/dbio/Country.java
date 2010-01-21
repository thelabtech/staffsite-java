package org.alt60m.ministry.model.dbio;

import java.util.*;
import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class Country extends DBIOEntity {
	private int id = 0;
	private String country = "";
	private String code = "";
	private boolean closed;
	private String iso_code = "";
	
	public Country (int countryID) {
		id = countryID;
		select();
	}
	
	public Country () {
	}
	
	public void localinit() throws DBIOEntityException {
		String table = "countries";

		setMetadata("Id", "id", "IDENTITY");

		setMetadata("Country", "country", table);
		setMetadata("Code", "code", table);
		setMetadata("Closed", "closed", table);
		setMetadata("Iso_code", "iso_code", table);

		setAutodetectProperties(false);
	}

	public boolean isPKEmpty() {
		return getId() == 0;
	}
	
	public boolean persist(){
		return isPKEmpty() ? insert() : update();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public boolean isClosed() {
		return closed;
	}
	
	public boolean getClosed() {
		return isClosed();
	}

	public void setClosed(boolean closed) {
		this.closed = closed;
	}

	public String getIso_code() {
		return iso_code;
	}

	public void setIso_code(String isoCode) {
		iso_code = isoCode;
	}
	
	@SuppressWarnings("unchecked")
	public static SortedMap<String, String> getAllCountries() {
		Country c = new Country();
		Vector<Country> v = c.selectList("country is not null");
		SortedMap<String, String> countries = new TreeMap<String, String>();
		for(Country country : v) {
			countries.put(country.getCountry(), country.getCode());
		}
		return countries;
	}
}
