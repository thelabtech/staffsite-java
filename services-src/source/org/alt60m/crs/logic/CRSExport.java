package org.alt60m.crs.logic;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import org.alt60m.util.DBConnectionFactory;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/*******************************************************************************
 * This code was originally written by David Bowdoin, 7/2002 It was almost
 * entirely replaced by Matt Drees, 7/2006
 * 
 ******************************************************************************/

public class CRSExport {
	private static Log log = LogFactory.getLog(CRSExport.class);

	private static CRSExport instance;

	char separatorChar = File.separatorChar;

	private final String templatePath = separatorChar + "database"
			+ separatorChar + "template" + separatorChar;

	private final String downloadPath = separatorChar + "database"
			+ separatorChar + "download" + separatorChar;

	private final String uploadPath = separatorChar + "database"
			+ separatorChar + "upload" + separatorChar;

	private String basePath = "";

	// ********************************************************************************//
	// Public functions
	// ********************************************************************************//
	private CRSExport(String basePath) {
		this.basePath = basePath;
	}

	public static CRSExport getInstance(String basePath) {
		if (instance == null) {
			instance = new CRSExport(basePath);
		}
		return instance; // don't really need, except for synchronized blocks
							// to be useful
	}

	public void initFolders() {
		new File(basePath + downloadPath).mkdir();
		new File(basePath + uploadPath).mkdir();
	}

	public synchronized Hashtable exportToCSV(int conferenceID) {

		String output = "";
		Hashtable<String, String> returnVal = new Hashtable<String, String>();
		String fileName = "Conference" + conferenceID + ".csv";
		String fullFileName = basePath + downloadPath + fileName;
		try {
			SimpleExport simpleExport = new SimpleExport(conferenceID,
					DBConnectionFactory.getDatabaseConn(),
					new CSVExportWriter(), fullFileName);

			simpleExport.export();

			returnVal.put("Status", "Success");
		} catch (SQLException e) {
			log.error(e, e);
			new File(fullFileName).delete();

			SQLException next = e.getNextException();
			if (next == null) {
				log.debug("No chained exceptions");
			}
			while (next != null) {
				log.error("Next exception in chain: ", next);
				next = next.getNextException();
			}
			returnVal.put("Status", "Error");
		} catch (IOException e) {
			log.error(e, e);
			new File(fullFileName).delete();
			returnVal.put("Status", "Error");
		}
		returnVal.put("FileName", fileName);
		returnVal.put("Output", output);
		return returnVal;
	}

	public synchronized Hashtable exportToAccess(int conferenceID,
			String region, String template) {

		List<String> errors = new ArrayList<String>();
		Hashtable<String, Object> returnVal = new Hashtable<String, Object>();
		try {
			String fileName = "Conference" + conferenceID + ".mdb";
			String fullFileName = basePath + downloadPath + fileName;
			returnVal.put("FileName", fileName);
			copyFile(basePath + templatePath + template, basePath
					+ downloadPath + fileName);

			DetailedExport detailedExport = new DetailedExport(conferenceID,
					DBConnectionFactory.getDatabaseConn(),
					new AccessExportWriter(), fullFileName);

			errors = detailedExport.export(region);
			if (errors.size() > 0) {
				returnVal.put("Status", "Partial Success");
			} else {
				returnVal.put("Status", "Success");
			}
		} catch (SQLException e) {
			log.error(e, e);

			SQLException next = e.getNextException();
			if (next == null) {
				log.debug("No chained exceptions");
			}
			while (next != null) {
				log.error("Next exception in chain: ", next);
				next = next.getNextException();
			}
			returnVal.put("Status", "Error");
		} catch (IOException e) {
			log.error(e, e);
			returnVal.put("Status", "Error");
		}
		returnVal.put("Output", errors);
		return returnVal; // Filename of created database
	}

	private void copyFile(String sourceFile, String destinationFile)
			throws IOException {
		BufferedInputStream in = new BufferedInputStream(new FileInputStream(
				sourceFile));
		BufferedOutputStream out = new BufferedOutputStream(
				new FileOutputStream(destinationFile));
		byte[] buf = new byte[1024];
		int len;
		while ((len = in.read(buf)) >= 0) {
			out.write(buf, 0, len);
		}
		in.close();
		out.close();
	}
}
