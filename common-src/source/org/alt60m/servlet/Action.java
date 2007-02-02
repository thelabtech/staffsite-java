//Action.java
// created:         11/18/02 - kb
// last updated:    12/6/02 - RDH

package org.alt60m.servlet;

import java.util.*;

/** simple action wrapper. */

public class Action
{
    private Hashtable<String, String> _values = null;
    private String _name = null;
		private String _server_name = null;

    /** sets values (overwrites existing) */
    public void setValues(Hashtable<String, String> values) { _values = values; }

    /** gets values */
    public Hashtable<String, String> getValues() { return _values; }

    /** sets the action name */
    public void setName(String name) {_name = name; }

    /** gets the action name */
    public String getName() { return _name; }

    /** puts an individual value in the values hash */
    public void putValue(String name, String val)
    {
        if (_values == null) {
        	_values = new Hashtable<String, String>();
        }
        _values.put(name, val);
    }

    /** gets an individual value in the values hash. will return null if not found.  */
    public String getValue(String name)
    {
        return _values.get(name);
    }

    // added 6 December 2002 by RDH. Helps in building absolute URLs, e.g. for links in emails.
		public void setServerName(String serverName) { _server_name = serverName; }
		public String getServerName() { return _server_name; }

}