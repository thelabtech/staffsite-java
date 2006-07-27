package org.alt60m.staffSite.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.alt60m.ministry.model.dbio.Person;
import org.alt60m.ministry.model.dbio.Staff;
import org.alt60m.security.dbio.model.User;
import org.alt60m.servlet.Controller;

import com.kenburcham.framework.dbio.DBIOEntity;

public class MonitorController extends Controller {
	
	public void getAlive(ActionContext ctx) throws IOException {
		ctx.getResponse().getWriter().print("Status: OK");
	}
	
	public void getStatus(ActionContext ctx)
	{
		String requester = ctx.getInputString("requester");
		if (requester != null)
			log.info("Status page requested by " + requester);
		else
			log.info("Status page reqeusted anonymously");
		
		Map<String, String> results = new HashMap<String, String>();
		//check some tables
		
		boolean dbFailure = testDatabase(results);

		//check gcx
		
		boolean gcxFailure = testGCX(results);
		
		//check cas
		
		boolean casFailure = testCAS(results);
		
		boolean failure = dbFailure || gcxFailure || casFailure;
		String statusMessage = (failure ? "FAIL" : "OK");
		results.put("statusMessage", statusMessage);
		log.info("Status page test complete; Status: " + statusMessage);
		ctx.setReturnValue(results);
		ctx.goToURL("/monitor.jsp");
	}

	private synchronized boolean testDatabase(Map<String, String> results) {
		//Ministry Person
		long testStartTime = System.currentTimeMillis();
		Person testPerson = new Person();
		testPerson.setToolName("monitor");
		testPerson.setFirstName("Test");
		testPerson.setCreatedBy("monitor");
		testPerson.setDateCreated(new Date());
		String updateFieldName = "FirstName";
		Object updateValue = "Test2";
		
		log.debug("Beginning person test");
		boolean personFailure = testEntity(testPerson, updateFieldName, updateValue);
			
		long testTime = System.currentTimeMillis() - testStartTime;
		String personResult = "Person test completed in " + testTime + " ms; result: " + (personFailure ? "failure" : "success"); 
		log.info(personResult);
		results.put("personResult", personResult);

		//SSM User
		testStartTime = System.currentTimeMillis();
		User testUser = new User();
		testUser.setUsername("Test.User@test.org");
		testUser.setPassword("testpassword");
		testUser.setCreatedOn(new Date());
		updateFieldName = "Password";
		updateValue = "testpassword2";


		log.debug("Beginning user test");
		boolean userFailure = testEntity(testUser, updateFieldName, updateValue);
			
		testTime = System.currentTimeMillis() - testStartTime;
		String userResult = "SSM User test completed in " + testTime + " ms; result: " + (userFailure ? "failure" : "success"); 
		log.info(userResult);
		
		results.put("userResult", userResult);
		
//		Ministry Staff
		/* turns out DBIO can't do inserts with non-database assigned IDs
		testStartTime = System.currentTimeMillis();
		Staff testStaff = new Staff();
		testStaff.setFirstName("Test");
		testStaff.setLastName("Staff");
		updateFieldName = "LastName";
		updateValue = "Test2";

		log.debug("Beginning staff test");
		boolean staffFailure = testEntity(testStaff, updateFieldName, updateValue);
			
		testTime = System.currentTimeMillis() - testStartTime;
		String staffResult = "Staff test completed in " + testTime + " ms; result: " + (staffFailure ? "failure" : "success"); 
		log.info(staffResult);
		results.put("staffResult", staffResult);
		*/
		
		boolean dbFailure = personFailure || userFailure; // || staffFailure;
		String dbMessage = (dbFailure ? "FAIL" : "OK");
		results.put("dbMessage", dbMessage);
		return dbFailure;
	}

	private boolean testEntity(DBIOEntity entity, String updateFieldName, Object updateValue) {
		boolean failure = false;
		boolean successfulInsert = entity.insert();
		if (successfulInsert) {
			if (entity.isPKEmpty()) {
				log.error("Test object received no id on successful insertion!");
				failure = true;
			}
			log.debug("Successful insert");
			entity.setFieldValue(updateFieldName, updateValue);
			boolean successfulUpdate = entity.persist();
			if (successfulUpdate) {
				log.debug("Successful update");
			}
			else {
				log.warn("Unsuccessful update");
				failure = true;
			}
			boolean successfulDelete = entity.delete();
			if (successfulDelete) {
				log.debug("Successful delete");
			}
			else {
				log.warn("Unsuccessful delete");
				failure = true;
			}
		}
		else {
			log.warn("Unsucessful insert");
			failure = true;
		}
		return failure;
	}
	

	private boolean testGCX(Map<String, String> results) {
		
		boolean gcxFailure = false;
		String gcxMessage = (gcxFailure ? "FAIL" : "OK");
		results.put("gcxMessage", gcxMessage);
		return gcxFailure;
	}
	
	private boolean testCAS(Map<String, String> results) {
		
		boolean casFailure = false;
		String casMessage = (casFailure ? "FAIL" : "OK");
		results.put("casMessage", casMessage);
		return casFailure;
	}
}
