package org.alt60m.ministry.servlet;

import org.alt60m.ministry.model.dbio.*;

import java.util.Collection;

public class TeamInfo {

    public Collection getLocalLevelTeamsByRegion(String region) throws Exception {
		return InfoBaseQueries.getLocalLevelTeamsByRegion(region);
    }

    public Collection getActiveLocalLevelTeams() throws Exception {
		return InfoBaseQueries.getActiveLocalLevelTeams();
    }

    public Collection getLocalLevelTeams() throws Exception {
		LocalLevel team = new LocalLevel();
		return team.selectList("SELECT team FROM ministry_LocalLevel team ORDER BY team.name");
    }
}
