<?xml version="1.0"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="rolodexList">
  
  <style>
  TD {
	font-size: 10;
	padding: 2px;
  }
  TH {
	font-size: 10;
	padding: 2px;
  }
  </style>
    <table border="1" width="100%">
      <tr>
        <th>First Name</th>
        <th>Last Name</th>
	<th>Address</th>
	<th>Address (cont)</th>
	<th>City</th>
	<th>State</th>
	<th>Zip</th>
        <th>Phone Number</th>
        <th>Email Address</th>
	<th>Campus</th>
	<th>Table</th>
	<th>Note</th>
	<th></th>
      </tr>
      <xsl:for-each select="rolodex">
	  <xsl:sort select="lastname" data-type="text" order = "ascending"/> 
		<tr>
		  <td><xsl:value-of select="firstname"/></td>
		  <td><xsl:value-of select="lastname"/></td>
		  <td>
			<xsl:value-of select="address"/>
		  </td>
		  <td>
			<xsl:value-of select="address2"/>
		  </td>
		  <td>
			<xsl:value-of select="city"/>
		  </td>
		  <td>
			<xsl:value-of select="state"/>
		  </td>
		  <td>
			<xsl:value-of select="zip"/>
		  </td>
		  <td>
			<xsl:value-of select="phone"/>
		  </td>
		  <td>
			<xsl:value-of select="email"/>
		  </td>
		  <td>
			<xsl:value-of select="campus"/>
		  </td>
		  <td>
			<xsl:value-of select="sourcetable"/>
		  </td>
		  <td>
			<xsl:value-of select="note"/>
		  </td>
		  <td>
			<form action="/servlet/DiscipleshipController" method="POST">
		  	<xsl:element name="INPUT">
		  		<xsl:attribute name="TYPE">
			 		 <xsl:text>hidden</xsl:text>
				</xsl:attribute>
		 		<xsl:attribute name="NAME">
					 <xsl:text>action</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="VALUE">
					 <xsl:text>saveContact</xsl:text>
				</xsl:attribute>
			</xsl:element>
		  	<xsl:element name="INPUT">
		  		<xsl:attribute name="TYPE">
			 		 <xsl:text>submit</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="VALUE">
					 <xsl:text>Add to My Contacts</xsl:text>
				</xsl:attribute>
			</xsl:element>
		  	<xsl:element name="INPUT">
		  		<xsl:attribute name="TYPE">
			 		 <xsl:text>hidden</xsl:text>
				</xsl:attribute>
		 		<xsl:attribute name="NAME">
					 <xsl:text>url</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="VALUE">
					 <xsl:text>/discipleship/index.jsp</xsl:text>
				</xsl:attribute>
			</xsl:element>
		  	<xsl:element name="INPUT">
		  		<xsl:attribute name="TYPE">
			 		 <xsl:text>hidden</xsl:text>
				</xsl:attribute>
		 		<xsl:attribute name="NAME">
					 <xsl:text>FirstName</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="VALUE"><xsl:value-of select="firstname"/></xsl:attribute>
			</xsl:element>
		  	<xsl:element name="INPUT">
		  		<xsl:attribute name="TYPE">
			 		 <xsl:text>hidden</xsl:text>
				</xsl:attribute>
		 		<xsl:attribute name="NAME">
					 <xsl:text>LastName</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="VALUE">
					<xsl:value-of select="lastname"/>
				</xsl:attribute>
			</xsl:element>
		  	<xsl:element name="INPUT">
		  		<xsl:attribute name="TYPE">
			 		 <xsl:text>hidden</xsl:text>
				</xsl:attribute>
		 		<xsl:attribute name="NAME">
					 <xsl:text>Address1</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="VALUE">
					<xsl:value-of select="address"/>
				</xsl:attribute>
			</xsl:element>
		  	<xsl:element name="INPUT">
		  		<xsl:attribute name="TYPE">
			 		 <xsl:text>hidden</xsl:text>
				</xsl:attribute>
		 		<xsl:attribute name="NAME">
					 <xsl:text>Address2</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="VALUE">
					<xsl:value-of select="address2"/>
				</xsl:attribute>
			</xsl:element>
		  	<xsl:element name="INPUT">
		  		<xsl:attribute name="TYPE">
			 		 <xsl:text>hidden</xsl:text>
				</xsl:attribute>
		 		<xsl:attribute name="NAME">
					 <xsl:text>City</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="VALUE">
					<xsl:value-of select="city"/>
				</xsl:attribute>
			</xsl:element>
		  	<xsl:element name="INPUT">
		  		<xsl:attribute name="TYPE">
			 		 <xsl:text>hidden</xsl:text>
				</xsl:attribute>
		 		<xsl:attribute name="NAME">
					 <xsl:text>State</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="VALUE">
					<xsl:value-of select="state"/>
				</xsl:attribute>
			</xsl:element>
		  	<xsl:element name="INPUT">
		  		<xsl:attribute name="TYPE">
			 		 <xsl:text>hidden</xsl:text>
				</xsl:attribute>
		 		<xsl:attribute name="NAME">
					 <xsl:text>Zip</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="VALUE">
					<xsl:value-of select="zip"/>
				</xsl:attribute>
			</xsl:element>
		  	<xsl:element name="INPUT">
		  		<xsl:attribute name="TYPE">
			 		 <xsl:text>hidden</xsl:text>
				</xsl:attribute>
		 		<xsl:attribute name="NAME">
					 <xsl:text>Gender</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="VALUE">
					<xsl:value-of select="gender"/>
				</xsl:attribute>
			</xsl:element>
		  	<xsl:element name="INPUT">
		  		<xsl:attribute name="TYPE">
			 		 <xsl:text>hidden</xsl:text>
				</xsl:attribute>
		 		<xsl:attribute name="NAME">
					 <xsl:text>PhoneNumber</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="VALUE">
					<xsl:value-of select="phone"/>
				</xsl:attribute>
			</xsl:element>
		  	<xsl:element name="INPUT">
		  		<xsl:attribute name="TYPE">
			 		 <xsl:text>hidden</xsl:text>
				</xsl:attribute>
		 		<xsl:attribute name="NAME">
					 <xsl:text>EmailAddress</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="VALUE">
					<xsl:value-of select="email"/>
				</xsl:attribute>
			</xsl:element>
		  	<xsl:element name="INPUT">
		  		<xsl:attribute name="TYPE">
			 		 <xsl:text>hidden</xsl:text>
				</xsl:attribute>
		 		<xsl:attribute name="NAME">
					 <xsl:text>MaritalStatus</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="VALUE">
					<xsl:value-of select="maritalstatus"/>
				</xsl:attribute>
			</xsl:element>
		  	<xsl:element name="INPUT">
		  		<xsl:attribute name="TYPE">
			 		 <xsl:text>hidden</xsl:text>
				</xsl:attribute>
		 		<xsl:attribute name="NAME">
					 <xsl:text>BirthDate</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="VALUE">
					<xsl:value-of select="birthdate"/>
				</xsl:attribute>
			</xsl:element>
		  	<xsl:element name="INPUT">
		  		<xsl:attribute name="TYPE">
			 		 <xsl:text>hidden</xsl:text>
				</xsl:attribute>
		 		<xsl:attribute name="NAME">
					 <xsl:text>Campus</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="VALUE">
					<xsl:value-of select="campus"/>
				</xsl:attribute>
			</xsl:element>
		  	<xsl:element name="INPUT">
		  		<xsl:attribute name="TYPE">
			 		 <xsl:text>hidden</xsl:text>
				</xsl:attribute>
		 		<xsl:attribute name="NAME">
					 <xsl:text>DiscipledById</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="VALUE">
					<xsl:value-of select="surferaccountno"/>
				</xsl:attribute>
			</xsl:element>
			</form>
		  </td>
	        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

</xsl:stylesheet>
