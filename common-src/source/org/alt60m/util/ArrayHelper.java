package org.alt60m.util;

public class ArrayHelper
{
	static public int indexOf(Object o, Object[] a){
		for(int i = 0; i < a.length; i++)
			if(a[i].equals(o))
				return i;
		return -1;
	}

	public static void main(String[] args) 
	{
		String[] names = {"df","d  ","bob", "fred"};
		String bob = "bob";
		System.out.println(indexOf(bob, names));
	}

}
