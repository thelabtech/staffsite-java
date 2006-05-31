/* Generated by Together */

package org.alt60m.ministry.model;

import java.util.*;

/**
 * @persistent 
 * @table ministry_locallevel
 * @key-generator UUID
 * @cache-type none
 * @access shared
 */
public class LocalLevelSimple {

    private String teamID = new String();  // dummy

    private String name = new String();

	public String getName() {
		return name; 
	}
    public String getTeamID(){
            return teamID;
    }
	public void setName(String name) {
		this.name = name; 
	}
    public void setTeamID(String teamID){
            this.teamID = teamID;
    }
}
