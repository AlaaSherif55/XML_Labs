<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">

    <html>
      <head>
        <title>CD Catalog</title>
        <style>
          /* Updated styles */
          .high-price { color: #ff0000; } 
          .medium-price { color: #0000ff; }
          .low-price { color: #008000; } 
          h2 { margin-bottom: 5px; }
          p { margin: 0; }
          .cd-info { border: 1px solid #ccc; padding: 10px; margin-bottom: 10px; }
        </style>
      </head>
      <body>
        <h1>CD Catalog</h1>

        <xsl:apply-templates select="catalog/cd[price &gt;= 10]">
          <xsl:sort select="country" />
        </xsl:apply-templates>

      </body>
    </html>
  </xsl:template>

  <xsl:template match="cd">
    <xsl:variable name="price" select="number(price)" />

    <div class="cd-info">
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
      <p>Description: <xsl:value-of select="description"/></p> 
    </div>
  </xsl:template>

</xsl:stylesheet>
