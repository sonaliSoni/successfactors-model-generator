<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="d">{
         <xsl:for-each select="EntityType"> <xsl:if test="./Property/@creatable = 'true'">
              "Create<xsl:value-of select="./@Name"/>": {
             "id": "Create<xsl:value-of select="./@Name"/>",

             "properties" : {
             <xsl:if test="./Property/@creatable = 'true'">
            <xsl:apply-templates select="./Property"/></xsl:if>
             <xsl:if test="./NavigationProperty/@creatable = 'true'">
            <xsl:apply-templates select="./NavigationProperty"/> </xsl:if>
                     }

             <xsl:choose> <xsl:when test="position() != last()">
                 },</xsl:when> <xsl:otherwise>
                 }
             </xsl:otherwise>
             </xsl:choose>

         </xsl:if>
        </xsl:for-each>
        <xsl:choose> <xsl:when test="position() != last()">
            },</xsl:when> <xsl:otherwise>
            }
        </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="EntityType/Property">
        <xsl:if test="./@creatable = 'true'">
        <xsl:variable name="dataType"><xsl:value-of select="./@Type"/></xsl:variable>
        <xsl:variable name="displayName"><xsl:value-of select="./@label"/></xsl:variable>
        <xsl:variable name="nullable"><xsl:value-of select="./@Nullable"/></xsl:variable>
        <xsl:choose> <xsl:when test="count(preceding-sibling::*[@creatable= 'true'])&gt; 0">,
            </xsl:when> <xsl:otherwise>
                  </xsl:otherwise>
        </xsl:choose>
         "<xsl:value-of select="./@Name" />" : {
        "x-displayName": "<xsl:value-of select="./@label"/>",
        "x-nullable": <xsl:value-of select="$nullable" />,<xsl:choose><xsl:when test="$dataType = 'Edm.Double'">
        "format": "double",
        "type": "number"</xsl:when><xsl:when test=" $dataType = 'Edm.DateTime' or  $dataType = 'Edm.DateTimeOffset' or $dataType = 'Edm.Single' ">
        "format": "date-time",
        "type": "string",
        "mask": "yyyy-MM-ddTHH:mm:ss"</xsl:when><xsl:when test="$dataType = 'Edm.DateTimeOffset'">
        "format": "date-time",
        "type": "string",
        "mask": "yyyy-MM-ddTHH:mm:ss+offset"</xsl:when><xsl:when test=" $dataType = 'Edm.String' or $dataType = 'Edm.Time' or $dataType = 'Edm.Byte'or $dataType = 'Edm.Binary'">
        "type": "string"</xsl:when><xsl:when test=" $dataType = 'Edm.Boolean'">
        "type": "boolean"</xsl:when><xsl:when test=" $dataType = 'Edm.Int32'">
        "type": "string"</xsl:when><xsl:when test=" $dataType = 'Edm.Int64'">
        "type": "string"</xsl:when><xsl:when test=" $dataType = 'Edm.Decimal'">
        "type": "string"</xsl:when>
        <xsl:otherwise>"type": "Other"</xsl:otherwise></xsl:choose>
        }
        </xsl:if>
    </xsl:template>

    <xsl:template match="EntityType/NavigationProperty">
        <xsl:if test="./@creatable = 'true'">
        <xsl:variable name="navDataType"><xsl:value-of select="./@Relationship"/></xsl:variable>
        <xsl:variable name="fieldName"><xsl:value-of select="./@Name"/></xsl:variable>
        <xsl:variable name="entityName"><xsl:value-of select="../@Name"/></xsl:variable>
        ,"<xsl:value-of select="./@Name" />" : {


                <xsl:variable name="AssociationRole"><xsl:value-of select="./@Name"/></xsl:variable>
                <xsl:variable name="Association"><xsl:value-of select="../../AssociationSet/@Association"/></xsl:variable>
                <xsl:variable name="AssociationType"><xsl:value-of select="../../AssociationSet[@Association =$navDataType]/End/@Role"/></xsl:variable>
                <xsl:variable name="NavEntitySet"><xsl:value-of select="./@EntitySet"/></xsl:variable>
                <xsl:variable name="NWavEntitySet"><xsl:value-of select="./@EntitySet"/></xsl:variable>
                <xsl:for-each select="../../AssociationSet[@Association =$navDataType]/End">
                      <xsl:if test="./@Role = $AssociationRole">
                "type" :
                          "<xsl:value-of select="../../AssociationSet[@Association =$navDataType]/End[@Role= $AssociationRole]/@EntitySet"/>"
                      </xsl:if>

                </xsl:for-each>

       }
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>

