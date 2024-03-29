package org.alt60m.ministry.servlet.modules.stat;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.alt60m.ministry.MissingTargetAreaIdException;
import org.alt60m.ministry.Strategy;
import org.alt60m.ministry.model.dbio.Activity;
import org.alt60m.ministry.model.dbio.Statistic;
import org.alt60m.ministry.model.dbio.TargetArea;
import org.alt60m.servlet.ActionResults;
import org.alt60m.util.ObjectHashUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class StatHelper extends
		org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper {
	private static Log log = LogFactory.getLog(StatHelper.class);

	public static ActionResults fastStats(ArrayList<Activity> activities)
			throws Exception // IJK
	{
		ActionResults multiResults = new ActionResults("fastStat");
		SimpleDateFormat shortFormat = new SimpleDateFormat("M/dd");
		SimpleDateFormat fullFormat = new SimpleDateFormat("MM/dd/yyyy");
		for (Activity activity : activities) {
			String strategy = activity.getStrategy(); // if strategy is Bridges,
														// go thru each
														// peopleGroup option
														// and invoke a stat
														// object/ActionResult
														// for it.
			Iterator<String> peopleIter;
			if (strategy.equals("BR")) {
				peopleIter = Arrays.asList("(Other Internationals)",
						"East Asian", "Ishmael Project", "Japanese",
						"South Asian").iterator();
			} else {
				peopleIter = Arrays.asList("").iterator();
			}
			while (peopleIter.hasNext()) {

				String peopleGroup = (String) peopleIter.next();
				List<Hashtable<String, Object>> allDates = blankStatsCalendar("StatisticId");
				ActionResults results = new ActionResults("hold each result");
				TargetArea targetArea = activity.getTargetArea();
				String status = activity.getStatus();
				String targetAreaId = targetArea.getTargetAreaId();
				if (targetAreaId == null || targetAreaId.equals("")) {
					throw new MissingTargetAreaIdException("Activity "
							+ activity.getActivityId()
							+ " does not have an associated targetArea");
				}
				results.putValue("targetareaid", targetAreaId);
				results.putValue("activityid", activity.getActivityId());
				results.putValue("status", status);
				results.putValue("strategy", strategy);
				results.putValue("peopleGroup", peopleGroup);
				Collection<Hashtable<String, Object>> stats = getBridgesTargetAreaStats(
						targetAreaId, allDates, strategy, peopleGroup);
				allDates = populateStatsCalendar(stats.iterator(), allDates);
				for (int cnt = 0; cnt < 16; cnt++) {
					Hashtable<String, Object> row = allDates.get(cnt);
					row.put("PeriodBeginShort", shortFormat.format(row.get("PeriodBegin")));
					row.put("PeriodEndShort", shortFormat.format(row.get("PeriodEnd")));
					row.put("PeriodBegin", fullFormat.format(row.get("PeriodBegin")));
					row.put("PeriodEnd", fullFormat.format(row.get("PeriodEnd")));
				}
				results.addCollection("statistics", allDates);
				results
						.putValue(
								"displayname",
								targetArea.getName()
										+ " - "
										+ Strategy.expandStrategy(strategy)
										+ ((strategy.equals("BR")) ? "&%@!"
												+ (peopleGroup.equals("null") ? "(Other Internationals)"
														: peopleGroup)
												: ""));
				results.putValue("location_name", targetArea.getName());
				results.putValue("strategy_name", Strategy
						.expandStrategy(strategy));
				results
						.putValue(
								"people_group_name",
								((strategy.equals("BR")) ? (peopleGroup
										.equals("null") ? "(Other Internationals)"
										: peopleGroup)
										: ""));
				multiResults.addActionResults(results.getValue("displayname")
						+ "_" + activity.getActivityId(), results);
			}
		}
		return multiResults;
	}

	public static Collection<Hashtable<String, Object>> getBridgesTargetAreaStats(
			String targetAreaId, List<Hashtable<String, Object>> allDates,
			String strategy, String peopleGroup) throws Exception {
		try {

			Collection<Hashtable<String, Object>> c = ObjectHashUtil
					.list(StatQueries.listBridgesStatsForTargetArea(
							targetAreaId, (Date) allDates.get(0).get(
									"PeriodBegin"), (Date) allDates.get(15)
									.get("PeriodEnd"), strategy, peopleGroup));
			return c;
		} catch (Exception e) {
			log.error("Failed to perform getBridgesTargetAreaStats().", e);
			throw new Exception(e);
		}
	}

	protected static List<Hashtable<String, Object>> blankStatsCalendar(
			String statId) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		calendar.add(Calendar.WEEK_OF_YEAR, -15);
		List<Hashtable<String, Object>> allDates = new ArrayList<Hashtable<String, Object>>();
		for (int cnt = 0; cnt < 16; cnt++) {
			Hashtable<String, Object> noEntry = new Hashtable<String, Object>();
			noEntry.put("PeriodBegin", calendar.getTime());
			if(calendar.get(Calendar.DAY_OF_MONTH) < 7) {
				noEntry.put("FirstWeek", true);
			} else {
				noEntry.put("FirstWeek", false);
			}
			calendar.add(Calendar.DAY_OF_MONTH, 6);
			noEntry.put("PeriodEnd", calendar.getTime());
			calendar.add(Calendar.DAY_OF_MONTH, 1);
			noEntry.put(statId, "");
			allDates.add(noEntry);
		}
		return allDates;
	}

	protected static List<Hashtable<String, Object>> populateStatsCalendar(
			Iterator<Hashtable<String, Object>> enteredStats,
			List<Hashtable<String, Object>> allDates) {
		SimpleDateFormat sqlFormat = new SimpleDateFormat("dd-MMM-yyyy");
		while (enteredStats.hasNext()) {
			Hashtable<String, Object> row = enteredStats.next();
			for (int cnt = 0; cnt < 16; cnt++) {
				Date begin = (Date) row.get("PeriodBegin");
				if (sqlFormat.format(begin).equals(sqlFormat.format(allDates.get(cnt).get("PeriodBegin")))) {
					row.put("FirstWeek", allDates.get(cnt).get("FirstWeek"));
					allDates.set(cnt, row);
				}
			}
		}
		return allDates;
	}

	public Statistic createStatObject() throws Exception {
		try {
			Statistic stat = new Statistic();
			stat.persist();
			return stat;
		} catch (Exception e) {
			log.error("Failed to perform createStatObject().");
			throw e;
		}
	}

	public Statistic getStatObject(String statisticId) throws Exception {
		try {
			return new Statistic(statisticId);
		} catch (Exception e) {
			log.error("Failed to perform getStatObject().", e);
			throw new Exception(e);
		}
	}

	public void saveStatObjectWithActivity(Map<String, String> statMap,
			Statistic stat) throws Exception {
		try {
			ObjectHashUtil.hash2obj(statMap, stat);
			stat.setUpdatedAt(new Timestamp(new Date().getTime()));
			String logMessage = "Saving stat ID: " + stat.getStatisticId()
					+ " for Activity: " + stat.getActivityId() + " ; ";
			for (String key : statMap.keySet()) {
				logMessage += " " + key + ": " + statMap.get(key);
			}
			log.info(logMessage);
			stat.persist();
		} catch (Exception e) {
			log.error("Failed to perform saveStatObjectWithActivity().", e);
			throw new Exception(e);
		}
	}

}
