package org.alt60m.crs.logic;

import java.io.FileWriter;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.alt60m.crs.logic.Export.Table;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class CSVExportWriter implements ExportWriter {
	private static Log log = LogFactory.getLog(CSVExportWriter.class);

	private Export export;

	private FileWriter fileWriter;

	/**
	 * @see org.alt60m.crs.logic.ExportWriter#setFile(java.io.File)
	 */
	public void init(String filename) throws IOException {

		fileWriter = new FileWriter(filename);
	}

	public Export getExport() {
		return export;
	}

	/**
	 * @see org.alt60m.crs.logic.ExportWriter#setExport(org.alt60m.crs.logic.Export)
	 */
	public void setExport(Export export) {
		this.export = export;
	}

	/**
	 * @see org.alt60m.crs.logic.ExportWriter#write()
	 */
	public List<String> write() throws IOException, SQLException {
		List<String> errors = new ArrayList<String>();
		if (export == null) {
			throw new IllegalStateException("Export has not been set!");
		}
		try {
			for (Table table : export.getTables()) {
				writeTableToFile(table, fileWriter);
			}
		} finally {
			fileWriter.close();
		}
		return errors;
	}

	private void writeTableToFile(Table table, FileWriter fileWriter)
			throws IOException, SQLException {

		log.debug("Writing table " + table.getName());

		fileWriter.write(table.getName() + "\n");
		ResultSet rs = table.getData();
		ResultSetMetaData rsmd = rs.getMetaData();
		int colCount = rsmd.getColumnCount();
		StringBuffer lineBuffer = new StringBuffer();
		String tempString;
		Date tempDate;

		// Write Out Header Line
		for (int i = 1; i <= colCount; i++) {
			lineBuffer.append(rsmd.getColumnName(i)).append("\",\"");
		}
		fileWriter.write("\"" + lineBuffer + "\"\n");

		// Write out Data
		while (rs.next()) {
			lineBuffer.setLength(0);
			for (int i = 1; i <= colCount; i++) {
				switch (rsmd.getColumnType(i)) {
				case 93: // datetime
					tempDate = rs.getDate(rsmd.getColumnName(i));
					if (tempDate != null)
						lineBuffer.append(new SimpleDateFormat("MM/dd/yyyy")
								.format(tempDate));
					break;
				default:
					tempString = rs.getString(i);
					if (tempString != null)
						lineBuffer.append(escapeString(tempString));
				}
				lineBuffer.append("\",\"");
			}
			fileWriter.write("\"" + lineBuffer + "\"\n");
		}
		fileWriter.write("\n\n");

	}

	/**
	 * Replaces a double quote character with two double quotes
	 * 
	 * @param inputString
	 * @return
	 * @throws Exception
	 */
	private String escapeString(String inputString) {
		return inputString.replace("\"", "\"\"");
	}
}
