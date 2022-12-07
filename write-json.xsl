<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="text" indent="yes" />
  <xsl:strip-space elements="*" />

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>

  <xsl:template name="write.object">
    {
      <xsl:apply-templates />
    }
  </xsl:template>

  <xsl:template name="write.value">
    <xsl:param name="value.name" />
    <xsl:param name="value.data" />
    <xsl:param name="is.first.value" select="0" />
    <xsl:if test="$is.first.value = 0"><xsl:text>,</xsl:text></xsl:if>
    "<xsl:value-of select="$value.name" />" : "<xsl:value-of select="replace($value.data, '&#xA;', '\\n')" />"
  </xsl:template>
  
</xsl:stylesheet>
