package org.alt60m.html.dbio;

import java.sql.*;
import org.alt60m.util.LogHelper;
import org.alt60m.hr.si.model.dbio.SIReference;
import org.alt60m.hr.si.servlet.dbio.SIUtil;
import org.alt60m.wsn.sp.model.dbio.WsnReference;
import org.apache.log4j.Priority;

public class References implements java.io.Serializable {

	String bodyFont = "<FONT FACE=\"Arial\" SIZE=\"1\" COLOR=\"#336699\">";
	String accountNo = "";
	
	//Log Helper Code//
	private static LogHelper logHelper = new LogHelper();
	private void log(Priority p, String msg) { logHelper.log(this.getClass().toString(),p,msg); }
	private void log(Priority p, String msg, java.lang.Throwable t) { logHelper.log(this.getClass().toString(),p,msg,t); }
	//End of Log Helper Code//

	public static final String CURRENT_YEAR = SIUtil.CURRENT_SI_YEAR;

	public References() { }

		public void initReferences(String staffAccountNo) {
			accountNo = staffAccountNo;
			log(Priority.INFO,"References.initReferences(): accountNo=" + accountNo);
		}

		public void setBodyFont(String aValue) {
			bodyFont = aValue;
		}

		public String print() {
			try {
				String strSQL = "";
				String refString = "<!--  -------------------- References MODULE ------------------- --> ";

 		        // display all MS references for this staff
 				refString = refString + "<font size=2><B>Summer Projects</B></font><BR>";
 				if (accountNo.trim().length() == 0) {
 					// many staff login accounts do not have an AccountNo.  So don't pull up matching references; it would be all references without a staffnumber!
 					refString = refString + "<i>None</i><BR>";
 				} else {
 					strSQL = "SELECT r.referenceid, r.formworkflowstatus, p.legalfirstname, p.legallastname"+
 					" FROM wsn_sp_reference as r INNER JOIN wsn_sp_viewApplication as p ON r.fk_WsnApplicationid = p.WsnApplicationid" +
 					" WHERE r.staffnumber='" + accountNo + "' and p.wsnYear='" + CURRENT_YEAR + "' ORDER BY p.legallastname";

 					//Start new query
 						log(Priority.INFO,"References.print(): strSQL=" + strSQL);
 						java.sql.Connection conn2 = org.alt60m.util.DBConnectionFactory.getDatabaseConn();
 						java.sql.Statement stmt2 = conn2.createStatement();
 						ResultSet msResults = stmt2.executeQuery(strSQL);
 					log(Priority.INFO,"References.print(): Number of MS references foundNEW: " + msResults);
 					String _referenceid, _formworkflowstatus, _firstname, _lastname = null;
 					try {
 						while(msResults.next()){
 							_referenceid = msResults.getString("referenceid");
 							_formworkflowstatus = msResults.getString("formworkflowstatus");
 							_firstname = msResults.getString("legalfirstname");
 							_lastname = msResults.getString("legallastname");
 							String name = _firstname + " " + _lastname;
 							log(Priority.INFO,"References NAME="+ name + " status=" + _formworkflowstatus);
 							if (_formworkflowstatus.equals("D"))
 								refString = refString + bodyFont + name + "</font><br>";
 							else {
 								WsnReference ref = new WsnReference();
 								ref.setReferenceID( Integer.valueOf( _referenceid ).intValue() );
 								refString = refString + "<a TARGET='_blank' href='/servlet/MSController?action=refFormEncEdit&encRefID=" + ref.encodeReferenceID() + "'>" + bodyFont + name + "</font></a><br>";
 							}
 
 							}
 						}
 					catch (java.sql.SQLException sqle) {
 						sqle.printStackTrace();
 					}
 					//end new query
 				}

				// display all SI references for this staff
				refString = refString + "<BR><font size=2><B>STINT</B></font><BR>";
				if (accountNo.trim().length() == 0) {
					// many staff login accounts do not have an AccountNo.  So don't pull up matching references; it would be all references without a staffnumber!
					refString = refString + "<i>None</i><BR>";
				} else {
					String currYear = SIUtil.CURRENT_SI_YEAR;
					strSQL = "SELECT r.referenceid, r.formworkflowstatus, p.firstname, p.lastname"+
					" FROM hr_si_reference_" + currYear + " as r INNER JOIN hr_si_application_" + currYear + " as a ON r.fk_siapplicationid = a.applicationid" +
					" INNER JOIN ministry_person as p ON a.fk_sipersonid = p.personid" +
					" WHERE r.staffnumber='" + accountNo + "' and a.siYear='" + CURRENT_YEAR + "' ORDER BY p.lastname";

					//Start new query
					log(Priority.INFO,"References.print(): strSQL=" + strSQL);
					java.sql.Connection conn = org.alt60m.util.DBConnectionFactory.getDatabaseConn();
					java.sql.Statement stmt1 = conn.createStatement();
					ResultSet siResults = stmt1.executeQuery(strSQL);

					log(Priority.INFO,"References.print(): Number of SI references foundNEW: " + siResults);
					
					String _referenceid, _formworkflowstatus, _firstname, _lastname = null;
					try {
						while(siResults.next()){
							_referenceid = siResults.getString("referenceid");
							_formworkflowstatus = siResults.getString("formworkflowstatus");
							_firstname = siResults.getString("firstname");
							_lastname = siResults.getString("lastname");
//							String status = (String) h.get("FormWorkflowStatus");
							String name = _firstname + " " + _lastname;
							log(Priority.INFO,"References NAME="+ name + " status=" + _formworkflowstatus);
							if (_formworkflowstatus.equals("D"))
								refString = refString + bodyFont + name + "</font><br>";
							else {
								SIReference ref = new SIReference();						
								ref.setReferenceID(_referenceid);
								refString = refString + "<a TARGET='_blank' href='/servlet/SIController?action=postRefFormEncEdit&encRefID=" + ref.encodeReferenceID() + "'>" + bodyFont + name + "</font></a><br>";
							}
						}
						siResults.close();
						stmt1.close();
						conn.close();
					} catch (java.sql.SQLException sqle) {
						siResults.close();
						stmt1.close();
						conn.close();
						sqle.printStackTrace();
					}
				}

				refString = refString + "<BR>(Completed references are also listed.)";
				return refString;
			}
			catch (Exception e){
				log(Priority.ERROR,"ReferencesError:",e);
				return("References.print() Error");
			}
		}

	}
