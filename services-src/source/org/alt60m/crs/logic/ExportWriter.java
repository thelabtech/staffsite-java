package org.alt60m.crs.logic;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public interface ExportWriter {

	public abstract void init(String filename) throws IOException, SQLException;

	public abstract void setExport(Export export);

	public abstract List<String> write() throws IOException, SQLException;

}