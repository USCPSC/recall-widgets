<!-- getRSS.xsl: retrieve RSS feed(s) and convert to HTML. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:dc="http://purl.org/dc/elements/1.1/" version="1.0">

  <xsl:output method="html"/>

  <xsl:template match="RSSChannels">
    <html><head><title>Recent Recalls</title></head>
    <style><xsl:comment>

p         { font-size: 8pt;
            font-family: arial,helvetica; }

h3        { font-size: 12pt;
            font-family: arial,helvetica; 
            font-weight: bold; }

a:link    { color:blue;
            font-weight: bold;
            text-decoration: none; }

a:visited { font-weight: bold;
            color: darkblue;
            text-decoration: none; }

   </xsl:comment></style> 
   <body>
     <xsl:apply-templates/>
   </body></html>
  </xsl:template>

  <xsl:template match="RSSChannel">
    <xsl:apply-templates select="document(@src)"/>
  </xsl:template>

  <!-- Named template outputs HTML a element with href link-->
  <xsl:template name="a-element">
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl:apply-templates select="*[local-name()='link']"/>
      </xsl:attribute>
      <xsl:attribute name="target">_blank</xsl:attribute>
      <xsl:value-of select="*[local-name()='title']"/>
    </xsl:element>
  </xsl:template>

  <!-- Output Title as HTML a link inside of h3 element. -->
  <xsl:template match="*[local-name()='channel']">
    <!-- Following line for RSS .091 -->
    <xsl:apply-templates select="*[local-name()='item']"/>
  </xsl:template>

  <!-- Output RSS item as HTML a link inside of p element. -->
  <xsl:template match="*[local-name()='item']"> 
    <xsl:element name="p">
      <xsl:call-template name="a-element"/>
      <xsl:text> </xsl:text>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="pubDate"/>
        <xsl:text>) </xsl:text>
        <xsl:value-of select="description"/>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
