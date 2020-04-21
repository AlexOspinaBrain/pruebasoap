<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:param name="owner" select="'Alex Ospina'"/>
 <xsl:output method="html" encoding="utf8" indent="no"/>

 <xsl:template match="/">
	 <xsl:for-each select="archivos/archivo">
		insert into archivos (id_archivo,nombre,extension,id_extension) values (<xsl:value-of select="id"/>,'<xsl:value-of select="nombre"/>','<xsl:value-of select="extension"/>',<xsl:value-of select="id_extension"/>);
	 </xsl:for-each>
 </xsl:template>
</xsl:stylesheet>