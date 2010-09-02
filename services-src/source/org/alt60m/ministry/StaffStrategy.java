/* Generated by Together */

package org.alt60m.ministry;
import java.util.*;


public class StaffStrategy {

    // Static stuff
    // ****************************************
	// User-readable string
	public static final String[] abbrevStaffStrategy = new String[] {"FLD","EPI","DES","IMP","NTN","WSN","BRD","AIA","R&D","Fund Dev","HR","SV","Staffed","Catalytic","ESM","Staffed","Staffed"};
	public static final String[] expandedStaffStrategy = new String[] {"Campus Field Ministry","Epic","Destino","Impact","Nations","WSN","Bridges","Athletes In Action","Research and Development","Fund Development","Leadership Development","Student Venture","Field Strategies","Field Strategies","Ethnic Field Ministries","Field Strategies","Field Strategies"};
	
	public static String expandStaffStrategy(String abbrev) {
		return org.alt60m.util.TextUtils.translate(abbrevStaffStrategy, expandedStaffStrategy, abbrev);
	}



}
