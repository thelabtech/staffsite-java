package org.alt60m.staffSite.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class InfobaseBookmark extends DBIOEntity {

	private int id = 0;
    private String name = "";
    private String value = "";
	private int user_id = 0;


	public InfobaseBookmark(String id) {
		this.id = Integer.parseInt(id);
		select();
	}
	public InfobaseBookmark() { }


	public boolean isPKEmpty() { return id == 0; }
	public boolean persist() { return isPKEmpty() ? insert() : update(); }

	public void localinit() throws DBIOEntityException {
		String table = "infobase_bookmarks";

		setMetadata("Id","id","IDENTITY");
		setMetadata("Name","name",table);
		setMetadata("Value","value",table);
		setMetadata("User_id","user_id","KEY");

		setAutodetectProperties(false);
	}

	public int getId() {
	        return id;
	}
	public void setId(String id) {
	        this.id = Integer.parseInt(id);
	}
	public String getName() {
	        return name;
	}
	public void setName(String name) {
	        this.name = name;
	}
	public String getValue() {
	        return value;
	}
	public void setValue(String value) {
	        this.value = value;
	}

// Associations
	public int getUser_id() { return user_id; }
	public void setUser_id(String user_id) { this.user_id = Integer.parseInt(user_id); }
}
