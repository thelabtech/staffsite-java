package org.alt60m.ministry.model;

import java.util.*;


public class TargetAreaComparator implements Comparator
{

	public int compare(Object t1, Object t2) throws ClassCastException {

		
		return ((org.alt60m.ministry.model.TargetArea)t1).getName().compareToIgnoreCase(((org.alt60m.ministry.model.TargetArea)t2).getName());
	
	}

}
