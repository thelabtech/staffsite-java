package org.alt60m.ministry.servlet;

import java.util.*;
import java.text.*;
import org.apache.log4j.*;
import org.alt60m.servlet.*;
import org.alt60m.util.*;
import org.alt60m.ministry.model.dbio.*;
import org.alt60m.util.LogHelper;
import org.alt60m.ministry.ActivityExistsException;

/**
 * Web controller for InfoBase Tool: 5/27/03	MAB	Initial Coding Completeness (0 - 5): 3 Known Issues:<p>
 * @author  Mike Brinkley
 * @version 1.0
 */
public class InfoBaseTool {

    class StaffByRegionCache {
        Date lastUpdated;
		Hashtable staffByRegion = new Hashtable();
    }

    private final String[] _abbrevRegion = new String[] { "NE", "MA", "MS", "SE", "GL", "UM", "GP", "RR", "NW", "SW" };
    final String[] _reportTypes = new String[] { "locallevel", "targetarea", "regional", "national" };

	private StaffByRegionCache staffByRegionCache = new StaffByRegionCache();

	//Log Helper Code//
	private static LogHelper logHelper = new LogHelper();
//	private void log(Priority p, String msg) { logHelper.log(this.getClass().toString(),p,msg); }
	static private void log(Priority p, String msg, java.lang.Throwable t) { logHelper.log("InfoBaseTool",p,msg,t); }
	//End of Log Helper Code//


    String buildCommaDelimitedQuotedList(Collection col) {
        String result = "";
        Iterator i = col.iterator();
        while (i.hasNext()) {
            result += "'" + (String)i.next() + "'";
            if (i.hasNext()) result += ",";
        }
        return result;
    }

    String buildCommaDelimitedQuotedList(String[] arr) {
        String result = "";
        for (int cnt = 0; cnt < arr.length; cnt++) {
            result += "'" + arr[cnt] + "'";
            if (cnt != arr.length - 1) result += ",";
        }
        return result;
    }

	public void createNewTargetArea(Hashtable request) throws Exception {
		try {
			TargetArea target = new TargetArea();
			target.setName((String)request.get("name"));
			target.setAddress1((String)request.get("address1"));
			target.setAddress2((String)request.get("address2"));
			target.setCity((String)request.get("city"));
			target.setState((String)request.get("state"));
			target.setZip((String)request.get("zip"));
			target.setCountry((String)request.get("country"));
			target.setPhone((String)request.get("phone"));
			target.setFax((String)request.get("fax"));
			target.setEmail((String)request.get("email"));
			target.setUrl((String)request.get("url"));
			target.setAbbrv((String)request.get("abbrv"));
			target.setFice((String)request.get("fice"));
			//target.setPopulation((String)request.get("population"));
			target.setNote((String)request.get("note"));
			target.setAltName((String)request.get("altName"));
			target.setIsSecure(((String)request.get("isSecure") != null && ((String)request.get("isSecure")).equalsIgnoreCase("true")) ? true : false);
			target.setRegion((String)request.get("region"));
			target.setMpta((String)request.get("mpta"));
			target.setAoa((String)request.get("aoa"));
			target.setAoaPriority((String)request.get("aoaPriority"));
			target.setInfoUrl((String)request.get("infoUrl"));
			target.setCiaUrl((String)request.get("ciaUrl"));
			target.persist();
		} catch (Exception e) {
			log(Priority.ERROR, "Failed to perform createNewTargetArea().", e);
			throw new Exception(e);
	   }
	}
	
	public RegionalStat createRegionalStatObject() throws Exception {
		try  {
			RegionalStat rs = new RegionalStat();
			rs.persist();
			return rs;
		} catch (Exception e) {
            log(Priority.ERROR, "Failed to perform createRegionalStatObject().", e);
			throw new Exception(e);
		}
	}

	public Statistic createStatObject() throws Exception {
		try  {
			Statistic stat = new Statistic();
			stat.persist();
			return stat;
		} catch (Exception e) {
            log(Priority.ERROR, "Failed to perform createStatObject().", e);
			throw new Exception(e);
		}
	}

    public void deleteLocalLevelTeam(String llId) throws Exception {
        try {
 			LocalLevel ll = new LocalLevel(llId);
			ll.delete();
        } catch (Exception e) {
            log(Priority.ERROR, "Failed to perform deleteLocalLevelTeam().", e);
			throw new Exception(e);
        }
    }

    public void deleteTargetArea(String targetAreaId) throws Exception {
        try {
 			TargetArea ta = new TargetArea(targetAreaId);
			ta.delete();
        } catch (Exception e) {
            log(Priority.ERROR, "Failed to perform deleteTargetArea().", e);
			throw new Exception(e);
        }
    }

    public ActionResults editSuccessCriteria(ActionResults results, String statisticId, String lastStatId, String periodBeginString, String periodEndString) throws Exception {
        try {
            if (statisticId != null && statisticId != "") {
                Statistic statistic = new Statistic();
                SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
                Date periodBegin = format.parse(periodBeginString,(new ParsePosition(0)));
                Date periodEnd = format.parse(periodEndString,(new ParsePosition(0)));
                statistic.setStatisticId(statisticId);
                statistic.setPeriodBegin(periodBegin);
                statistic.setPeriodEnd(periodEnd);
                statistic.select();
                results.putValue("periodbegin", periodBeginString);
                results.putValue("periodend", periodEndString);
                Hashtable stat = ObjectHashUtil.obj2hash(statistic);
                results.addHashtable("statistic", stat);
            } else if ((lastStatId != null) && (!lastStatId.equals("null")) && lastStatId != "") {
                Statistic statistic = new Statistic();
                SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
                Date periodBegin = format.parse(periodBeginString,(new ParsePosition(0)));
//                Date periodEnd = format.parse(periodEndString,(new ParsePosition(0)));
                statistic.setStatisticId(lastStatId);
                /*statistic.setPeriodBegin(periodBegin);
                statistic.setPeriodEnd(periodEnd);*/
                statistic.select();
                results.putValue("periodbegin", periodBeginString);
                results.putValue("periodend", periodEndString);
                Hashtable stat = ObjectHashUtil.obj2hash(statistic);
                results.addHashtable("statistic", stat);
            } else {
			    results.putValue("periodbegin", periodBeginString);
                results.putValue("periodend", periodEndString);
			}
			return results;
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform editSuccessCriteria().", e);
			throw new Exception(e);
        }
    }

    private Hashtable emulateOldStaffStructure(Staff staff) throws Exception {
        Hashtable staffHash = ObjectHashUtil.obj2hash(staff);
        OldAddress pa = staff.getPrimaryAddress();
        if (pa != null) {
            staffHash.put("Address1", pa.getAddress1());
            staffHash.put("Address2", pa.getAddress2());
            staffHash.put("Address3", pa.getAddress3());
            staffHash.put("Address4", pa.getAddress4());
            staffHash.put("City", pa.getCity());
            staffHash.put("State", pa.getState());
            staffHash.put("Zip", pa.getZip());
            staffHash.put("Country", pa.getCountry());
        } else {
            staffHash.put("Address1", "");
            staffHash.put("Address2", "");
            staffHash.put("Address3", "");
            staffHash.put("Address4", "");
            staffHash.put("City", "");
            staffHash.put("State", "");
            staffHash.put("Zip", "");
            staffHash.put("Country", "");
        }
        return staffHash;
    }

    public int getActivityCount() throws Exception {
        try {
			return InfoBaseQueries.getActivityCount();
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform getActivityCount().", e);
  			throw new Exception(e);
        }
    }

    public int getActivityCountCurrent() throws Exception {
        try {
			return InfoBaseQueries.getActivityCountCurrent();
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform getActivityCountCurrent().", e);
  			throw new Exception(e);
        }
    }

    public Activity getActivityObject(String activityId) throws Exception {
        try { 
			return new Activity(activityId);
		} catch (Exception e) {
            log(Priority.ERROR, "Failed to perform getActivityObject().", e);
			throw new Exception(e);
        }
    }

    public Collection getAllNonCccMin() throws Exception {
        try {
            NonCccMin ncm = new NonCccMin();
            return ncm.selectList();
		}
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform getAllNonCccMin().", e);
 			throw new Exception(e);
        }
    }

	public Collection getCampusList(String searchBy, String searchText) throws Exception {
		try {
			Collection colTAs;
			if (searchBy.equals("country")) {
				String countryCode = CountryCodes.nameToCode(searchText);
				searchText = (countryCode != null) ? countryCode : searchText;
			}
			if ("region".equalsIgnoreCase(searchBy)) {
				colTAs = InfoBaseQueries.getNonSecureTargetAreasByRegion(searchText);
			} else if ("state".equalsIgnoreCase(searchBy)) {
				colTAs = InfoBaseQueries.getNonSecureTargetAreasByState(searchText);
			} else if ("name".equalsIgnoreCase(searchBy)) {
				colTAs = InfoBaseQueries.getNonSecureTargetAreasByName(searchText);
			} else if ("city".equalsIgnoreCase(searchBy)) {
				colTAs = InfoBaseQueries.getNonSecureTargetAreasByCity(searchText);
			} else if ("zip".equalsIgnoreCase(searchBy)) {
				colTAs = InfoBaseQueries.getNonSecureTargetAreasByZip(searchText);
			} else if ("country".equalsIgnoreCase(searchBy)) {
				colTAs = InfoBaseQueries.getNonSecureTargetAreasByCountry(searchText);
			} else {
				colTAs = new Vector();
			}
			return colTAs;
		}
		catch (Exception e) {
			log(Priority.ERROR, "Failed to perform getCampusList().", e);
			throw new Exception(e);
		}
	}
	public Collection getCampusListLocator(String searchBy, String searchText) throws Exception {
		try {			
			Collection colTAs;
			
			

			if (searchBy.equals("country")) {
				String countryCode = CountryCodes.nameToCode(searchText);
				searchText = (countryCode != null) ? countryCode : searchText;
			}
			
			if ("region".equalsIgnoreCase(searchBy)) {
				colTAs = InfoBaseQueries.getAllTargetAreasByRegion(searchText);
			} else if ("state".equalsIgnoreCase(searchBy)) {
				
				if("CA1".equalsIgnoreCase(searchText)) {
					searchText = "CA1".substring(0,2);
					String number = "CA1".substring(2);
					int _number = Integer.parseInt(number);
					colTAs = InfoBaseQueries.getAllTargetAreasByStateAndZip(searchText, _number);
				}
				
				else if("CA2".equalsIgnoreCase(searchText)) {
					searchText = "CA2".substring(0,2);
					String number = "CA2".substring(2);
					int _number = Integer.parseInt(number);
					colTAs = InfoBaseQueries.getAllTargetAreasByStateAndZip(searchText, _number);
				}
				
				else if("CA3".equalsIgnoreCase(searchText)) {
					searchText = "CA3".substring(0,2);
					String number = "CA3".substring(2);
					int _number = Integer.parseInt(number);
					colTAs = InfoBaseQueries.getAllTargetAreasByStateAndZip(searchText, _number);
				}
				
				else if("NY1".equalsIgnoreCase(searchText)) {
					searchText = "NY1".substring(0,2);
					String number = "NY1".substring(2);
					int _number = Integer.parseInt(number);
					colTAs = InfoBaseQueries.getAllTargetAreasByStateAndZip(searchText, _number);
				}
				
				else if("NY2".equalsIgnoreCase(searchText)) {
					searchText = "NY2".substring(0,2);
					String number = "NY2".substring(2);
					int _number = Integer.parseInt(number);
					colTAs = InfoBaseQueries.getAllTargetAreasByStateAndZip(searchText, _number);
				}
				
				else {
					colTAs = InfoBaseQueries.getAllTargetAreasByState(searchText);
				}
				
			} else if ("name".equalsIgnoreCase(searchBy)) {
				colTAs = InfoBaseQueries.getAllTargetAreasByName(searchText);
			} else if ("city".equalsIgnoreCase(searchBy)) {
				colTAs = InfoBaseQueries.getAllTargetAreasByCity(searchText);
			} else if ("zip".equalsIgnoreCase(searchBy)) {
				colTAs = InfoBaseQueries.getAllTargetAreasByZip(searchText);
			} else if ("country".equalsIgnoreCase(searchBy)) {
				colTAs = InfoBaseQueries.getAllTargetAreasByCountry(searchText);
			} else {
				colTAs = new Vector();
			}
			return colTAs;
		}
		catch (Exception e) {
			log(Priority.ERROR, "Failed to perform getCampusListLocator().", e);
			throw new Exception(e);
		}
	}
	//TODO: THIS METHOD IS HERE ONLY BECAUSE THE CAMPUS LIST PAGE TAKES TOO LONG TO LOAD UP.  THIS VASTLY SHORTENS THE TIME TO LOAD UP THAT PAGE.  HOWEVER, IT SHOULD BE REFACTORED.
	public Collection getCampusListDirectly(String searchBy, String searchText) throws Exception {
		String query = null;
		try {
			String whereClause = "";
			searchText = searchText.replaceAll("'","''");  // Fix any apostrophe problem
			if (searchBy.equals("country")) {
				String countryCode = CountryCodes.nameToCode(searchText);
				searchText = (countryCode != null) ? countryCode : searchText;
				whereClause = "ta.country = '"+searchText+"'";
			}
			
			if ("region".equalsIgnoreCase(searchBy)) {
				whereClause = "ta.region LIKE '%"+searchText+"%'";
			} else if ("state".equalsIgnoreCase(searchBy)) {
				whereClause = "ta.state LIKE '%"+searchText+"%'";
			} else if ("name".equalsIgnoreCase(searchBy)) {
				whereClause = "ta.name LIKE '%"+searchText+"%'";
			} else if ("city".equalsIgnoreCase(searchBy)) {
				whereClause = "ta.city LIKE '%"+searchText+"%'";
			} else if ("zip".equalsIgnoreCase(searchBy)) {
				whereClause = "ta.zip LIKE '%"+searchText+"%'";
			} else if ("country".equalsIgnoreCase(searchBy)) {
				whereClause = "ta.country LIKE '%"+searchText+"%'";
			}
			
			//TODO: exclude closed target areas from this search query
			query = "SELECT TOP 100 PERCENT ta.TargetAreaID, ta.name, ta.city, ta.state, ta.zip, ta.region, taId.strategy, taId.status, taId.teamID, taId.teamName, ta.isClosed " +
						   "FROM ministry_TargetArea ta LEFT OUTER JOIN "+
									  "(SELECT TOP 100 PERCENT act.strategy, act.status, team.teamID, team.name AS teamName, act.fk_targetAreaID "+
									  "FROM ministry_Activity act INNER JOIN ministry_LocalLevel team ON act.fk_teamID = team.teamID "+
									  "WHERE (act.status <> 'IN' "+		// only show activities whose status  is not INACTIVE
									  //"AND act.periodEnd IS null)) "+	// only show activities with no end date
									  "))"+
									  "taId ON ta.TargetAreaID = taId.fk_targetAreaID "+
						   "WHERE ("+whereClause+" AND (ta.isClosed <> 'T' OR ta.isClosed is NULL)) "+
						   "ORDER BY ta.name";
			
			java.sql.Connection conn = org.alt60m.util.DBConnectionFactory.getDatabaseConn();

			java.sql.Statement stmt = conn.createStatement();
			java.sql.ResultSet rs = stmt.executeQuery(query);
		
			Vector colTAs = new Vector();
			while (rs.next()) {
				Hashtable theTargetAreaHash = new Hashtable();
				theTargetAreaHash.put("TargetAreaId",isNull(rs.getString(1)));
				theTargetAreaHash.put("Name",isNull(rs.getString(2)));
				theTargetAreaHash.put("City",isNull(rs.getString(3)));
				theTargetAreaHash.put("State",isNull(rs.getString(4)));
				theTargetAreaHash.put("Zip",isNull(rs.getString(5)));
				theTargetAreaHash.put("Region",isNull(rs.getString(6)));
				theTargetAreaHash.put("Strategy",(rs.getString(7)==null?"":org.alt60m.ministry.Strategies.expandStrategy(rs.getString(7))));
				theTargetAreaHash.put("Status",(rs.getString(8)==null?"":getStatusFullName(rs.getString(8))));
				theTargetAreaHash.put("LocalLevelId",isNull(rs.getString(9)));
				theTargetAreaHash.put("TeamName",isNull(rs.getString(10)));
				colTAs.add(theTargetAreaHash);
			}
			
			stmt.close();
			conn.close();
			
			return colTAs;
		}
		catch (Exception e) {
			e.printStackTrace();
			log(Priority.ERROR, "Failed to perform getCampusList().  Offending query:" + query, e);
			throw new Exception(e);
		}
	}

    public LocalLevel getLocalLevelTeam(String llId) throws Exception {
        try {
			return new LocalLevel(llId);
        } catch (Exception e) {
            log(Priority.ERROR, "Failed to perform getLocalLevelTeam().", e);
			throw new Exception(e);
        }
    }
	
    public Collection getLocalLevelTeamsByRegion(String region) throws Exception {
        try {
			return InfoBaseQueries.getLocalLevelTeamsByRegion(region);
        } catch (Exception e) {
            log(Priority.ERROR, "Failed to perform getLocalLevelTeamsByRegion().", e);
 			throw new Exception(e);
        }
    }

    public NonCccMin getNonCccMin(String nonCccMinId) throws Exception {
        try {
			return new NonCccMin(nonCccMinId);
        } catch (Exception e) {
            log(Priority.ERROR, "Failed to perform getNonCccMin().", e);
			throw new Exception(e);
        }
    }

    public Collection getNonSecureCampusList(String searchBy, String searchText) throws Exception {
        try {
            Collection colTAs;
			if (searchBy.equals("country")) {
                String countryCode = CountryCodes.nameToCode(searchText);
                searchText = (countryCode != null) ? countryCode : searchText;
            }
			if ("region".equalsIgnoreCase(searchBy)) {
				colTAs = InfoBaseQueries.getAllTargetAreasByRegion(searchText);
			} else if ("state".equalsIgnoreCase(searchBy)) {
				colTAs = InfoBaseQueries.getAllTargetAreasByState(searchText);
			} else if ("name".equalsIgnoreCase(searchBy)) {
				colTAs = InfoBaseQueries.getAllTargetAreasByName(searchText);
			} else if ("city".equalsIgnoreCase(searchBy)) {
				colTAs = InfoBaseQueries.getAllTargetAreasByCity(searchText);
			} else if ("zip".equalsIgnoreCase(searchBy)) {
				colTAs = InfoBaseQueries.getAllTargetAreasByZip(searchText);
			} else if ("country".equalsIgnoreCase(searchBy)) {
				colTAs = InfoBaseQueries.getAllTargetAreasByCountry(searchText);
			} else {
				colTAs = new Vector();
			}
			return colTAs;
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform getNonSecureCampusList().", e);
			throw new Exception(e);
        }
    }

    public RegionalStat getRegionalStatObject(String statId) throws Exception {
        try {
			return new RegionalStat(statId);
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform getRegionalStatObject().", e);
  			throw new Exception(e);
        }
    }

	public Collection getRegionalStats(String region, Hashtable[] allDates) throws Exception {
        try {
 			Object[] params = new Object[] { region.toUpperCase(), allDates[0].get("PeriodBegin"), allDates[15].get("PeriodEnd") };
			Collection c = ObjectHashUtil.list(InfoBaseQueries.getRegionalStats(params));
			return c;
		}
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform getRegionalStats().", e);
 			throw new Exception(e);
       }
	}

    public RegionalTeam getRegionalTeam(String region) throws Exception {
        try {
			return InfoBaseQueries.getRegionalTeam(region);
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform getRegionalTeam().", e);
 			throw new Exception(e);
       }
    }

    public int getReportedCnt(Date since) throws Exception {
        try {
 			return InfoBaseQueries.getReportedCnt(since);
       }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform getReportedCnt().", e);
  			throw new Exception(e);
        }
    }

    public Collection getStaffListForRegion(String region) throws Exception {
        Calendar cal = java.util.Calendar.getInstance();
        cal.add(Calendar.DAY_OF_YEAR, -1);
		if (staffByRegionCache.lastUpdated == null || cal.after(staffByRegionCache.lastUpdated)) {
	        for(int cnt=0;cnt<_abbrevRegion.length;cnt++) {
	            String thisRegion =_abbrevRegion[cnt];
				Collection staff = InfoBaseQueries.listStaffByRegion(thisRegion);
				Collection list = new Vector();
				for (Iterator i = staff.iterator(); i.hasNext(); ) {
				    list.add(emulateOldStaffStructure((Staff)i.next()));
				}
	            staffByRegionCache.staffByRegion.put(thisRegion, list);
	        }
            staffByRegionCache.lastUpdated = new Date();
        }
        return (Collection) staffByRegionCache.staffByRegion.get(region);
    }

    public Staff getStaffObject(String staffId) throws Exception {
        try {
			return new Staff(staffId);
        } catch (Exception e) {
            log(Priority.ERROR, "Failed to perform saveStatObjectWithActivity().", e);
 			throw new Exception(e);
       }
	}
	
	public Statistic getStatObject(String statisticId) throws Exception {
		try  {
			return new Statistic(statisticId);
		} catch (Exception e) {
            log(Priority.ERROR, "Failed to perform getStatObject().", e);
			throw new Exception(e);
		}
	}
	private String getStatusFullName(String status) {
		if (status.equalsIgnoreCase("AC")) return "Active";
		if (status.equalsIgnoreCase("IN")) return "Inactive";
		if (status.equalsIgnoreCase("KE")) return "Key Contact";
		if (status.equalsIgnoreCase("LA")) return "Launched";
		if (status.equalsIgnoreCase("PI")) return "Pioneering";
		if (status.equalsIgnoreCase("TR")) return "Transformational";
		if (status.equalsIgnoreCase("FR")) return "Forerunner";
		return "Unknown";
	}

    public TargetArea getTargetArea(String targetAreaId) throws Exception {
        try {
 			return new TargetArea(targetAreaId);
        } catch (Exception e) {
            log(Priority.ERROR, "Failed to perform getTargetArea().", e);
			throw new Exception(e);
        }
    }

    public Collection getTargetAreasByRegion(String region) throws Exception {
        try {
            Collection teams = InfoBaseQueries.getTargetAreasByRegion(region);
			return teams;
        } catch (Exception e) {
            log(Priority.ERROR, "Failed to perform getTargetAreasByRegion().", e);
 			throw new Exception(e);
        }
    }

	public Collection getTargetAreaStats(String targetAreaId, Hashtable[] allDates) throws Exception {
        try {
			Collection c = ObjectHashUtil.list(InfoBaseQueries.listStatsForTargetArea(targetAreaId, (Date)allDates[0].get("PeriodBegin"),
                (Date)allDates[15].get("PeriodEnd")));
			return c;
		}
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform getTargetAreaStats().", e);
			throw new Exception(e);
        }

	}

	public Collection getTargetAreaStats(String targetAreaId, Hashtable[] allDates, List strategies) throws Exception {
        try {
			Collection c = ObjectHashUtil.list(InfoBaseQueries.listStatsForTargetArea(targetAreaId, (Date)allDates[0].get("PeriodBegin"),
                (Date)allDates[15].get("PeriodEnd"), strategies));
			return c;
		}
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform getTargetAreaStats().", e);
  			throw new Exception(e);
      }
	}

    boolean inList(String[] list, String value) {
        for (int i = 0; i < list.length; i++) {
            if (list[i].equalsIgnoreCase(value)) return true;
        }
        return false;
    }
	
	private String isNull(String arg) {
		return arg == null ? "" : arg;
	}

    boolean isNullOrEmpty(String string) {
        return !(string != null && string.length() > 0);
    }

    // *************************************************************************
    // Expectatations:
    //		
    //	Returns:
    //		
    // History:
    //		3/19/01		MDP		Initial coding
    // *************************************************************************
    public Collection listStaff(String searchBy, String searchText) throws Exception {
		try {
			Collection list = null;
			if (searchBy.equals("lastname")) {
				Vector staffList = InfoBaseQueries.listStaffByLastName(searchText);
                list = new Vector();
                for (Iterator i = staffList.iterator(); i.hasNext(); ) {
 					Staff thisStaff = (Staff)i.next();
					list.add(emulateOldStaffStructure(thisStaff));
                }
 			} else if (searchBy.equals("region")) {
				list = getStaffListForRegion(searchText);
			}
			return list;
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform listStaff().", e);
			throw new Exception(e);
        }
    }

    public Collection listStaffByRegionSQL(String region) throws Exception {
        try {
			return InfoBaseQueries.listStaffHashByRegion(region);
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform listStaffByRegionSQL().", e);
  			throw new Exception(e);
        }
    }

    public Collection listStaffHashByLastName(String lastName) throws Exception {
        try {
			return InfoBaseQueries.listStaffHashByLastName(lastName);
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform listStaffHashByLastName().", e);
  			throw new Exception(e);
        }
    }

    static private java.sql.Date parseSimpleDate(String date) throws java.text.ParseException {
        StringTokenizer tokens = new StringTokenizer(date, "/");
        if (tokens.countTokens() != 3)
            throw new ParseException("Unparsable: " + date, 0);
        int month = Integer.parseInt(tokens.nextToken()) - 1;
        int day = Integer.parseInt(tokens.nextToken());
        int year = Integer.parseInt(tokens.nextToken());
        Calendar c = Calendar.getInstance();
        c.set(year, month, day);
        return new java.sql.Date(c.getTime().getTime());
    }

    public void removeContact(String activityId, String staffId) throws Exception {
        try {
            Staff staff = new Staff(staffId);
            Activity activity = new Activity(activityId);
            activity.dissocContact(staff);
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform removeContact().", e);
  			throw new Exception(e);
        }
    }

    public void removeMin(String targetAreaId, String nonCccMinId) throws Exception {
        try {
            NonCccMin ministry = new NonCccMin(nonCccMinId);
            TargetArea target = new TargetArea(targetAreaId);
			ministry.removeOtherMinistry(target);
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform removeMin().", e);
  			throw new Exception(e);
       }
    }
	
	public void removeStaff(String staffId) throws Exception {
		try {
			Staff staff = new Staff(staffId);
			staff.setLocalLevelId("");
			staff.persist();
		}
		catch (Exception e) {
			log(Priority.ERROR, "Failed to perform removeStaff().", e);
			throw new Exception(e);
		}
	}

	public void removeStaff(String localLevelId, String staffId) throws Exception {
		try {
			removeStaff(staffId);
		}
		catch (Exception e) {
			log(Priority.ERROR, "Failed to perform removeStaff().", e);
			throw new Exception(e);
		}
	}

    public void saveActivity(String localLevelId, String targetAreaId, String strategy, String status, String periodBegin) throws Exception {
        try {
            Activity activity = new Activity();
            activity.setStrategy(strategy);
            activity.setStatus(status);
            activity.setPeriodBegin(parseSimpleDate(periodBegin));
            LocalLevel team = new LocalLevel(localLevelId);
            TargetArea target = new TargetArea(targetAreaId);
            activity.setTeam(team);
            activity.setTargetArea(target);
            activity.persist();
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform saveActivity().", e);
 			throw new Exception(e);
        }
    }

    public void saveAddCampusToMin(String targetAreaId, String nonCccMinId) throws Exception {
        try {
            saveAddMinToCampus(targetAreaId, nonCccMinId);
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform saveAddCampusToMin().", e);
  			throw new Exception(e);
        }
    }

    public void saveAddMinToCampus(String targetAreaId, String nonCccMinId) throws Exception {
        try {
            NonCccMin ministry = new NonCccMin(nonCccMinId);
            TargetArea target = new TargetArea(targetAreaId);
            ministry.addOtherMinistry(target);
        } catch (Exception e) {
            log(Priority.ERROR, "Failed to perform saveAddMinToCampus().", e);
 			throw new Exception(e);
        }
    }

    public void saveAddTeamToCampus(String strategy, String targetAreaId, String localLevelId, String periodBegin, String profileId, String status) throws Exception {
        try {
			Activity activity = new Activity();
            activity.setPeriodBegin(parseSimpleDate(periodBegin));
            TargetArea target = new TargetArea(targetAreaId);
            LocalLevel team = new LocalLevel(localLevelId);
            activity.setTransUsername(profileId);
            activity.setStrategy(strategy);
            activity.setTargetArea(target);
            activity.setTeam(team);
            if (strategy.equalsIgnoreCase("CA"))
                activity.setStatus(status);
            else
                activity.setStatus("AC");
			activity.persist();
        } catch (Exception e) {
            log(Priority.ERROR, "Failed to perform saveAddTeamToCampus().", e);
 			throw new Exception(e);
        }
    }

    public void saveAssociateStaff(String localLevelId, String[] staffIds) throws Exception {
        try {
            if (staffIds != null) {
                for (int i = 0; i < staffIds.length; i++) {
                    Staff staff =  new Staff(staffIds[i]);
                    staff.setLocalLevelId(localLevelId);
                    staff.persist();
                }
            }
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform saveAssociateStaff().", e);
  			throw new Exception(e);
        }
    }

    public void saveContact(String staffId, String activityId) throws Exception {
        try {
            Staff staff = new Staff(staffId);
            Activity activity = new Activity(activityId);
            activity.addActivityContacts(staff);
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform saveContact().", e);
  			throw new Exception(e);
        }
    }

    
    synchronized static public void saveEditActivity(String activityId, String periodEnd, String strategy, String updateOption, String profileId, String newTeamId) throws Exception, ActivityExistsException{
        //TODO: add history capabilities to preserve all previous states
    	
    	try {
            Activity activity = new Activity(activityId);
            activity.setTransUsername(profileId);
            
            LocalLevel newTeam = null;
            boolean changeTeam = false;
            
            if (!newTeamId.equals("none")) {
                changeTeam = true;
                newTeam = new LocalLevel(newTeamId);
            }
           
            // if there is no change in status or strategy (only team maybe)
            if (updateOption.equals("nc")) {
                if (changeTeam) {
                	activity.setPeriodEnd(parseSimpleDate(periodEnd));
                	Activity newTeamActivity = new Activity();
					newTeamActivity.setStatus(activity.getStatus());
					activity.setStatus("IN");
					newTeamActivity.setTransUsername(profileId);
					newTeamActivity.setTargetAreaId(activity.getTargetAreaId());
					newTeamActivity.setPeriodBegin(parseSimpleDate(periodEnd));
					newTeamActivity.setLocalLevelId(newTeamId);
					newTeamActivity.setStrategy(activity.getStrategy());
					
					//	be sure not to create the new activity if it already exists
					//	select to see if it already exists
					newTeamActivity.select();
					if(newTeamActivity.isPKEmpty()||newTeamActivity.getStatus().equals("IN"))
					{
						newTeamActivity.persist();
						activity.persist();
					}
					//else - no change to old activity - GOOD!
				}               
            // if status is being changed to INACTIVE
            } else if (updateOption.equals("rm")) {
                activity.setStatus("IN");
                activity.setPeriodEnd(parseSimpleDate(periodEnd));
                activity.persist();
                
            // if strategy is being changed to Staffed Campus from something else (status ACTIVE)
            } else if (updateOption.equals("sc")) {
                
            	Activity checkActivity = new Activity();
				checkActivity.setStatus("AC");
				checkActivity.setTargetAreaId(activity.getTargetAreaId());
				checkActivity.setStrategy("SC");
				checkActivity.select();
				// SC activity exists at this target area for some team
				if(!checkActivity.isPKEmpty())
				{
					throw new ActivityExistsException("Strategy is already active for this target area.");
				}
				else	// no active SC activity at this target area for ANY team
				{
					//	if change team - create new team's activity, deactivate old team's activity
	            	if (changeTeam) {
	 					activity.setPeriodEnd(parseSimpleDate(periodEnd));
						Activity newTeamActivity = new Activity();
						newTeamActivity.setStatus("AC");
						activity.setStatus("IN");	// deactivate old activity
										
						newTeamActivity.setTransUsername(profileId);
						newTeamActivity.setTargetAreaId(activity.getTargetAreaId());
						newTeamActivity.setPeriodBeginString(periodEnd);
						newTeamActivity.setLocalLevelId(newTeamId);
						newTeamActivity.setStrategy("SC");
	
						//	be sure not to create the new activity if it has already been created (possibly by another thread)
						// if this exact new team activity was not already created, update old and new activities
						newTeamActivity.select();
						
						activity.persist();
						newTeamActivity.persist();
						
	                 } 
	            	//	else update current team's activity 
		            else {
		            	activity.setStatus("AC");
	                 	activity.setStrategy("SC");
	                 	activity.persist();
					}
				}
                
            // if status is being changed to a catalytic status: Forerunner, Pioneering, Key Contact, Launched, or Transformational
            } else if (updateOption.equals("IN") || updateOption.equals("AC") || updateOption.equals("PI") ||
                updateOption.equals("KE") || updateOption.equals("LA") || updateOption.equals("TR") || updateOption.equals("FR")) {
					
            	Activity checkActivity = new Activity();
				checkActivity.setTargetAreaId(activity.getTargetAreaId());
				checkActivity.setStrategy("CA");
				
				// a different active CA activity exists at this target area for some team
				// don't activate (if inactive) an activity if there is already one active at that target area
				if(checkActivity.select("fk_targetAreaID= "+activity.getTargetAreaId()+" AND strategy= 'CA' AND status<>'IN' AND ActivityID<>"+activityId))
				{
					throw new ActivityExistsException("There is already an active catalytic activity at this target area.");
				}
				else	// no active CA activity at this target area for ANY team
				{
					if (changeTeam) {
						activity.setPeriodEnd(parseSimpleDate(periodEnd));
						Activity newTeamActivity = new Activity();
						
						newTeamActivity.setTargetAreaId(activity.getTargetAreaId());
						newTeamActivity.setStrategy("CA");
						newTeamActivity.setStatus(updateOption);	// activate new team's activity
						
						activity.setStatus("IN");	// inactivate old team's activity
						activity.persist();			// update old activity
						
						newTeamActivity.setTransUsername(profileId);
						newTeamActivity.setPeriodBeginString(periodEnd);
						newTeamActivity.setLocalLevelId(newTeamId);
						
						// be sure not to CREATE the new activity if it has already exists (to avoid identical duplicates)
						newTeamActivity.select();
						newTeamActivity.persist();	// add new team's activity
						
                    } else {
                    	// update activity
                    	activity.setStrategy("CA");
                    	activity.setStatus(updateOption);
    					activity.persist();
                    	//}
    					//else
    					//	throw new ActivityExistsException("Strategy is already active for this target area.");
					}
				}
            }          
        }
        catch (ActivityExistsException aee) {
        	log(Priority.ERROR, "Failed to perform saveEditActivity().", aee);
 			throw aee;
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform saveEditActivity().", e);
 			throw new Exception(e);
        }
    }

    public void saveNewCampus(Hashtable request) throws Exception {
        try {
            TargetArea target = new TargetArea();
			ObjectHashUtil.hash2obj(request, target);
            target.persist();
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform saveNewCampus().", e);
			throw new Exception(e);
        }
    }

    public void saveNonCCCMin(String mode, String nonCccMinId, String targetAreaId, Hashtable request) throws Exception {
        try {
            NonCccMin nonCccMin;
            if (mode.equals("update")) {
                nonCccMin = new NonCccMin(nonCccMinId);
                ObjectHashUtil.hash2obj(request, nonCccMin);
                nonCccMin.persist();
            } else {
                nonCccMin = new NonCccMin();
                ObjectHashUtil.hash2obj(request, nonCccMin);
                nonCccMin.persist();
                TargetArea target = new TargetArea(targetAreaId);
                nonCccMin.assocTargetArea(target);
            }
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform saveNonCCCMin().", e);
 			throw new Exception(e);
        }
    }

    public void saveRegionalSuccessCriteria(Hashtable request, RegionalStat regionalStat, String region, Date periodBegin, Date periodEnd) throws Exception {
        try {
            ObjectHashUtil.hash2obj(request, regionalStat);
            RegionalTeam team = new RegionalTeam();
            team.setRegion(region);
            team.select();
            regionalStat.setPeriodBegin(periodBegin);
            regionalStat.setPeriodEnd(periodEnd);
            regionalStat.setRegionalTeam(team);
            regionalStat.persist();
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform saveRegionalSuccessCriteria().", e);
  			throw new Exception(e);
        }
    }

    public void saveRegionInfo(Hashtable request, String region) throws Exception {
        try {
            RegionalTeam rt = InfoBaseQueries.getRegionalTeam(region);
			ObjectHashUtil.hash2obj(request, rt);
			rt.persist();
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform saveRegionInfo().", e);
			throw new Exception(e);
        }
    }
	
    public void saveStatObjectWithActivity(Hashtable request, Statistic stat, String activityId) throws Exception {
        try {
			ObjectHashUtil.hash2obj(request, stat);
            stat.setActivityId(activityId);
            stat.persist();
        } catch (Exception e) {
            log(Priority.ERROR, "Failed to perform saveStatObjectWithActivity().", e);
 			throw new Exception(e);
 		}
    }

    public void saveTargetAreaInfo(Hashtable request, String targetAreaId) throws Exception {
        try {
            TargetArea ta = new TargetArea(targetAreaId);
            ObjectHashUtil.hash2obj(request, ta);
            ta.persist();
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform saveTargetAreaInfo().", e);
 			throw new Exception(e);
       }
    }

    public static synchronized void saveTeam(Hashtable request, String localLevelId, String mode) throws Exception {
        try {
            LocalLevel ll;
            if (mode.equals("update")) {
                ll = new LocalLevel(localLevelId);
            } else {
                ll = new LocalLevel();
            }
            ObjectHashUtil.hash2obj(request, ll);
            ll.setIsActive(request.get("IsActive").equals("TRUE"));
            
            //if(!mode.equals("update"))
            //{
            	ll.select(); // make sure new team hasn't already been created
            //}
            ll.persist();
        }
        catch (Exception e) {
            log(Priority.ERROR, "Failed to perform saveTeam().", e);
 			throw new Exception(e);
        }
    }

	public void sendTargetAreaRequestEmail(Hashtable request, String to, String profileId) throws Exception {
		try {
			SendMessage msg = new SendMessage();
			msg.setTo(to);
			msg.setFrom("\"StaffSite_InfoBase\" <help@campuscrusadeforchrist.com>");
			msg.setSubject("New Target Area Request");
			StringBuffer msgText = new StringBuffer(2000);
				msgText.append("To whom it may concern, \n");
				msgText.append("   This is an automated request for a new target area.\n\n\n");
				msgText.append("-----------------------------------------------------------------\n");
				msgText.append("Campus Name: " + request.get("name") + "\n");
				msgText.append("Campus Address 1: " + request.get("address1") + "\n");
				msgText.append("Campus Address 2: " + request.get("address2") + "\n");
				msgText.append("Campus City: " + request.get("city") + "\n");
				msgText.append("State: " + request.get("state") + "\n");
				msgText.append("Campus ZIP: " + request.get("zip") + "\n");
				msgText.append("Country: " + request.get("country") + "\n");
				msgText.append("Campus Phone: " + request.get("phone") + "\n");
				msgText.append("Campus Fax: " + request.get("fax") + "\n");
				msgText.append("Campus Email: " + request.get("email") + "\n");
				msgText.append("Campus Webpage URL: " + request.get("url") + "\n");
				msgText.append("Campus Abbreviation: " + request.get("abbrv") + "\n");
				msgText.append("Campus Fice: " + request.get("fice") + "\n");
				//msgText.append("Campus Population: " + request.get("population") + "\n");
				msgText.append("Campus Notes: " + request.get("note") + "\n");
				msgText.append("Campus Alternate Name: " + request.get("altName") + "\n");
				msgText.append("Is this campus secure/closed? " + request.get("isSecure") + "\n");
				msgText.append("Campus Region: " + request.get("region") + "\n");
				msgText.append("Campus MPTA: " + request.get("mpta") + "\n");
				msgText.append("Campus AOA: " + request.get("aoa") + "\n");
				msgText.append("Campus AOA Priority: " + request.get("aoaPriority") + "\n");
				msgText.append("Info URL: " + request.get("infoUrl") + "\n");
				msgText.append("CIA URL: " + request.get("ciaUrl") + "\n");
				msgText.append("Submitters Email Address: " + request.get("from") + "\n");
				msgText.append("-----------------------------------------------------------------\n");
				msgText.append(" As entered by userid '" + profileId + "' on " + new Date().toString() + ".");
			msg.setBody(msgText.toString());
			msg.send();
		}
		catch (Exception e) {
			log(Priority.ERROR, "Failed to perform sendTargetAreaRequestEmail().", e);
			throw new Exception(e);
		}
	}

	public void sendLocalLevelRequestEmail(Hashtable request, String to, String profileId) throws Exception {
		try {
			SendMessage msg = new SendMessage();
			msg.setTo(to);
			msg.setFrom("\"StaffSite_InfoBase\" <help@campuscrusadeforchrist.com>");
			msg.setSubject("New Local Level Request");
			StringBuffer msgText = new StringBuffer(2000);
				msgText.append("To whom it may concern, \n");
				msgText.append("   This is an automated request for a new target area.\n\n\n");
				msgText.append("-----------------------------------------------------------------\n");
				msgText.append("Team Name: " + request.get("Name") + "\n");
				msgText.append("Lane: " + request.get("Lane") + "\n");
				msgText.append("Region: " + request.get("Region") + "\n");
				msgText.append("Address 1: " + request.get("Address1") + "\n");
				msgText.append("Address 2: " + request.get("Address2") + "\n");
				msgText.append("City: " + request.get("City") + "\n");
				msgText.append("State: " + request.get("State") + "\n");
				msgText.append("Zip: " + request.get("Zip") + "\n");
				msgText.append("Country: " + request.get("Country") + "\n");
				msgText.append("Phone: " + request.get("Phone") + "\n");
				msgText.append("Fax: " + request.get("Fax") + "\n");
				msgText.append("Email: " + request.get("Email") + "\n");
				msgText.append("Webpage URL: " + request.get("Url") + "\n");
				msgText.append("Is this team active? " + (request.get("IsActive").equals("TRUE") ? "Yes" : "No") + "\n");
				msgText.append("Note: " + request.get("Note") + "\n");
				msgText.append("-----------------------------------------------------------------\n");
				msgText.append(" As entered by userid '" + profileId + "' on " + new Date().toString() + ".");
			msg.setBody(msgText.toString());
			msg.send();
		}
		catch (Exception e) {
			log(Priority.ERROR, "Failed to perform sendTargetAreaRequestEmail().", e);
			throw new Exception(e);
		}
	}
}