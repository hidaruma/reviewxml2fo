<?xml version="1.0" encoding="UTF-8"?>
<!--
+++
author = "hidaruma <hidaruma@outlook.jp>"
license = "Apache 2.0"
+++

# ReviewXML to XSL-FO with XSLT 3.0 package
-->
<xsl:package xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
             xmlns:fo="http://www.w3.org/1999/XSL/Format"
             
             xmlns:xs="http://www.w3.org/2001/XMLSchema"
             xmlns:fn="http://www.w3.org/2005/xpath-functions"
             
             xmlns:axf="http://www.antennahouse.com/names/XSL/Extensions"
             xmlns:re="urn:hidaruma:review2fo"
             package-version="0.0.1"
             name="urn:hidaruma:review2fo"
             
             exclude-result-prefixes="xs re fn"
             >

  <xsl:output method="xml" encoding="UTF-8"/>
  <xsl:mode name="re:re2fo" on-no-match="shallow-skip"/>
  
  <!--

## Global Params

-->
  <xsl:param name="prmPageSize" select="'A4 portrait'" static="true" as="xs:string"/>
  
  <!--
## Attribute-sets
-->
  <!--
### Page masters
-->
  <xsl:attribute-set name="re:attsPageSizeCommon">
    <xsl:attribute name="size" _select="{$prmSPageSize}"/>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="re:attsPageMarginCommon">
    <xsl:attribute name="margin-left" select="0pt"/>
    <xsl:attribute name="margin-right" select="0pt"/>
    <xsl:attribute name="margin-top" select="0pt" />
    <xsl:attribute name="margin-bottom" select="0pt"/>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="re:attsSimplePageMasterCommon" use-attribute-sets="re:attsPageSizeCommon re:attsPageMarginCommon"/>
  <xsl:attribute-set name="re:attsSimplePageMasterLeftCommon" use-attribute-sets="re:attsSimplePageMasterCommon">
    <xsl:attribute name="margin-left" _select="{$prmLeftPageMarginLeft}" />
    <xsl:attribute name="margin-left" _select="{$prmLeftPageMarginRight}" />
  </xsl:attribute-set>
  
  <xsl:template name="re:LayoutMasterSet">
    <fo:layout-master-set>
      <xsl:call-template name="re:PageMasters" />
      <xsl:call-template name="re:PageSequenceMasters" />
    </fo:layout-master-set>
  </xsl:template>
  
  <xsl:template name="re:Declarations">
    
  </xsl:template>
  
  <xsl:template name="xsl:initial-template">
  
    
    
  </xsl:template>
  
  <xsl:template match="/" mode="re:re2fo">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
</xsl:package>
