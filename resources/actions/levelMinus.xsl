<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="*:level">
        <xsl:copy>
            <xsl:value-of select="max((number(.)-1, 1))"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="*:title">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
            <xsl:text>${caret}</xsl:text>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>