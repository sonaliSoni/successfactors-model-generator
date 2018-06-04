<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:json="http://json.org/">
    <xsl:template match="/">
        <xsl:if test="catalog/d/EntityType[@Name = 'JobApplication']/NavigationProperty/@creatable = 'true'">
        <xsl:for-each select="catalog/d/EntityType[@Name = 'JobApplication']/NavigationProperty[@creatable = 'true']">
            <xsl:if test="not(@ToRole = preceding::NavigationProperty/@ToRole)">
                "<xsl:value-of select="./@ToRole"/>": {
                "id": "<xsl:value-of select="./@ToRole"/>",
                "properties": {
                "__deferred": {
                "type": "<xsl:value-of select="./@ToRole"/>_deferred"
                }
                }
                <xsl:choose> <xsl:when test="position() != last()">
                    },</xsl:when> <xsl:otherwise>
                    }
                </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:for-each>
        </xsl:if>

        <xsl:if test="catalog/d/EntityType[@Name = 'JobApplication']/NavigationProperty/@creatable = 'true'">
        <xsl:for-each select="catalog/d/EntityType[@Name = 'JobApplication']/NavigationProperty[@creatable = 'true']">
            <xsl:if test="not(@ToRole = preceding::NavigationProperty/@ToRole)">
                ,"<xsl:value-of select="./@ToRole"/>_deferred": {
                "id": "<xsl:value-of select="./@ToRole"/>_deferred",
                "properties": {
                "uri": {
                "type": "string"
                }
                }
                }

            </xsl:if>
        </xsl:for-each>
        </xsl:if>
        }
    </xsl:template>
</xsl:stylesheet>