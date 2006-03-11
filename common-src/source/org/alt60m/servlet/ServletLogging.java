package org.alt60m.servlet;
import java.util.*;

class LogEvent {
	private Date	_date;
	private String _section;
	private String _userName;
	private String _action;

	public LogEvent(String section, String userName, String action) {
		_date = new Date();
		_section = section;
		_userName = userName;
		_action = action;
	}
	public Date   getDate() {return _date;}
	public String getSection() {return _section;}
	public String getUserName() {return _userName;}
	public String getAction() {return _action;}

};

class LogSummaryItem {

	private String _userName = null;	
	private String _section = null;	
	private String _lastAction = null;
	private Date _lastActionDate = null;
	private int _totalActionCnt = 0;

	public LogSummaryItem(LogEvent evt) {
		_userName= evt.getUserName();
		eatLogEvent(evt);
	}

	public void eatLogEvent(LogEvent evt) {
		_section = evt.getSection();

		
		if(_lastActionDate == null || evt.getDate().after(_lastActionDate)) {
			_lastAction = evt.getAction();
			_lastActionDate = evt.getDate();
		}

		_totalActionCnt++;
		
	}

	public String getUserName() { return _userName; }
	public String getSection() { return _section; }
	public String getLastAction() { return _lastAction; }
	public Date   getLastActionDate() { return _lastActionDate; }
	public int    getTotalActionCnt() { return _totalActionCnt; }

	public String toString() {
		long idleMinutes = (System.currentTimeMillis() - _lastActionDate.getTime()) / (1000 * 60);

		return "idleMinutes=" + idleMinutes + ", lastActionDate="+ _lastActionDate +", userName="+ _userName+", action="+_lastAction+", totalActionCnt="+_totalActionCnt+", section="+_section+"}";
	}
};


public class ServletLogging
{
	List events;

	private static final long DEFAULT_TIME_TO_STORE = 30 * 60; // 30 minutes
	private long timeToStore;

	public ServletLogging() {
		this(DEFAULT_TIME_TO_STORE);
	}

	public ServletLogging(long secondsToStore) {
		timeToStore = secondsToStore;
		events = new LinkedList();
	};

	public synchronized void addEvent(String section, String userName, String action) {

		trimData();

		LogEvent ev = new LogEvent(section, userName, action);

		events.add(ev);

	}

	private void trimData() {
	
		while (events.size() > 0) {
			LogEvent ev = (LogEvent) events.get(0);
			if (secondsBetween(new Date(), ev.getDate()) > timeToStore) {
				events.remove(0);
			} else {
				return;
			}
		}
	}

	private long secondsBetween(Date a, Date b) {
		return (a.getTime() - b.getTime()) / 1000;
	}


	public synchronized Collection getSummary() {
		return getSummary(timeToStore); // return everything stored
	}

	public synchronized Collection getSummary(long secondsOfHistory) {
		
		trimData();

		Date includeAfter = new Date(new Date().getTime() - (secondsOfHistory * 1000));

		Map summaries = new TreeMap();

		ListIterator li = events.listIterator(events.size());
		while(li.hasPrevious()) {
			
			LogEvent item = (LogEvent) li.previous();

			if(includeAfter.before(item.getDate())) {
				LogSummaryItem sum;

				if (summaries.containsKey(item.getUserName())) {
					sum = (LogSummaryItem) summaries.get(item.getUserName());
				} else {
					sum = new LogSummaryItem(item);
				}
						
				sum.eatLogEvent(item);
				summaries.put(item.getUserName(), sum);
			}
		}

		return summaries.values();
	}

	public static void main(String[] args) throws Exception
	{
		ServletLogging s1 = new ServletLogging(2);
		
		
		
		class LoggingThread implements Runnable {

			private ServletLogging _sl;
			public void setLogging(ServletLogging sl) {
				_sl = sl;
			}

			public void run() {
				for(int i =0;i<20;i++)
				{
					_sl.addEvent("thissection", "mark.petrotta", this + ":test" + i);
					_sl.addEvent("thissection", "jen.petrotta", this + ":test" + i);
					try{Thread.sleep(1);} catch (Exception e) {e.printStackTrace();}
				}
			}
		}


		for (int icnt =0;icnt<100 ; icnt++)
		{
			LoggingThread a = new LoggingThread();
			a.setLogging(s1);
			a.run();
		}

	
		System.out.println("******************");
		
		Iterator i = s1.getSummary().iterator();
		while(i.hasNext()) {
			LogSummaryItem sum = (LogSummaryItem) i.next();

			System.out.println(sum);
		}
	
		
	}


}

