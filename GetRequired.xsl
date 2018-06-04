<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:json="http://json.org/">
    <xsl:template match="/">

    <!--    <xsl:for-each select=".//Property[not(@Type = preceding::Property/@Type)]"><xsl:value-of select="@Type" />, </xsl:for-each> -->
        <xsl:for-each select=".//Property[not(@Type = preceding::Property/@Type)]"><xsl:value-of select="@Type" />, </xsl:for-each> -->

        "required" : ["

        <xsl:for-each select="catalog/d/EntityType[@Name = 'EmpJob']/Property[@required='true']">
            <xsl:value-of select="./@Name"/>", </xsl:for-each>
        <!--    <xsl:for-each select="catalog/d/EntityType[@Name = 'EmpJob']/NavigationProperty[@required='true']">
              <xsl:value-of select="./@Name"/>", </xsl:for-each> -->

          ]

      </xsl:template>
  </xsl:stylesheet>