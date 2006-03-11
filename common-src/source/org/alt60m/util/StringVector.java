package org.alt60m.util;

import java.util.*;

public class StringVector extends Vector
{

	
	public String[] toStringArray() {
		String[] strArr = new String[this.size()];
		
		for(int cnt=0;cnt<size();cnt++) {
			strArr[cnt] = (String) get(cnt);
		}
		return strArr;
	}


	public static void main(String[] args) 
	{
		System.out.println("Hello World!");
	}
}
