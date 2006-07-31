package org.alt60m.crs.logic;

import java.io.IOException;
import java.sql.SQLException;

public interface ExportWriter {

	public abstract void init(String filename) throws IOException, SQLException;

	public abstract void setExport(Export export);

	public abstract void write() throws IOException, SQLException;

}