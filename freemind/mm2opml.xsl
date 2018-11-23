<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform' >
  <xsl:output media-type='text/xml' method="xml" indent="yes" />
  <xsl:template match='/'>
    <opml version='1.0'>
      <head>
        <title><xsl:value-of select='/descendant::node[position()=1]/@TEXT'/></title>
        <expansionState>/opml[1]/body[1]/outline[1]</expansionState>
        <vertScrollState>1</vertScrollState>
      </head>
      <xsl:apply-templates select='map' />
    </opml>
  </xsl:template>

  <xsl:template match='map' >
    <body>
      <xsl:apply-templates select='node' />
    </body>
  </xsl:template>

  <xsl:template match='node' >
    <xsl:choose>
      <xsl:when test='@LINK' >
        <outline>
          <xsl:attribute name='text' >
            <xsl:value-of select='@TEXT' />
          </xsl:attribute>
          <xsl:attribute name='type' >link</xsl:attribute>
          <xsl:apply-templates select='node' />
        </outline>
      </xsl:when>
      <xsl:otherwise>
        <outline>
          <xsl:attribute name='text' >
            <xsl:value-of select='@TEXT' />
          </xsl:attribute>
          <xsl:apply-templates select='node' />
        </outline>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
