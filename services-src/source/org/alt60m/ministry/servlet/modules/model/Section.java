package org.alt60m.ministry.servlet.modules.model;
import java.util.Hashtable;
import java.util.Vector;
public class Section {
	public Section(){
		this.rows=new Vector<Hashtable<String,Object>>();
	}
	private String type;
	public String getType(){
		return this.type;
	}
	public void setType(String type){
		this.type=type;
	}
	private String name;
	public String getName(){
		return this.name;
	}
	public void setName(String name){
		this.name=name;
	}
	private Vector<Hashtable<String,Object>>rows;
	public Vector<Hashtable<String,Object>> getRows(){
		return this.rows;
	}
	public void addRow(Hashtable<String,Object> row){
		this.rows.add(row);
	}
}
