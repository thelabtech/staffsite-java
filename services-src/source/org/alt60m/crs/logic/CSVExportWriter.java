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

import com.csvreader.CsvWriter;

public class CSVExportWriter implements ExportWriter {
	private static Log log = LogFactory.getLog(CSVExportWriter.class);

	private Export export;
	private CsvWriter csvWriter;
	
	/**
	 * @see org.alt60m.crs.logic.ExportWriter#setFile(java.io.File)
	 */
	public void init(String filename) throws IOException {

		csvWriter = new CsvWriter(new FileWriter(filename), ',');
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
				writeTableToFile(table, csvWriter);
			}
		} finally {
			csvWriter.close();
		}
		return errors;
	}

	private void writeTableToFile(Table table, CsvWriter csvWriter)
			throws IOException, SQLException {

		log.debug("Writing table " + table.getName());

		csvWriter.write(table.getName());
		csvWriter.endRecord();
		ResultSet rs = table.getData();
		ResultSetMetaData rsmd = rs.getMetaData();
		int colCount = rsmd.getColumnCount();
		String data;
		Date tempDate;

		// Write Out Header Line
		for (int i = 1; i <= colCount; i++) {
			csvWriter.write(rsmd.getColumnName(i));
		}
		csvWriter.endRecord();
		
		// Write out Data
		while (rs.next()) {
			for (int i = 1; i <= colCount; i++) {
				data = null;
				switch (rsmd.getColumnType(i)) {
				case 93: // datetime
					tempDate = rs.getDate(rsmd.getColumnName(i));
					if (tempDate != null) {
						data = new SimpleDateFormat("MM/dd/yyyy")
								.format(tempDate);
					}
					break;
				default:
					data = rs.getString(i);
				}
				csvWriter.write(data);
			}
			csvWriter.endRecord();
		}
		csvWriter.endRecord();
		csvWriter.endRecord();
	}
}
