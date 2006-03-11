/*
 * Created on Jul 6, 2004
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package org.alt60m.hr.si.model.dbio;

import java.util.Date;

import com.kenburcham.framework.dbio.DBIOEntity;

/**
 * @author justin.sabelko
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public abstract class SIPerson_Parent extends DBIOEntity {
	public boolean insert() {
		return super.insert();
	}
	public abstract boolean isPKEmpty();
	public abstract void localinit();
	/**
	 * Returns the accountNo.
	 * @return String
	 */
	public abstract String getAccountNo();
	/**
	 * Returns the currentAddress1.
	 * @return String
	 */
	public abstract String getCurrentAddress1();
	/**
	 * Returns the currentAddress2.
	 * @return String
	 */
	public abstract String getCurrentAddress2();
	/**
	 * Returns the currentCellPhone.
	 * @return String
	 */
	public abstract String getCurrentCellPhone();
	/**
	 * Returns the currentCity.
	 * @return String
	 */
	public abstract String getCurrentCity();
	/**
	 * Returns the currentEmail.
	 * @return String
	 */
	public abstract String getCurrentEmail();
	/**
	 * Returns the currentHomePhone.
	 * @return String
	 */
	public abstract String getCurrentHomePhone();
	/**
	 * Returns the currentState.
	 * @return String
	 */
	public abstract String getCurrentState();
	/**
	 * Returns the currentWorkPhone.
	 * @return String
	 */
	public abstract String getCurrentWorkPhone();
	/**
	 * Returns the currentZip.
	 * @return String
	 */
	public abstract String getCurrentZip();
	/**
	 * Returns the emer2Address1.
	 * @return String
	 */
	public abstract String getEmer2Address1();
	/**
	 * Returns the emer2Address2.
	 * @return String
	 */
	public abstract String getEmer2Address2();
	/**
	 * Returns the emer2CellPhone.
	 * @return String
	 */
	public abstract String getEmer2CellPhone();
	/**
	 * Returns the emer2City.
	 * @return String
	 */
	public abstract String getEmer2City();
	/**
	 * Returns the emer2ContactName.
	 * @return String
	 */
	public abstract String getEmer2ContactName();
	/**
	 * Returns the emer2ContactRelationship.
	 * @return String
	 */
	public abstract String getEmer2ContactRelationship();
	/**
	 * Returns the emer2Email.
	 * @return String
	 */
	public abstract String getEmer2Email();
	/**
	 * Returns the emer2HomePhone.
	 * @return String
	 */
	public abstract String getEmer2HomePhone();
	/**
	 * Returns the emer2State.
	 * @return String
	 */
	public abstract String getEmer2State();
	/**
	 * Returns the emer2WorkPhone.
	 * @return String
	 */
	public abstract String getEmer2WorkPhone();
	/**
	 * Returns the emer2Zip.
	 * @return String
	 */
	public abstract String getEmer2Zip();
	/**
	 * Returns the emerAddress1.
	 * @return String
	 */
	public abstract String getEmerAddress1();
	/**
	 * Returns the emerAddress2.
	 * @return String
	 */
	public abstract String getEmerAddress2();
	/**
	 * Returns the emerCellPhone.
	 * @return String
	 */
	public abstract String getEmerCellPhone();
	/**
	 * Returns the emerCity.
	 * @return String
	 */
	public abstract String getEmerCity();
	/**
	 * Returns the emerContactName.
	 * @return String
	 */
	public abstract String getEmerContactName();
	/**
	 * Returns the emerContactRelationship.
	 * @return String
	 */
	public abstract String getEmerContactRelationship();
	/**
	 * Returns the emerEmail.
	 * @return String
	 */
	public abstract String getEmerEmail();
	/**
	 * Returns the emerHomePhone.
	 * @return String
	 */
	public abstract String getEmerHomePhone();
	/**
	 * Returns the emerState.
	 * @return String
	 */
	public abstract String getEmerState();
	/**
	 * Returns the emerWorkPhone.
	 * @return String
	 */
	public abstract String getEmerWorkPhone();
	/**
	 * Returns the emerZip.
	 * @return String
	 */
	public abstract String getEmerZip();
	/**
	 * Returns the firstName.
	 * @return String
	 */
	public abstract String getFirstName();
	/**
	 * Returns the gender.
	 * @return String
	 */
	public abstract String getGender();
	/**
	 * Returns the isStaff.
	 * @return boolean
	 */
	public abstract boolean getIsStaff();
	/**
	 * Returns the lastDateAtAddress.
	 * @return Date
	 */
	public abstract Date getLastDateAtAddress();
	/**
	 * Returns the lastName.
	 * @return String
	 */
	public abstract String getLastName();
	/**
	 * Returns the maritalStatus.
	 * @return String
	 */
	public abstract String getMaritalStatus();
	/**
	 * Returns the permAddress1.
	 * @return String
	 */
	public abstract String getPermAddress1();
	/**
	 * Returns the permAddress2.
	 * @return String
	 */
	public abstract String getPermAddress2();
	/**
	 * Returns the permCellPhone.
	 * @return String
	 */
	public abstract String getPermCellPhone();
	/**
	 * Returns the permCity.
	 * @return String
	 */
	public abstract String getPermCity();
	/**
	 * Returns the permEmail.
	 * @return String
	 */
	public abstract String getPermEmail();
	/**
	 * Returns the permHomePhone.
	 * @return String
	 */
	public abstract String getPermHomePhone();
	/**
	 * Returns the permState.
	 * @return String
	 */
	public abstract String getPermState();
	/**
	 * Returns the permWorkPhone.
	 * @return String
	 */
	public abstract String getPermWorkPhone();
	/**
	 * Returns the permZip.
	 * @return String
	 */
	public abstract String getPermZip();
	/**
	 * Returns the region.
	 * @return String
	 */
	public abstract String getRegion();
	/**
	 * Returns the role.
	 * @return String
	 */
	public abstract String getRole();
	/**
	 * Returns the sIPersonID.
	 * @return String
	 */
	public abstract String getSIPersonID();
	/**
	 * Returns the surferID.
	 * @return String
	 */
	public abstract String getSurferID();
	/**
	 * Returns the workInUS.
	 * @return boolean
	 */
	public abstract boolean getWorkInUS();
	/**
	 * Sets the accountNo.
	 * @param accountNo The accountNo to set
	 */
	public abstract void setAccountNo(String accountNo);
	/**
	 * Sets the currentAddress1.
	 * @param currentAddress1 The currentAddress1 to set
	 */
	public abstract void setCurrentAddress1(String currentAddress1);
	/**
	 * Sets the currentAddress2.
	 * @param currentAddress2 The currentAddress2 to set
	 */
	public abstract void setCurrentAddress2(String currentAddress2);
	/**
	 * Sets the currentCellPhone.
	 * @param currentCellPhone The currentCellPhone to set
	 */
	public abstract void setCurrentCellPhone(String currentCellPhone);
	/**
	 * Sets the currentCity.
	 * @param currentCity The currentCity to set
	 */
	public abstract void setCurrentCity(String currentCity);
	/**
	 * Sets the currentEmail.
	 * @param currentEmail The currentEmail to set
	 */
	public abstract void setCurrentEmail(String currentEmail);
	/**
	 * Sets the currentHomePhone.
	 * @param currentHomePhone The currentHomePhone to set
	 */
	public abstract void setCurrentHomePhone(String currentHomePhone);
	/**
	 * Sets the currentState.
	 * @param currentState The currentState to set
	 */
	public abstract void setCurrentState(String currentState);
	/**
	 * Sets the currentWorkPhone.
	 * @param currentWorkPhone The currentWorkPhone to set
	 */
	public abstract void setCurrentWorkPhone(String currentWorkPhone);
	/**
	 * Sets the currentZip.
	 * @param currentZip The currentZip to set
	 */
	public abstract void setCurrentZip(String currentZip);
	/**
	 * Sets the emer2Address1.
	 * @param emer2Address1 The emer2Address1 to set
	 */
	public abstract void setEmer2Address1(String emer2Address1);
	/**
	 * Sets the emer2Address2.
	 * @param emer2Address2 The emer2Address2 to set
	 */
	public abstract void setEmer2Address2(String emer2Address2);
	/**
	 * Sets the emer2CellPhone.
	 * @param emer2CellPhone The emer2CellPhone to set
	 */
	public abstract void setEmer2CellPhone(String emer2CellPhone);
	/**
	 * Sets the emer2City.
	 * @param emer2City The emer2City to set
	 */
	public abstract void setEmer2City(String emer2City);
	/**
	 * Sets the emer2ContactName.
	 * @param emer2ContactName The emer2ContactName to set
	 */
	public abstract void setEmer2ContactName(String emer2ContactName);
	/**
	 * Sets the emer2ContactRelationship.
	 * @param emer2ContactRelationship The emer2ContactRelationship to set
	 */
	public abstract void setEmer2ContactRelationship(String emer2ContactRelationship);
	/**
	 * Sets the emer2Email.
	 * @param emer2Email The emer2Email to set
	 */
	public abstract void setEmer2Email(String emer2Email);
	/**
	 * Sets the emer2HomePhone.
	 * @param emer2HomePhone The emer2HomePhone to set
	 */
	public abstract void setEmer2HomePhone(String emer2HomePhone);
	/**
	 * Sets the emer2State.
	 * @param emer2State The emer2State to set
	 */
	public abstract void setEmer2State(String emer2State);
	/**
	 * Sets the emer2WorkPhone.
	 * @param emer2WorkPhone The emer2WorkPhone to set
	 */
	public abstract void setEmer2WorkPhone(String emer2WorkPhone);
	/**
	 * Sets the emer2Zip.
	 * @param emer2Zip The emer2Zip to set
	 */
	public abstract void setEmer2Zip(String emer2Zip);
	/**
	 * Sets the emerAddress1.
	 * @param emerAddress1 The emerAddress1 to set
	 */
	public abstract void setEmerAddress1(String emerAddress1);
	/**
	 * Sets the emerAddress2.
	 * @param emerAddress2 The emerAddress2 to set
	 */
	public abstract void setEmerAddress2(String emerAddress2);
	/**
	 * Sets the emerCellPhone.
	 * @param emerCellPhone The emerCellPhone to set
	 */
	public abstract void setEmerCellPhone(String emerCellPhone);
	/**
	 * Sets the emerCity.
	 * @param emerCity The emerCity to set
	 */
	public abstract void setEmerCity(String emerCity);
	/**
	 * Sets the emerContactName.
	 * @param emerContactName The emerContactName to set
	 */
	public abstract void setEmerContactName(String emerContactName);
	/**
	 * Sets the emerContactRelationship.
	 * @param emerContactRelationship The emerContactRelationship to set
	 */
	public abstract void setEmerContactRelationship(String emerContactRelationship);
	/**
	 * Sets the emerEmail.
	 * @param emerEmail The emerEmail to set
	 */
	public abstract void setEmerEmail(String emerEmail);
	/**
	 * Sets the emerHomePhone.
	 * @param emerHomePhone The emerHomePhone to set
	 */
	public abstract void setEmerHomePhone(String emerHomePhone);
	/**
	 * Sets the emerState.
	 * @param emerState The emerState to set
	 */
	public abstract void setEmerState(String emerState);
	/**
	 * Sets the emerWorkPhone.
	 * @param emerWorkPhone The emerWorkPhone to set
	 */
	public abstract void setEmerWorkPhone(String emerWorkPhone);
	/**
	 * Sets the emerZip.
	 * @param emerZip The emerZip to set
	 */
	public abstract void setEmerZip(String emerZip);
	/**
	 * Sets the firstName.
	 * @param firstName The firstName to set
	 */
	public abstract void setFirstName(String firstName);
	/**
	 * Sets the gender.
	 * @param gender The gender to set
	 */
	public abstract void setGender(String gender);
	/**
	 * Sets the isStaff.
	 * @param isStaff The isStaff to set
	 */
	public abstract void setIsStaff(boolean isStaff);
	/**
	 * Sets the lastDateAtAddress.
	 * @param lastDateAtAddress The lastDateAtAddress to set
	 */
	public abstract void setLastDateAtAddress(Date lastDateAtAddress);
	/**
	 * Sets the lastName.
	 * @param lastName The lastName to set
	 */
	public abstract void setLastName(String lastName);
	/**
	 * Sets the maritalStatus.
	 * @param maritalStatus The maritalStatus to set
	 */
	public abstract void setMaritalStatus(String maritalStatus);
	/**
	 * Sets the permAddress1.
	 * @param permAddress1 The permAddress1 to set
	 */
	public abstract void setPermAddress1(String permAddress1);
	/**
	 * Sets the permAddress2.
	 * @param permAddress2 The permAddress2 to set
	 */
	public abstract void setPermAddress2(String permAddress2);
	/**
	 * Sets the permCellPhone.
	 * @param permCellPhone The permCellPhone to set
	 */
	public abstract void setPermCellPhone(String permCellPhone);
	/**
	 * Sets the permCity.
	 * @param permCity The permCity to set
	 */
	public abstract void setPermCity(String permCity);
	/**
	 * Sets the permEmail.
	 * @param permEmail The permEmail to set
	 */
	public abstract void setPermEmail(String permEmail);
	/**
	 * Sets the permHomePhone.
	 * @param permHomePhone The permHomePhone to set
	 */
	public abstract void setPermHomePhone(String permHomePhone);
	/**
	 * Sets the permState.
	 * @param permState The permState to set
	 */
	public abstract void setPermState(String permState);
	/**
	 * Sets the permWorkPhone.
	 * @param permWorkPhone The permWorkPhone to set
	 */
	public abstract void setPermWorkPhone(String permWorkPhone);
	/**
	 * Sets the permZip.
	 * @param permZip The permZip to set
	 */
	public abstract void setPermZip(String permZip);
	/**
	 * Sets the region.
	 * @param region The region to set
	 */
	public abstract void setRegion(String region);
	/**
	 * Sets the role.
	 * @param role The role to set
	 */
	public abstract void setRole(String role);
	/**
	 * Sets the sIPersonID.
	 * @param sIPersonID The sIPersonID to set
	 */
	public abstract void setSIPersonID(String sIPersonID);
	/**
	 * Sets the surferID.
	 * @param surferID The surferID to set
	 */
	public abstract void setSurferID(String surferID);
	/**
	 * Sets the workInUS.
	 * @param workInUS The workInUS to set
	 */
	public abstract void setWorkInUS(boolean workInUS);
	/**
	 * Returns the middleName.
	 * @return String
	 */
	public abstract String getMiddleName();
	/**
	 * Sets the middleName.
	 * @param middleName The middleName to set
	 */
	public abstract void setMiddleName(String middleName);
	/**
	 * Returns the fk_ssmUserID.
	 * @return int
	 */
	public abstract int getFk_ssmUserID();
	/**
	 * Sets the fk_ssmUserID.
	 * @param fk_ssmUserID The fk_ssmUserID to set
	 */
	public abstract void setFk_ssmUserID(int fk_ssmUserID);
	/**
	 * Returns the graduationDate.
	 * @return Date
	 */
	public abstract Date getGraduationDate();
	/**
	 * Returns the majors.
	 * @return String
	 */
	public abstract String getMajors();
	/**
	 * Returns the numberChildren.
	 * @return String
	 */
	public abstract String getNumberChildren();
	/**
	 * Returns the preferredName.
	 * @return String
	 */
	public abstract String getPreferredName();
	/**
	 * Returns the recentSchools.
	 * @return String
	 */
	public abstract String getRecentSchools();
	/**
	 * Sets the graduationDate.
	 * @param graduationDate The graduationDate to set
	 */
	public abstract void setGraduationDate(Date graduationDate);
	/**
	 * Sets the majors.
	 * @param majors The majors to set
	 */
	public abstract void setMajors(String majors);
	/**
	 * Sets the numberChildren.
	 * @param numberChildren The numberChildren to set
	 */
	public abstract void setNumberChildren(String numberChildren);
	/**
	 * Sets the preferredName.
	 * @param preferredName The preferredName to set
	 */
	public abstract void setPreferredName(String preferredName);
	/**
	 * Sets the recentSchools.
	 * @param recentSchools The recentSchools to set
	 */
	public abstract void setRecentSchools(String recentSchools);
	/**
	 * Returns the title.
	 * @return String
	 */
	public abstract String getTitle();
	/**
	 * Sets the title.
	 * @param title The title to set
	 */
	public abstract void setTitle(String title);
	/**
	 * Returns the staffStieProfileID.
		 * Added 6 December 2002 by RDH
	 * @return String
	 */
	public abstract String getFk_StaffSiteProfileID();
	/**
	 * Sets the staffStieProfileID.
		 * Added 6 December 2002 by RDH
	 * @param fk_StaffStieProfileID The staffStieProfileID to set
	 */
	public abstract void setFk_StaffSiteProfileID(String fk_StaffSiteProfileID);
	/**
	 * Returns the staffStieProfileID.
		 * Added 12 December 2002 by RDH
	 * @return String
	 */
	public abstract String getUniversityState();
	/**
	 * Sets the staffStieProfileID.
		 * Added 12 December 2002 by RDH
	 * @param universityState The state the most recently attended school was in.
	 */
	public abstract void setUniversityState(String universityState);
}