<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <xsl:if test="*/*:title[normalize-space()!=''] or */*:filename[normalize-space()!='']">
            <xsl:apply-templates/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="*:topic">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="*:level">
        <xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy>
    </xsl:template>
    
    <xsl:template match="*:title">
        <xsl:copy>
            <xsl:text>${caret}</xsl:text>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="*:type">
        <xsl:copy><xsl:apply-templates select="node()|@*"/></xsl:copy>
    </xsl:template>
    <xsl:template match="*:filename">
        <xsl:copy/>
    </xsl:template>
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>