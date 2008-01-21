package org.alt60m.servlet;

import java.util.*;
import javax.servlet.http.*;

public class MiniResults extends ActionResults{


	public MiniResults() 
	{
		this("");
	}
	public MiniResults(String action) 
	{
		_values = new Hashtable();
		_objects = new Hashtable();
		_collections = new Hashtable();
		_maps = new Hashtable();
		
		_action = action;
	}

}

