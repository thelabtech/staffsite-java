package org.alt60m.crs.logic;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import org.alt60m.util.DBConnectionFactory;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/*******************************************************************************
 * This code was originally written by David Bowdoin, 7/2002
 * It was almost entirely replaced by Matt Drees, 7/2006
 * 
 ******************************************************************************/

public class CRSImportExport {
	private static Log log = LogFactory.getLog(CRSImportExport.class); 

	private static CRSImportExport instance;
	
	char separatorChar = File.separatorChar;
	private final String templatePath = separatorChar + "database" + separatorChar + "template" + separatorChar;

	private final String downloadPath = separatorChar + "database" + separatorChar + "download" + separatorChar;

	private final String uploadPath = separatorChar + "database" + separatorChar + "upload" + separatorChar;

	private String basePath = "";


	//********************************************************************************//
	// Public functions
	//********************************************************************************//
	private CRSImportExport(String basePath) {
		this.basePath = basePath;
	}

	public static CRSImportExport getInstance(String basePath) {
		if ( instance == null ) {
			instance = new CRSImportExport(basePath);
		}
		return instance; //don't really need, except for synchronized blocks to be useful
	}

	public void initFolders() {
		new File(basePath + downloadPath).mkdir();
		new File(basePath + uploadPath).mkdir();
	}
	
	public synchronized Hashtable exportToCSV(int conferenceID) throws Exception {

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
		} catch (Exception e) {
			log.error(e, e);
			new File(fullFileName).delete();
			returnVal.put("Status", "Error");
		}
		returnVal.put("FileName", fileName);
		returnVal.put("Output", output);
		return returnVal;
	}


	public synchronized Hashtable exportToAccess(int conferenceID, String region,
			String template) throws IOException {

		
		
		
		String output = "";
		Hashtable<String, String> returnVal = new Hashtable<String, String>();
		try {
			String fileName = "Conference" + conferenceID + ".mdb"; 
			String fullFileName = basePath + downloadPath + fileName;
			returnVal.put("FileName", fileName);
			copyFile(basePath + templatePath + template, basePath
					+ downloadPath + fileName);
			
			
			DetailedExport simpleExport = new DetailedExport(conferenceID,
					DBConnectionFactory.getDatabaseConn(),
					new AccessExportWriter(), fullFileName);
			
			simpleExport.export(region);
			
			returnVal.put("Status", "Success");
		}
		catch (SQLException e) {
			
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
		}
		returnVal.put("Output", output);
		return returnVal; //Filename of created database
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
