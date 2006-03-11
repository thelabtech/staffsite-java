<?xml version="1.0"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="schedule">
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
	<xsl:element name="form">
		<xsl:attribute name="action">
			<xsl:text>/servlet/DiscipleshipController</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="method">
			<xsl:text>POST</xsl:text>
		</xsl:attribute>
		<xsl:element name="input">
			<xsl:attribute name="type">
				<xsl:text>hidden</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:text>action</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:text>saveSchedule</xsl:text>
			</xsl:attribute>
		</xsl:element>		
		<xsl:element name="input">
			<xsl:attribute name="type">
				<xsl:text>hidden</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:text>url</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:text>/discipleship/index.jsp</xsl:text>
			</xsl:attribute>
		</xsl:element>
		<xsl:element name="input">
			<xsl:attribute name="type">
				<xsl:text>hidden</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:text>view</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:text>viewContactDetail</xsl:text>
			</xsl:attribute>
		</xsl:element>
		<xsl:element name="input">
			<xsl:attribute name="type">
				<xsl:text>hidden</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:text>viewaction</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:text>editContact</xsl:text>
			</xsl:attribute>
		</xsl:element>
		<xsl:element name="input">
			<xsl:attribute name="type">
				<xsl:text>hidden</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:text>ScheduleId</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:value-of select="id"/>
			</xsl:attribute>
		</xsl:element>		
		<xsl:element name="input">
			<xsl:attribute name="type">
				<xsl:text>hidden</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:text>ContactId</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:value-of select="contactid"/>
			</xsl:attribute>
		</xsl:element>		
			<table>
				<tr>
					<td>
						<xsl:text>Day Of Week</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>DayOfWeek</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="dayofweek"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Hours Available</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>HoursAvailableString</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="hoursavailable"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Note</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>Note</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="note"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>submit</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>Save Schedule</xsl:text>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
			</table>
	</xsl:element>
  </xsl:template>

</xsl:stylesheet>
