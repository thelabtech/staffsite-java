<?xml version="1.0"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="campusList">
  
    <table border="1" width="100%">
      <tr bgcolor="#999999">
        <th>Name</th>
        <th>City</th>
      </tr>
      <xsl:for-each select="campus">
	  <xsl:sort select="name" data-type="text" order = "ascending"/> 
        <tr>
          <td>
			<xsl:text disable-output-escaping="yes">&lt;a href="javascript:updateParent2('</xsl:text>
			<xsl:value-of select="@name"/>
			<xsl:text disable-output-escaping="yes">')</xsl:text>
			<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
			<xsl:value-of select="@name"/>
			<xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text>
          </td>
          <td>
		<xsl:value-of select="@city"/>
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

</xsl:stylesheet>
