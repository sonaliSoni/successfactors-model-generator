<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:json="http://json.org/">
<xsl:template match="/">
    <xsl:for-each select=".//Property[not(@Type = preceding::Property/@Type)]"><xsl:value-of select="@Type" />, </xsl:for-each>
{<xsl:for-each select="catalog/d/EntityType[@Name = 'JobApplication']">

"Get<xsl:value-of select="./@Name"/>sList": {
    "id": "Get<xsl:value-of select="./@Name"/>sList",
    "x-vendor-objectname": "<xsl:value-of select="./@Name"/>",
    "x-primary-key" : [<xsl:for-each select="./Key/PropertyRef">"<xsl:value-of select="./@Name" />"<xsl:choose> <xsl:when test="position() != last()">,</xsl:when> <xsl:otherwise>]</xsl:otherwise></xsl:choose></xsl:for-each>,
    "properties": {
    <xsl:for-each select="./Property">
    <xsl:variable name="dataType"><xsl:value-of select="./@Type"/></xsl:variable>
    <xsl:variable name="displayName"><xsl:value-of select="./@label"/></xsl:variable>
    <xsl:variable name="nullable"><xsl:value-of select="./@Nullable"/></xsl:variable>

     "<xsl:value-of select="./@Name" />" : {
        "x-displayName": "<xsl:value-of select="./@label"/>",
        "x-nullable": <xsl:value-of select="$nullable"/>,<xsl:choose><xsl:when test=" $dataType = 'Edm.Double'">
        "format": "double",
        "type": "number"</xsl:when><xsl:when test=" $dataType = 'Edm.DateTime' or  $dataType = 'Edm.DateTimeOffset' or $dataType = 'Edm.Single' ">
        "format": "date-time",
        "type": "string",
        "mask": "milliseconds"</xsl:when><xsl:when test="$dataType = 'Edm.DateTimeOffset'">
            "format": "date-time",
            "type": "string",
            "mask": "milliseconds+offset"</xsl:when><xsl:when test=" $dataType = 'Edm.String' or $dataType = 'Edm.Time' or $dataType = 'Edm.Byte'or $dataType = 'Edm.Binary'">
        "type": "string"</xsl:when><xsl:when test=" $dataType = 'Edm.Boolean'">
        "type": "boolean"</xsl:when><xsl:when test=" $dataType = 'Edm.Int32'">
        "format": "int32",
        "type": "integer"</xsl:when><xsl:when test=" $dataType = 'Edm.Int64'">
        "format": "int64",
        "type": "integer"</xsl:when><xsl:when test=" $dataType = 'Edm.Decimal'">
        "format": "double",
        "type": "number"</xsl:when>
    <xsl:otherwise>"type": "Other"</xsl:otherwise></xsl:choose>
        <xsl:choose> <xsl:when test="(count(following-sibling::*) &gt; 0)">
            },</xsl:when> <xsl:otherwise>
         }
            </xsl:otherwise>
        </xsl:choose>
    </xsl:for-each>
    <xsl:for-each select="./NavigationProperty">

    <xsl:variable name="navDataType"><xsl:value-of select="./@ToRole"/></xsl:variable>
    "<xsl:value-of select="./@Name" />" : {
    "type" : "<xsl:value-of select="$navDataType"/>"<xsl:choose> <xsl:when test="position() != last()">
        },</xsl:when> <xsl:otherwise>
        }
    </xsl:otherwise>
    </xsl:choose>
</xsl:for-each>
    }
    <xsl:choose> <xsl:when test="(count(./NavigationProperty)  &gt; 0)">
     },</xsl:when> <xsl:otherwise>
 }
    </xsl:otherwise>
    </xsl:choose>
</xsl:for-each>

    <xsl:for-each select="catalog/d/EntityType[@Name = 'JobApplication']/NavigationProperty">
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

    <xsl:for-each select="catalog/d/EntityType[@Name = 'JobApplication']/NavigationProperty">
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
 }
</xsl:template>
</xsl:stylesheet>