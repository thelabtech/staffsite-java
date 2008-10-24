<html>
<%@ page import="java.util.*" %>

<body>

<form method="post" action="<%=response.encodeURL("/Review360/servlet/Review360Controller?action=listStaff&lastAction=listStaff")%>">
<input type="submit" value="Save">
<input type="text" name="Review360ListStaff" size="20">

</form>
<% 
    Hashtable hash = new Hashtable();
    Vector vector = new Vector();
    
	//Object tub = session.getAttribute("tub");
	//out.println(tub.toString());

	Object tub = session.getValue("tub");
	if (tub != null) {
		Vector v = (Vector) tub;
		Iterator i = v.iterator();
		out.println("<select size=\"1\" name=\"D1\">");
  
		while(i.hasNext()) {
			out.println("<option>" + i.next() + "</option>");
		}
		out.println("</select>");
	}

	session.putValue("LastAction", "listStaff");

	/*
	vector.addElement("Value 1");
    hash.put("key 1", vector.elementAt(0));
    out.println("Hashtable get(\"key 1\") : " + (String)hash.get("key 1"));

    if (session.isNew()) {
		out.println("New session!");
		response.sendRedirect("login.jsp?Origin="+request.getRequestURI());
    } else {
		out.println("Getting new server!");
		Server server = new secant.extreme.Server();

	}*/
	

%>
<%@ include file="/headers/google_analytics.jspf"%>
  </body>
</html>

