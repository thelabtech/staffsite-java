package org.alt60m.crs.logic;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class Export {

	public class Table {
		private String name;

		private ResultSet data;

		private Collection<String> booleanColumns = new ArrayList<String>();

		public Table(String name, ResultSet data) {
			this.name = name;
			this.data = data;
		}

		public ResultSet getData() {
			return data;
		}

		public String getName() {
			return name;
		}

		public boolean isColumnBoolean(String columnName) {
			return booleanColumns.contains(columnName);
		}

		public void setColumnAsBoolean(String columnName) {
			booleanColumns.add(columnName);
		}

		public void setColumnsAsBoolean(Collection<String> columnNames) {
			if (columnNames != null) {
				booleanColumns.addAll(columnNames);
			}
		}
	}

	private List<Table> tables = new ArrayList<Table>();

	public boolean add(Table o) {
		return tables.add(o);
	}

	public Table get(int index) {
		return tables.get(index);
	}

	public boolean isEmpty() {
		return tables.isEmpty();
	}

	public Iterator<Table> iterator() {
		return tables.iterator();
	}

	public int size() {
		return tables.size();
	}

	public List<Table> getTables() {
		return Collections.unmodifiableList(tables);
	}

}
