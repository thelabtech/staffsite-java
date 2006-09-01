package org.alt60m.ministry.model;

import java.util.*;


public class ActivityComparator implements Comparator
{

	public int compare(Object a1, Object a2) throws ClassCastException {

		org.alt60m.ministry.model.Activity act1 = (org.alt60m.ministry.model.Activity)a1;
		org.alt60m.ministry.model.TargetArea ta1 = (org.alt60m.ministry.model.TargetArea)act1.getTargetArea();
		if (ta1 == null) { 
			return 1;
		}

		org.alt60m.ministry.model.Activity act2 = (org.alt60m.ministry.model.Activity)a2;
		org.alt60m.ministry.model.TargetArea ta2 = (org.alt60m.ministry.model.TargetArea)act2.getTargetArea();
		if (ta2 == null) { 
			return -1;
		}

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

		return (ta1.getName().compareToIgnoreCase(ta2.getName()));
	
	}

}