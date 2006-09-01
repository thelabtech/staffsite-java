/* Generated by Together */

package org.alt60m.ministry.model.locator;
import java.util.*;

/**
 * @persistent 
 * @table ministry_Team
 * @key-generator UUID
 * @cache-type none
 * @access shared
 */
public class LocalLevel {
	/**
	 * @primary-key
	 */
    private String teamID = new String();
    private String url = new String();
    private String name = new String();
	private String region = new String();

	public String getName() {
		return name; 
	}
	public void setName(String name) {
		this.name = name; 
	}


	public String getUrl() {
		return url; 
	}
	public void setUrl(String url) {
		this.url = url; 
	}
    public String getTeamID(){
            return teamID;
        }

    public void setTeamID(String teamID){
            this.teamID = teamID;
        }

	public String getRegion() {
		return region; 
	}
	public void setRegion(String region) {
		this.region = region; 
	}

}
