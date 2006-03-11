<%@ page import="org.alt60m.servlet.*, java.util.*" %>

<% String pageTitle="Bookmark Confirmed"; %>
<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>
<P ALIGN="CENTER"><%= font %>
This page has been bookmarked!
<P ALIGN="CENTER"><%= font %>
Click <A HREF="<%= request.getParameter("value") %>">here</A> to return.
<P ALIGN="CENTER">
A link directly to this spot will now appear on your Campus Staff Site Homepage.
<%@ include file="/infobase/ibfooter.jspf" %>
</html>