package org.alt60m.ministry.model.dbio;

import java.util.*;

/*
 * Started to Refactor this for the ministry_activity changes on 6/15/07 but I really don't think
 * anything even calls this any more.  If this gets used again eventually then this code may need
 * more work.  As far as I can tell only LocalLevel.java calls this and that code has now
 * commented out. It may not be worth the time to refactor this.  -MarkDavis
 *
 */
 
public class ActivityComparator implements Comparator
{

	public int compare(Object a1, Object a2) throws ClassCastException {

		org.alt60m.ministry.model.dbio.Activity act1 = (org.alt60m.ministry.model.dbio.Activity)a1;
		org.alt60m.ministry.model.dbio.TargetArea ta1 = (org.alt60m.ministry.model.dbio.TargetArea)act1.getTargetArea();
		if (ta1 == null) { 
			return 1;
		}

		org.alt60m.ministry.model.dbio.Activity act2 = (org.alt60m.ministry.model.dbio.Activity)a2;
		org.alt60m.ministry.model.dbio.TargetArea ta2 = (org.alt60m.ministry.model.dbio.TargetArea)act2.getTargetArea();
		if (ta2 == null) { 
			return -1;
		}
/*  The ActivityComparator  object is no longer being used.  If there is a need for this
 *  code again refactored to use AcivityHistory DBIO object instead of the Activity DBIO 
 *  object because that is where the PeriodEnd and PeriodBegin fields have been moved to.
 *   

		if(ta1.getName().compareToIgnoreCase(ta2.getName()) == 0)
			if(act1.getPeriodEnd() == null)
				if(act2.getPeriodEnd() == null)
					if(act1.getPeriodBegin().compareTo(act2.getPeriodBegin()) < 0)
						return 1;
					else if(act1.getPeriodBegin().compareTo(act2.getPeriodBegin()) > 0)
						return -1;
					else
						return 0;
				else return -1;
			else if(act2.getPeriodEnd() == null)
				if(act1.getPeriodBegin().compareTo(act2.getPeriodBegin()) < 0)
					return 1;
				else if(act1.getPeriodBegin().compareTo(act2.getPeriodBegin()) > 0)
					return -1;
				else return 0;
			else if(act1.getPeriodEnd().compareTo(act2.getPeriodEnd()) < 0)
				return 1;
			else if(act1.getPeriodEnd().compareTo(act2.getPeriodEnd()) > 0)
				return -1;
			else
				return 0;
 */
		return (ta1.getName().compareToIgnoreCase(ta2.getName()));
	
	}

}