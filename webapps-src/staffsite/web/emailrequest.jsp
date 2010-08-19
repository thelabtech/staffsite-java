<jsp:useBean id="email" class="org.alt60m.util.SendMessage" />
<jsp:useBean id="box" class="org.alt60m.html.Box" />
<%@ include file="/style.jspf" %>
<%
  boolean ok  = true;
  String  msg = new String();
  if (request.getParameter("firstName") == null) {
	    ok = false;
	    msg = "You need to give us your first name so we know what to name your accounts.";
	  }
  if (request.getParameter("firstName") == null) {
    ok = false;
    msg = "You need to give us your first name so we know what to name your accounts.";
  }

  if (request.getParameter("lastName") == null) {
    ok = false;
    msg = "You need to give us your last name so we know what to name your accounts.";
  }
  if (request.getParameter("middleInitial") == null) {
	    ok = false;
	    msg = "You need to give us your middle initial so we know what to name your accounts.";
	  }
  
  if (request.getParameter("accountNo") == null) {
    ok = false;
    msg = "You need to give us your staff account number so we can verify your staff status.";
  }

  
   if (request.getParameter("region").equals(" ")) {
   ok = false;
   msg = "You need to specify your region so we can forward your information to the correct regional tech representative to set your accounts up.";
   }
  
  if ((request.getParameter("email") == null) & (request.getParameter("phone") == null)) {
    ok = false;
    msg = 
            "You need to give us either your phone number or an e-mail address so we can contact you when we have your accounts set up."
            ;
  }

  if (request.getParameter("password") == null || request.getParameter("passwordConf") == null) {
    ok = false;
    msg = "You need to enter a password to keep unauthorized people from accessing your accounts.";
  } else{

   
    // check to see if verified correctly
    if (!request.getParameter("password").equals(request.getParameter("passwordConf"))) {
      ok = false;
      msg = 
              "The passwords you typed in do not match. They need to be the same to verify that you have typed in what you think you typed in."
              ;
    }
  }

  if (!ok) {
    box.setTitle("Oops");
    box.setWidth("600");
    box.setColor(colorL);
    box.setBodyColor(colorL);
%>
    <br>
    <br>
    <center><%= box.printTop() %><center><%= font3 %>
    <p>
      <br>
      <%= msg %>
      <BR>
      <br>
      Please
      <a href="javascript:history.go(-1)">go back</a>
      and fill in the info.
    </font>
  </p>
  <br></center>
  <%= box.printBottom() %></center>
  <p>
<%
  } else {
    email.setTo("help@campuscrusadeforchrist.com");
    email.setFrom(request.getParameter("email"));
    email.setSubject("E-mail and Website Account Request: " + request.getParameter("firstName")+" "+request.getParameter("middleInitial")+" "+request.getParameter("lastName"));

    StringBuffer s = new StringBuffer();

    
    s.append("Name: " + request.getParameter("firstName")+" "+request.getParameter("middleInitial")+" "+request.getParameter("lastName")+ "\n");
    
    s.append("staff account#: " + request.getParameter("accountNo") + "\n");
    s.append("email: " + request.getParameter("email") + "\n");
    s.append("phone: " + request.getParameter("phone") + "\n");
    s.append("region: " + request.getParameter("region") + "\n");
    email.setBody(s.toString());
    email.send();
    
    s = new StringBuffer();
    
    s.append("Name: " + request.getParameter("firstName")+" "+request.getParameter("middleInitial")+" "+request.getParameter("lastName")+ "\n");
    s.append("####: " + request.getParameter("password") + "\n");
    
    email.setBody(s.toString());
    email.send();
    
    
    box.setTitle("That's all!");
    box.setWidth("400");
    box.setColor(colorL);
    box.setBodyColor(colorL);
%>
    <center><br>
    <br>
    <%= box.printTop() %><%= font3 %><center><br>
    <%= font3 %>Your request was sent successfully and will be considered promptly.
    Click
    <A HREF="JavaScript:window.close()">here</A>
    to close this window and continue.
    <p>
      <br>
    </font></center>
    <%= box.printBottom() %></center>
    <p>
<%
    }
%>
