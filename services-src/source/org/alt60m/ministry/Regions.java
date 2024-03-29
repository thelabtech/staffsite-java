/* Generated by Together */

package org.alt60m.ministry;
import java.util.*;


public class Regions {

    // Static stuff
    // ****************************************
	// User-readable string
	public static final String[] abbrevRegion = new String[] {"NE", "MA", "MS", "SE", "GL", "UM", "GP", "RR", "NW", "SW","NC"};
	public static final String[] expandedRegion = new String[] {"Northeast", "Mid-Atlantic", "MidSouth", "Southeast", "Great Lakes", "Upper Midwest", "Great Plains Int'l", "Red River", "Greater Northwest", "Pacific Southwest","National Campus Office"};
	public static final String[] ps_region = new String[] {"CNE","CMIDA","CMIDS","CSE","CGL","CUPM","CWC","CRR","CGN","CPS","CMNCO"};

	public static String expandRegion(String abbrev) {
		return org.alt60m.util.TextUtils.translate(abbrevRegion, expandedRegion, abbrev);
	}
	public static String psRegionToCampusRegion(String ps) {
		return org.alt60m.util.TextUtils.translate(ps_region, abbrevRegion, ps);
	}

	public static void main(String[] args)
	{
        /*
		System.out.println("Expand CA: " + expandStrategy("CA"));
		System.out.println("Expand ca: " + expandStrategy("ca"));
		System.out.println("Expand WS: " + expandStrategy("WS"));
        */
	}

}
