<?xml version="1.0"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="staffList"> 
    <table border="1" width="500" align="center">
      <tr bgcolor="#999999">
        <th>Name</th>
        <th>City, State</th>
      </tr>
      <xsl:for-each select="staff">
			<xsl:sort select="lastName" data-type="text" order = "ascending"/> 
			<tr>
			  <td align='center'>
				<xsl:text disable-output-escaping="yes">&lt;a href="javascript:updateReference('</xsl:text>
				<xsl:value-of select="@reftype"/>
				<xsl:text disable-output-escaping="yes">','</xsl:text>
				<xsl:value-of select="@account"/>
				<xsl:text disable-output-escaping="yes">')</xsl:text>
				<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
				<xsl:value-of select="@first"/>
				<xsl:text disable-output-escaping="yes"> (</xsl:text>
				<xsl:value-of select="@pref"/>
				<xsl:text disable-output-escaping="yes">) </xsl:text>
				<xsl:value-of select="@last"/>
				<xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text>
			  </td>
			  <td align='center'>
				<xsl:value-of select="@city"/>
				<xsl:text disable-output-escaping="yes">, </xsl:text>
				<xsl:value-of select="@state"/>
			  </td>
			</tr>
      </xsl:for-each>
    </table>
  </xsl:template>

</xsl:stylesheet>

