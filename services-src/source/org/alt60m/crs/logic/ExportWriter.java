package org.alt60m.crs.logic;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

public interface ExportWriter {

	public abstract void setFile(File file) throws IOException;

	public abstract void setExport(Export export);

	public abstract void write() throws IOException, SQLException;

}