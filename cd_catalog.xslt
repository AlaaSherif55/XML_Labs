<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">

    <html>
      <head>
        <title>CD Catalog</title>
        <style>
          .high-price { color: red; }
          .medium-price { color: blue; }
          .low-price { color: green; }
        </style>
      </head>
      <body>
        <h1>CD Catalog</h1>

        <xsl:apply-templates select="catalog/cd[country and year > 1990]">
          <xsl:sort select="country" />
        </xsl:apply-templates>

      </body>
    </html>
  </xsl:template>

  <xsl:template match="cd">
    <xsl:variable name="price" select="number(price)" />

    <div>
      <h2>Title: <xsl:value-of select="title"/></h2>
      <p>Artist: <xsl:value-of select="artist"/></p>
      <p>Price: 
        <xsl:choose>
          <xsl:when test="$price &gt;= 10">
            <span class="high-price"><xsl:value-of select="price"/></span>
          </xsl:when>
          <xsl:when test="$price &gt;= 8">
            <span class="medium-price"><xsl:value-of select="price"/></span>
          </xsl:when>
          <xsl:otherwise>
            <span class="low-price"><xsl:value-of select="price"/></span>
          </xsl:otherwise>
        </xsl:choose>
      </p>
    </div>
  </xsl:template>

</xsl:stylesheet>
