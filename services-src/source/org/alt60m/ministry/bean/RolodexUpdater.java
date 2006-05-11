package org.alt60m.ministry.bean;

import java.sql.*;
import java.util.*;
import org.alt60m.util.LogHelper;
import org.alt60m.ministry.model.dbio.*;
import org.apache.log4j.Priority;

/**
 * Staff Updater
 *		
 * @author Mark Petrotta
 * 
 */

public class RolodexUpdater {
	private static final String ROLODEX_TBL = "ministry_Rolodex";
	private static final String CRS_TBL = "crs_CRSPerson";
	private static final String EVENT_TBL = "event_EventPerson";
	private static final String STINT_TBL = "ministry_Person";
	private static final String LINCZONE_TBL = "linczone_Contacts";
	private static final String STAFF_TBL = "ministry_Staff";
	private static final String USSP_TBL = "ussp_Student";
	private static final String USSP01_TBL = "ussp_Student01";
	private static final String WSN_TBL = "wsn_sp_viewApplication";
    
		//Log Helper Code//
	private static LogHelper logHelper = new LogHelper();
	private void log(Priority p, String msg) { logHelper.log(this.getClass().toString(),p,msg); }
	private void log(Priority p, String msg, java.lang.Throwable t) { logHelper.log(this.getClass().toString(),p,msg,t); }
	private void log(String msg) { logHelper.log(this.getClass().toString(),msg); }
	//End of Log Helper Code//

    public RolodexUpdater() {    }
    
	private static Connection _connection;
	private static Statement _statement;
	private static ResultSet _resultset;	
	private static Statement _rolodexstatement;
	private static ResultSet _rolodexresultset;	
    private static String _query;
    private static Hashtable rolodexHash = new Hashtable();
    
    private void beginConnection() throws Exception {
		try {
			_connection = org.alt60m.util.DBConnectionFactory.getDatabaseConn();
			_statement = _connection.createStatement();
			_rolodexstatement = _connection.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
    }
    private void endConnection() throws Exception {
		try {
			_rolodexstatement.close();
			_statement.close();
			_connection.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
    }

    private String checkNote(ResultSet resultSet) {
		try {
			String note = resultSet.getString("note");
			if (note != null) {
				int firstIndexOfEmail = 0;
				int lastIndexOfEmail = 0;
				
				firstIndexOfEmail = note.indexOf("email:  ");
				if (firstIndexOfEmail >= 0) {
					firstIndexOfEmail = firstIndexOfEmail + 8;
				}
				lastIndexOfEmail = note.indexOf(";", firstIndexOfEmail);
				
				if (firstIndexOfEmail >= 8) {
					if (lastIndexOfEmail < 0) {
						return note.substring(firstIndexOfEmail);
					} else {
						return note.substring(firstIndexOfEmail, lastIndexOfEmail);
					}    		
				} else {
					return "";    		
				}
			} else {
				return "";
			}
		} catch (SQLException e) {
			log("error trying to get note.  assuming okay, and moving on");
			return "";
		}
    }

    public void getCurrentList() {
    	rolodexHash = new Hashtable();
		try {
			_query = "SELECT rolodexid, firstname, lastname, email, crspersonid, eventpersonid, sipersonid, linczonecontactid, staffaccountno, usspstudentid, ussp01studentid, wsnsppersonid " +
						"FROM "+ROLODEX_TBL+" " +
						"WHERE LENGTH(firstname)>0 OR LENGTH(lastname)>0 OR LENGTH(email)>0 " +
						"ORDER BY lastname, firstname";
			_rolodexresultset = _rolodexstatement.executeQuery(_query);
			while (_rolodexresultset.next()) {
				String key = _rolodexresultset.getString("firstname")+", "+_rolodexresultset.getString("lastname")+", "+_rolodexresultset.getString("email");
				Hashtable rolodexIndiv = new Hashtable();
				rolodexIndiv.put("rolodexid", _rolodexresultset.getString("rolodexid"));
				if ((_rolodexresultset.getString("crspersonid")!=null) && 
					(_rolodexresultset.getString("crspersonid").length()>0)) {
						rolodexIndiv.put("crspersonid", _rolodexresultset.getString("crspersonid"));
				}
				if ((_rolodexresultset.getString("eventpersonid")!=null) && 
					(_rolodexresultset.getString("eventpersonid").length()>0)) {
						rolodexIndiv.put("eventpersonid", _rolodexresultset.getString("eventpersonid"));
				}
				if ((_rolodexresultset.getString("sipersonid")!=null) && 
					(_rolodexresultset.getString("sipersonid").length()>0)) {
						rolodexIndiv.put("sipersonid", _rolodexresultset.getString("sipersonid"));
				}
				if ((_rolodexresultset.getString("linczonecontactid")!=null) && 
					(_rolodexresultset.getString("linczonecontactid").length()>0)) {
						rolodexIndiv.put("linczonecontactid", _rolodexresultset.getString("linczonecontactid"));
				}
				if ((_rolodexresultset.getString("staffaccountno")!=null) && 
					(_rolodexresultset.getString("staffaccountno").length()>0)) {
						rolodexIndiv.put("staffaccountno", _rolodexresultset.getString("staffaccountno"));
				}
				if ((_rolodexresultset.getString("usspstudentid")!=null) && 
					(_rolodexresultset.getString("usspstudentid").length()>0)) {
						rolodexIndiv.put("usspstudentid", _rolodexresultset.getString("usspstudentid"));
				}
				if ((_rolodexresultset.getString("ussp01studentid")!=null) && 
					(_rolodexresultset.getString("ussp01studentid").length()>0)) {
						rolodexIndiv.put("ussp01studentid", _rolodexresultset.getString("ussp01studentid"));
				}
				if ((_rolodexresultset.getString("wsnsppersonid")!=null) && 
					(_rolodexresultset.getString("wsnsppersonid").length()>0)) {
						rolodexIndiv.put("wsnsppersonid", _rolodexresultset.getString("wsnsppersonid"));
				}
				rolodexHash.put(key, rolodexIndiv);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
        
	public void updateCrsPerson() throws Exception {
		beginConnection();
		getCurrentList();
		try {
			_query = "SELECT personID as sourcekey, " +
							"firstName as firstname, " +
							"middleInitial as middleInitial, " +
							"lastName as lastname, " +
							"address1 as address, " +
							"address2 as address2, " +
							"city as city, " +
							"state as state, " +
							"zip as zip, " +
							"gender as gender, " +
							"homePhone as phone, " +
							"email as email, " +
							"maritalStatus as maritalstatus, " +
							"birthDate as birthdate, " +
							"campus as campus " +
						"FROM "+CRS_TBL+" " +
						"WHERE LENGTH(firstname)>0 OR LENGTH(lastname)>0 OR LENGTH(email)>0 " +
						"ORDER BY lastname, firstname";
			_resultset = _statement.executeQuery(_query);
			
			while (_resultset.next()) {
				String key = _resultset.getString("firstname")+", "+_resultset.getString("lastname")+", "+_resultset.getString("email");
				if (!rolodexHash.containsKey(key)) {
					log(key+", inserting into rolodex");
					Rolodex rol = new Rolodex();
					
					rol.setAddress(_resultset.getString("address"));
					rol.setAddress2(_resultset.getString("address2"));
					rol.setBirthDate(_resultset.getDate("birthdate"));
					rol.setCampus(_resultset.getString("campus"));
					rol.setCity(_resultset.getString("city"));
					rol.setDateInserted(new java.util.Date());
					rol.setEmail(_resultset.getString("email"));
					rol.setFirstName(_resultset.getString("firstname"));
					rol.setGender(_resultset.getString("gender"));
					rol.setCrsPersonId(_resultset.getString("sourcekey"));
					rol.setLastName(_resultset.getString("lastname"));
					rol.setMaritalStatus(_resultset.getString("maritalstatus"));
					rol.setMiddleInitial(_resultset.getString("middleinitial"));
					rol.setPhone(_resultset.getString("phone"));
					rol.setState(_resultset.getString("state"));
					rol.setTable(CRS_TBL);
					rol.setZip(_resultset.getString("zip"));
					rol.persist();

					Hashtable rolodexIndiv = new Hashtable();
					rolodexIndiv.put("rolodexid", rol.getRolodexIdString());
					rolodexIndiv.put("crspersonid", _resultset.getString("sourcekey"));
					rolodexHash.put(key, rolodexIndiv);					
				} else {
					Hashtable rolodexIndiv = (Hashtable)rolodexHash.get(key);
					if (!rolodexIndiv.containsKey("crspersonid")) {
						log(key+", already in rolodex, but adding key");			
						Rolodex rol = new Rolodex((String)rolodexIndiv.get("rolodexid"));
						rol.setCrsPersonId(_resultset.getString("sourcekey"));
						rol.persist();
						rolodexIndiv.put("crspersonid", _resultset.getString("sourcekey"));
						rolodexHash.put(key, rolodexIndiv);			
					} else {
						log(key+", already in rolodex, and contains this key");			
					}
				}
			}
		} catch (Exception e) {
			log("failed to update from CRS tables");
			e.printStackTrace();
			throw e;
		}
		endConnection();
	}
	public void updateEventPerson() throws Exception {
		beginConnection();
		getCurrentList();
		try {
			_query = "SELECT eventPersonID as sourcekey, " +
							"firstName as firstname, " +
							"middleInitial as middleInitial, " +
							"lastName as lastname, " +
							"address1 as address, " +
							"address2 as address2, " +
							"city as city, " +
							"state as state, " +
							"zip as zip, " +
							"gender as gender, " +
							"homePhone as phone, " +
							"email as email, " +
							"maritalStatus as maritalstatus, " +
							"campus as campus " +
						"FROM "+EVENT_TBL+" "+
						"WHERE LENGTH(firstname)>0 OR LENGTH(lastname)>0 OR LENGTH(email)>0 " +
						"ORDER BY lastname";
			_resultset = _statement.executeQuery(_query);
			while (_resultset.next()) {
				String key = _resultset.getString("firstname")+", "+_resultset.getString("lastname")+", "+_resultset.getString("email");
				if (!rolodexHash.containsKey(key)) {
					log(key+", inserting into rolodex");
					Rolodex rol = new Rolodex();
					
					rol.setAddress(_resultset.getString("address"));
					rol.setAddress2(_resultset.getString("address2"));
					rol.setCampus(_resultset.getString("campus"));
					rol.setCity(_resultset.getString("city"));
					rol.setDateInserted(new java.util.Date());
					rol.setEmail(_resultset.getString("email"));
					rol.setFirstName(_resultset.getString("firstname"));
					if (_resultset.getString("gender").equals("0")) {
						rol.setGender("F");
					} else if (_resultset.getString("gender").equals("1")) {
						rol.setGender("M");
					} else {
						rol.setGender(_resultset.getString("gender"));
					}
					rol.setEventPersonId(_resultset.getString("sourcekey"));
					rol.setLastName(_resultset.getString("lastname"));
					rol.setMaritalStatus(_resultset.getString("maritalstatus"));
					rol.setMiddleInitial(_resultset.getString("middleinitial"));
					rol.setPhone(_resultset.getString("phone"));
					rol.setState(_resultset.getString("state"));
					rol.setTable(EVENT_TBL);
					rol.setZip(_resultset.getString("zip"));

					rol.persist();

					Hashtable rolodexIndiv = new Hashtable();
					rolodexIndiv.put("rolodexid", rol.getRolodexIdString());
					rolodexIndiv.put("eventpersonid", _resultset.getString("sourcekey"));
					rolodexHash.put(key, rolodexIndiv);			

				} else {
					Hashtable rolodexIndiv = (Hashtable)rolodexHash.get(key);
					if (!rolodexIndiv.containsKey("eventpersonid")) {
						log(key+", already in rolodex, but adding key");			
						Rolodex rol = new Rolodex((String)rolodexIndiv.get("rolodexid"));
						rol.setEventPersonId(_resultset.getString("sourcekey"));
						rol.persist();				
						rolodexIndiv.put("eventpersonid", _resultset.getString("sourcekey"));
						rolodexHash.put(key, rolodexIndiv);			
					} else {
						log(key+", already in rolodex, and contains this key");			
					}
				}
			}
		} catch (Exception e) {
			log("failed to update from EVENT tables");
			e.printStackTrace();
			throw e;
		}
		endConnection();
	}
	public void updateStintPerson() throws Exception {
		beginConnection();
		getCurrentList();
		try {
			_query = "SELECT PersonID as sourcekey, " +
							"firstName as firstname, " +
							"middleName as middleInitial, " +
							"lastName as lastname, " +
							"currentAddress1 as address, " +
							"currentAddress2 as address2, " +
							"currentCity as city, " +
							"currentState as state, " +
							"currentZip as zip, " +
							"gender as gender, " +
							"currentHomePhone as phone, " +
							"currentEmail as email, " +
							"maritalStatus as maritalstatus, " +
							"recentSchools as campus " +
						"FROM "+STINT_TBL+" "+
						"WHERE LENGTH(firstname)>0 OR LENGTH(lastname)>0 OR LENGTH(currentEmail)>0 " +
						"ORDER BY lastname";
			_resultset = _statement.executeQuery(_query);
			while (_resultset.next()) {
				String key = _resultset.getString("firstname")+", "+_resultset.getString("lastname")+", "+_resultset.getString("email");
				if (!rolodexHash.containsKey(key)) {
					log(key+", inserting into rolodex");
					Rolodex rol = new Rolodex();
					
					rol.setAddress(_resultset.getString("address"));
					rol.setAddress2(_resultset.getString("address2"));
					rol.setCampus(_resultset.getString("campus"));
					rol.setCity(_resultset.getString("city"));
					rol.setDateInserted(new java.util.Date());
					rol.setEmail(_resultset.getString("email"));
					rol.setFirstName(_resultset.getString("firstname"));
					if ((_resultset.getString("gender")!=null) &&
						(_resultset.getString("gender").equals("0"))) {
						rol.setGender("F");
					} else if ((_resultset.getString("gender")!=null) &&
								(_resultset.getString("gender").equals("1"))) {
						rol.setGender("M");
					} else {
						rol.setGender(_resultset.getString("gender"));
					}
					rol.setSiPersonId(_resultset.getString("sourcekey"));
					rol.setLastName(_resultset.getString("lastname"));
					if (_resultset.getString("maritalstatus")!=null && 
						_resultset.getString("maritalstatus").length()>0) {
						rol.setMaritalStatus(_resultset.getString("maritalstatus").substring(0,1));
					} else {
						rol.setMaritalStatus("");
					}
					if (_resultset.getString("middleinitial")!=null &&
						_resultset.getString("middleinitial").length()>0) {
						rol.setMiddleInitial(_resultset.getString("middleinitial").substring(0,1));
					} else {
						rol.setMiddleInitial("");
					}
					rol.setPhone(_resultset.getString("phone"));
					rol.setState(_resultset.getString("state"));
					rol.setTable(STINT_TBL);
					rol.setZip(_resultset.getString("zip"));

					rol.persist();

					Hashtable rolodexIndiv = new Hashtable();
					rolodexIndiv.put("rolodexid", rol.getRolodexIdString());
					rolodexIndiv.put("sipersonid", _resultset.getString("sourcekey"));
					rolodexHash.put(key, rolodexIndiv);			

				} else {
					Hashtable rolodexIndiv = (Hashtable)rolodexHash.get(key);
					if (!rolodexIndiv.containsKey("sipersonid")) {
						log(key+", already in rolodex, but adding key");			
						Rolodex rol = new Rolodex((String)rolodexIndiv.get("rolodexid"));
						rol.setSiPersonId(_resultset.getString("sourcekey"));
						rol.persist();				
						rolodexIndiv.put("sipersonid", _resultset.getString("sourcekey"));
						rolodexHash.put(key, rolodexIndiv);			
					} else {
						log(key+", already in rolodex, and contains this key");			
					}
				}
			}
		} catch (Exception e) {
			log("failed to update from STINT tables");
			e.printStackTrace();
			throw e;
		}
		endConnection();
	}
	public void updateLinczoneContact() throws Exception {
		beginConnection();
		getCurrentList();
		try {
			_query = "SELECT ContactID as sourcekey, " +
							"FirstName as firstname, " +
							"LastName as lastname, " +
							"HomeAddress as address, " +
							"City as city, " +
							"State as state, " +
							"Zip as zip, " +
							"Email as email, " +
							"CampusName as campus " +
						"FROM "+LINCZONE_TBL+" "+
						"WHERE LENGTH(firstname)>0 OR LENGTH(lastname)>0 OR LENGTH(email)>0 " +
						"ORDER BY lastname";
			_resultset = _statement.executeQuery(_query);
			while (_resultset.next()) {
				String key = _resultset.getString("firstname")+", "+_resultset.getString("lastname")+", "+_resultset.getString("email");
				if (!rolodexHash.containsKey(key)) {
					log(key+", inserting into rolodex");
					Rolodex rol = new Rolodex();
					
					rol.setAddress(_resultset.getString("address"));
					rol.setCampus(_resultset.getString("campus"));
					rol.setCity(_resultset.getString("city"));
					rol.setDateInserted(new java.util.Date());
					rol.setEmail(_resultset.getString("email"));
					rol.setFirstName(_resultset.getString("firstname"));
					rol.setLinczoneContactId(_resultset.getString("sourcekey"));
					rol.setLastName(_resultset.getString("lastname"));
					rol.setState(_resultset.getString("state"));
					rol.setTable(LINCZONE_TBL);
					rol.setZip(_resultset.getString("zip"));

					rol.persist();

					Hashtable rolodexIndiv = new Hashtable();
					rolodexIndiv.put("rolodexid", rol.getRolodexIdString());
					rolodexIndiv.put("linczonecontactid", _resultset.getString("sourcekey"));
					rolodexHash.put(key, rolodexIndiv);			

				} else {
					Hashtable rolodexIndiv = (Hashtable)rolodexHash.get(key);
					if (!rolodexIndiv.containsKey("linczonecontactid")) {
						log(key+", already in rolodex, but adding key");			
						Rolodex rol = new Rolodex((String)rolodexIndiv.get("rolodexid"));
						rol.setLinczoneContactId(_resultset.getString("sourcekey"));
						rol.persist();				
						rolodexIndiv.put("linczonecontactid", _resultset.getString("sourcekey"));
						rolodexHash.put(key, rolodexIndiv);			
					} else {
						log(key+", already in rolodex, and contains this key");			
					}
				}
			}
		} catch (Exception e) {
			log("failed to update from LINCZONE tables");
			e.printStackTrace();
			throw e;
		}
		endConnection();
	}
	public void updateStaff() throws Exception {
		beginConnection();
		getCurrentList();
		try {
			_query = "SELECT staff.accountNo as sourcekey, " +
							"staff.firstName as firstname, " +
							"staff.middleInitial as middleInitial, " +
							"staff.lastName as lastname, " +
							"address.address1 as address, " +
							"address.address2 as address2, " +
							"address.city as city, " +
							"address.state as state, " +
							"address.zip as zip, " +
							"staff.isMale as gender, " +
							"staff.homePhone as phone, " +
							"staff.email as email, " +
							"staff.maritalStatus as maritalstatus, " +
							"staff.birthDate as birthdate " +
						"FROM "+STAFF_TBL+" as staff " +
							"LEFT JOIN ministry_Address as address " +
							"ON (address.AddressID = staff.fk_primaryAddress)"+
						"WHERE LENGTH(staff.firstname)>0 OR LENGTH(staff.lastname)>0 OR LENGTH(staff.email)>0 " +
						"ORDER BY staff.lastname";
			_resultset = _statement.executeQuery(_query);
			while (_resultset.next()) {
				String key = _resultset.getString("firstname")+", "+_resultset.getString("lastname")+", "+_resultset.getString("email");
				if (!rolodexHash.containsKey(key)) {
					log(key+", inserting into rolodex");
					Rolodex rol = new Rolodex();
					
					rol.setAddress(_resultset.getString("address"));
					rol.setAddress2(_resultset.getString("address2"));
					rol.setBirthDate(_resultset.getDate("birthdate"));
					rol.setCity(_resultset.getString("city"));
					rol.setDateInserted(new java.util.Date());
					rol.setEmail(_resultset.getString("email"));
					rol.setFirstName(_resultset.getString("firstname"));
					if (_resultset.getString("gender")!=null && _resultset.getString("gender").equals("T")) {
						rol.setGender("M");
					} else {
						rol.setGender(_resultset.getString("gender"));
					}
					rol.setStaffAccountNo(_resultset.getString("sourcekey"));
					rol.setLastName(_resultset.getString("lastname"));
					rol.setMaritalStatus(_resultset.getString("maritalstatus"));
					rol.setMiddleInitial(_resultset.getString("middleinitial"));
					rol.setPhone(_resultset.getString("phone"));
					rol.setState(_resultset.getString("state"));
					rol.setTable(STAFF_TBL);
					rol.setZip(_resultset.getString("zip"));

					rol.persist();

					Hashtable rolodexIndiv = new Hashtable();
					rolodexIndiv.put("rolodexid", rol.getRolodexIdString());
					rolodexIndiv.put("staffaccountno", _resultset.getString("sourcekey"));
					rolodexHash.put(key, rolodexIndiv);			

				} else {
					Hashtable rolodexIndiv = (Hashtable)rolodexHash.get(key);
					if (!rolodexIndiv.containsKey("staffaccountno")) {
						log(key+", already in rolodex, but adding key");			
						Rolodex rol = new Rolodex((String)rolodexIndiv.get("rolodexid"));
						rol.setStaffAccountNo(_resultset.getString("sourcekey"));
						rol.persist();				
						rolodexIndiv.put("staffaccountno", _resultset.getString("sourcekey"));
						rolodexHash.put(key, rolodexIndiv);			
					} else {
						log(key+", already in rolodex, and contains this key");			
					}
				}
			}
		} catch (Exception e) {
			log("failed to update from STAFF tables");
			e.printStackTrace();
			throw e;
		}	
		endConnection();
	}
	public void updateUsspStudent() throws Exception {
		beginConnection();
		getCurrentList();
		try {
			_query = "SELECT StudentID as sourcekey, " +
							"FirstName as firstname, " +
							"LastName as lastname, " +
							"Street1 as address, " +
							"Street2 as address2, " +
							"City as city, " +
							"State as state, " +
							"Zip as zip, " +
							"Title as gender, " +
							"PhoneNumber as phone, " +
							"OtherNotes as note, " +
							"CampusName as campus " +
						"FROM "+USSP_TBL+" "+
						"WHERE LENGTH(firstname)>0 OR LENGTH(lastname)>0 " +
						"ORDER BY lastname";
			_resultset = _statement.executeQuery(_query);
			while (_resultset.next()) {
				String key = _resultset.getString("firstname")+", "+_resultset.getString("lastname")+", ";
				if (!rolodexHash.containsKey(key)) {
					log(key+", inserting into rolodex");
					Rolodex rol = new Rolodex();
					
					rol.setAddress(_resultset.getString("address"));
					rol.setAddress2(_resultset.getString("address2"));
					rol.setCampus(_resultset.getString("campus"));
					rol.setCity(_resultset.getString("city"));
					rol.setDateInserted(new java.util.Date());
					rol.setFirstName(_resultset.getString("firstname"));
					if (_resultset.getString("gender")!=null && _resultset.getString("gender").equals("Mr.")) {
						rol.setGender("M");
					} else if (_resultset.getString("gender")!=null && _resultset.getString("gender").equals("Miss")) {
						rol.setGender("F");
					} else {
						rol.setGender(_resultset.getString("gender"));
					}
					rol.setUsspStudentId(_resultset.getString("sourcekey"));
					rol.setLastName(_resultset.getString("lastname"));
					rol.setPhone(_resultset.getString("phone"));
					rol.setState(_resultset.getString("state"));
					rol.setTable(USSP_TBL);
					rol.setZip(_resultset.getString("zip"));
					
					String note = checkNote(_resultset);
					if (note.length()<50) {
						rol.setEmail(checkNote(_resultset));						
					} else {
						rol.setNote(checkNote(_resultset));
					}
					try {
						rol.persist();
					} catch (Exception e1) {
						log(org.alt60m.util.ObjectHashUtil.obj2hash(rol).toString());						
						e1.printStackTrace();
					}
					Hashtable rolodexIndiv = new Hashtable();
					rolodexIndiv.put("rolodexid", rol.getRolodexIdString());
					rolodexIndiv.put("usspstudentid", _resultset.getString("sourcekey"));
					rolodexHash.put(key, rolodexIndiv);			

				} else {
					Hashtable rolodexIndiv = (Hashtable)rolodexHash.get(key);
					if (!rolodexIndiv.containsKey("usspstudentid")) {
						log(key+", already in rolodex, but adding key");			
						Rolodex rol = new Rolodex((String)rolodexIndiv.get("rolodexid"));
						rol.setUsspStudentId(_resultset.getString("sourcekey"));
						rol.persist();				
						rolodexIndiv.put("usspstudentid", _resultset.getString("sourcekey"));
						rolodexHash.put(key, rolodexIndiv);			
					} else {
						log(key+", already in rolodex, and contains this key");			
					}
				}
			}
		} catch (Exception e) {
			log("failed to update from USSP tables");
			e.printStackTrace();
			throw e;
		}	
		endConnection();
	}
	public void updateUsspStudent01() throws Exception {
		beginConnection();
		getCurrentList();
		try {
			_query = "SELECT StudentID as sourcekey, " +
							"FirstName as firstname, " +
							"LastName as lastname, " +
							"Street1 as address, " +
							"Street2 as address2, " +
							"City as city, " +
							"State as state, " +
							"Zip as zip, " +
							"Title as gender, " +
							"PhoneNumber as phone, " +
							"OtherNotes as note, " +
							"CampusName as campus " +
						"FROM "+USSP01_TBL+" "+
						"WHERE LENGTH(firstname)>0 OR LENGTH(lastname)>0 "+
						"ORDER BY lastname";
			_resultset = _statement.executeQuery(_query);
			while (_resultset.next()) {
				String key = _resultset.getString("firstname")+", "+_resultset.getString("lastname")+", ";
				if (!rolodexHash.containsKey(key)) {
					log(key+", inserting into rolodex");
					Rolodex rol = new Rolodex();
					
					rol.setAddress(_resultset.getString("address"));
					rol.setAddress2(_resultset.getString("address2"));
					rol.setCampus(_resultset.getString("campus"));
					rol.setCity(_resultset.getString("city"));
					rol.setDateInserted(new java.util.Date());
					rol.setFirstName(_resultset.getString("firstname"));
					if (_resultset.getString("gender")!=null && _resultset.getString("gender").equals("Mr.")) {
						rol.setGender("M");
					} else if (_resultset.getString("gender")!=null && _resultset.getString("gender").equals("Miss")) {
						rol.setGender("F");
					} else {
						rol.setGender(_resultset.getString("gender"));
					}
					if (_resultset.getString("sourcekey")!=null) {
						rol.setUssp01StudentId(_resultset.getString("sourcekey"));
					} else {
						rol.setUssp01StudentId("xxxxxxxx");
					}
					rol.setLastName(_resultset.getString("lastname"));
					rol.setPhone(_resultset.getString("phone"));
					rol.setState(_resultset.getString("state"));
					rol.setTable(USSP01_TBL);
					rol.setZip(_resultset.getString("zip"));
					String note = checkNote(_resultset);
					if (note.length()<50) {
						rol.setEmail(checkNote(_resultset));						
					} else {
						rol.setNote(checkNote(_resultset));
					}
					try {
						rol.persist();
					} catch (Exception e1) {
						log(org.alt60m.util.ObjectHashUtil.obj2hash(rol).toString());						
						e1.printStackTrace();
					}
					Hashtable rolodexIndiv = new Hashtable();
					rolodexIndiv.put("rolodexid", rol.getRolodexIdString());
					if (_resultset.getString("sourcekey")!=null) {
						rolodexIndiv.put("ussp01studentid", _resultset.getString("sourcekey"));
					} else {
						rolodexIndiv.put("ussp01studentid", "xxxxxxxx");						
					}
					rolodexHash.put(key, rolodexIndiv);			

				} else {
					Hashtable rolodexIndiv = (Hashtable)rolodexHash.get(key);
					if (!rolodexIndiv.containsKey("ussp01studentid")) {
						log(key+", already in rolodex, but adding key");			
						Rolodex rol = new Rolodex((String)rolodexIndiv.get("rolodexid"));
						if (_resultset.getString("sourcekey")!=null) {
							rol.setUssp01StudentId(_resultset.getString("sourcekey"));
						} else {
							rol.setUssp01StudentId("xxxxxxxx");
						}
						rol.persist();				
						if (_resultset.getString("sourcekey")!=null) {
							rolodexIndiv.put("ussp01studentid", _resultset.getString("sourcekey"));
						} else {
							rolodexIndiv.put("ussp01studentid", "xxxxxxxx");						
						}
						rolodexHash.put(key, rolodexIndiv);			
					} else {
						log(key+", already in rolodex, and contains this key");			
					}
				}
			}
		} catch (Exception e) {
			log("failed to update from USSP01 tables");
			e.printStackTrace();
			throw e;
		}	
		endConnection();
	}
	public void updateWsnApplication() throws Exception {
		beginConnection();
		getCurrentList();
		try {
			_query = "SELECT WsnApplicationID as sourcekey, " +
							"legalFirstName as firstname, " +
							"legalLastName as lastname, " +
							"currentAddress as address, " +
							"currentAddress2 as address2, " +
							"currentCity as city, " +
							"currentState as state, " +
							"currentZip as zip, " +
							"gender as gender, " +
							"currentPhone as phone, " +
							"currentEmail as email, " +
							"maritalStatus as maritalstatus, " +
							//"birthdate as birthdate, " +
							"universityFullName as campus " +
						"FROM "+WSN_TBL+" "+
						"WHERE LENGTH(legalFirstName)>0 OR LENGTH(legalLastName)>0 OR LENGTH(currentEmail)>0 "+
						"ORDER BY lastname";
			_resultset = _statement.executeQuery(_query);
			while (_resultset.next()) {
				String key = _resultset.getString("firstname")+", "+_resultset.getString("lastname")+", "+_resultset.getString("email");
				if (!rolodexHash.containsKey(key)) {
					log(key+", inserting into rolodex");
					Rolodex rol = new Rolodex();
					
					rol.setAddress(_resultset.getString("address"));
					rol.setAddress2(_resultset.getString("address2"));
					//rol.setBirthDate(_resultset.getDate("birthdate"));
					rol.setCampus(_resultset.getString("campus"));
					rol.setCity(_resultset.getString("city"));
					rol.setDateInserted(new java.util.Date());
					rol.setEmail(_resultset.getString("email"));
					rol.setFirstName(_resultset.getString("firstname"));
					if (_resultset.getString("gender")!=null && _resultset.getString("gender").equals("0")) {
						rol.setGender("F");
					} else if (_resultset.getString("gender")!=null && _resultset.getString("gender").equals("1")) {
						rol.setGender("M");
					} else {
						rol.setGender(_resultset.getString("gender"));
					}
					rol.setWsnSpPersonId(_resultset.getString("sourcekey"));
					rol.setLastName(_resultset.getString("lastname"));
					if (_resultset.getString("maritalstatus")!=null && 
						_resultset.getString("maritalstatus").length()>0) {
						rol.setMaritalStatus(_resultset.getString("maritalstatus").substring(0,1));
					} else {
						rol.setMaritalStatus("");
					}
					rol.setPhone(_resultset.getString("phone"));
					rol.setState(_resultset.getString("state"));
					rol.setTable(WSN_TBL);
					rol.setZip(_resultset.getString("zip"));

					rol.persist();

					Hashtable rolodexIndiv = new Hashtable();
					rolodexIndiv.put("rolodexid", rol.getRolodexIdString());
					rolodexIndiv.put("wsnsppersonid", _resultset.getString("sourcekey"));
					rolodexHash.put(key, rolodexIndiv);			

				} else {
					Hashtable rolodexIndiv = (Hashtable)rolodexHash.get(key);
					if (!rolodexIndiv.containsKey("wsnsppersonid")) {
						log(key+", already in rolodex, but adding key");			
						Rolodex rol = new Rolodex((String)rolodexIndiv.get("rolodexid"));
						rol.setWsnSpPersonId(_resultset.getString("sourcekey"));
						rol.persist();				
						rolodexIndiv.put("wsnsppersonid", _resultset.getString("sourcekey"));
						rolodexHash.put(key, rolodexIndiv);			
					} else {
						log(key+", already in rolodex, and contains this key");			
					}
				}
			}
		} catch (Exception e) {
			log("failed to update from WSN tables");
			e.printStackTrace();
			throw e;
		}	
		endConnection();
	}
	
	public static void main(String[] args) {
		try {
			RolodexUpdater ru = new RolodexUpdater();
			org.alt60m.servlet.ObjectMapping.setConfigPath(args[0]);
			ru.updateStintPerson();
			ru.updateCrsPerson();
			ru.updateEventPerson();
			ru.updateLinczoneContact();
			ru.updateStaff();
			ru.updateUsspStudent();
			ru.updateUsspStudent01();
			ru.updateWsnApplication();
		} catch (Exception e) {
			System.out.println("Failed: ");
			e.printStackTrace();
		}
	}
}
