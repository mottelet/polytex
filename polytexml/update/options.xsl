<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<!-- Options processing -->

<xsl:template match="options">
	<cmd name="def"/>
	<cmd name="{@theme}Options">	
		<parm>
			<xsl:apply-templates/>
		</parm>
	</cmd>
</xsl:template>

<xsl:template match="poly">
	<cmd name="ifpolycopie"/>
	<xsl:apply-templates/>
	<cmd name="fi"/>
</xsl:template>


<xsl:template match="slides">
	<cmd name="iftransparent"/>
	<xsl:apply-templates/>
	<cmd name="fi"/>
</xsl:template>

<xsl:template match="screen">
	<cmd name="ifecran"/>
	<xsl:apply-templates/>
	<cmd name="fi"/>
</xsl:template>

<xsl:template match="paper">
	<cmd name="ifimpression"/>
	<xsl:apply-templates/>
	<cmd name="fi"/>
</xsl:template>

<xsl:template match="poly//font">
	<xsl:if test="@body">
		<cmd name="{@body}family"/>
	</xsl:if>
	<xsl:if test="@headers">
		<cmd name="{@headers}headers"/>
	</xsl:if>	
	<xsl:if test="@factor">
		<cmd name="def"/>
		<cmd name="polyfontfactor">
			<parm><xsl:value-of select="@factor"/></parm>
		</cmd>	
	</xsl:if>
</xsl:template>

<xsl:template match="slides//font">
	<xsl:if test="@body">
		<cmd name="{@body}family"/>
	</xsl:if>
	<xsl:if test="@headers">
		<cmd name="{@headers}family"/>
	</xsl:if>	
	<xsl:if test="@factor">
		<cmd name="def"/>
		<cmd name="slidesfontfactor">
			<parm><xsl:value-of select="@factor"/></parm>
		</cmd>	
	</xsl:if>
</xsl:template>

<xsl:template match="backgroundColor
|refBarColor
|grainBoxColor
 |textColor
|linkColor
|fileColor
|urlColor
|menuColor
|pageColor
|soundColor
|videoColor
|disabledLinkColor
">
	<cmd name="definecolor">
		<parm>
			<xsl:value-of select="name()"/>
		</parm>
		<parm><xsl:text>rgb</xsl:text></parm>
		<parm>
			<xsl:value-of select="@red"/>,<xsl:value-of select="@green"/>,<xsl:value-of select="@blue"/>
		</parm>
	</cmd>
</xsl:template>

<xsl:template match="navBarsColor">
	<cmd name="definecolor">
		<parm>bottomNavBarColor</parm>
		<parm><xsl:text>rgb</xsl:text></parm>
		<parm>
			<xsl:value-of select="@red"/>,<xsl:value-of select="@green"/>,<xsl:value-of select="@blue"/>
		</parm>
	</cmd>
	<cmd name="definecolor">
		<parm>globalNavBoxColor</parm>
		<parm><xsl:text>rgb</xsl:text></parm>
		<parm>
			<xsl:value-of select="@red"/>,<xsl:value-of select="@green"/>,<xsl:value-of select="@blue"/>
		</parm>
	</cmd>
	<cmd name="definecolor">
		<parm>topNavBarColor</parm>
		<parm><xsl:text>rgb</xsl:text></parm>
		<parm>
			<xsl:value-of select="@red"/>,<xsl:value-of select="@green"/>,<xsl:value-of select="@blue"/>
		</parm>
	</cmd>
</xsl:template>

<xsl:template match="backgroundImage">
	<cmd name="backgroundImage">
		<parm><xsl:value-of select="@file"/></parm>
	</cmd>
</xsl:template>

<xsl:template match="globalNavBox[@position='left']">
	<cmd name="globalNavBoxLeft"/>
</xsl:template>

<xsl:template match="pageBreaks">
	<xsl:if test="@grain='no'">
		<cmd name="newPageAfterGrainFalse"/>
	</xsl:if>
	<xsl:if test="@grain='yes'">
		<cmd name="newPageAfterGrainTrue"/>
	</xsl:if>
	<xsl:if test="@section='no'">
		<cmd name="newPageAfterSectionFalse"/>
	</xsl:if>
	<xsl:if test="@section='yes'">
		<cmd name="newPageAfterSectionTrue"/>
	</xsl:if>
</xsl:template>

<xsl:template match="numbering">
	<xsl:if test="@grain='yes'">
		<cmd name="grainsAreNumerotedTrue"/>
	</xsl:if>
	<xsl:if test="@grain='no'">
		<cmd name="grainsAreNumerotedFalse"/>
	</xsl:if>
</xsl:template>

<xsl:template match="cover">
	<xsl:if test="@titlepage='yes'">
		<cmd name="titlePageTrue"/>
	</xsl:if>
	<xsl:if test="@titlepage='no'">
		<cmd name="titlePageFalse"/>
	</xsl:if>
	<xsl:if test="@tableofcontents='yes'">
		<cmd name="tableOfContentsTrue"/>
	</xsl:if>
	<xsl:if test="@tableofcontents='no'">
		<cmd name="tableOfContentsFalse"/>
	</xsl:if>
</xsl:template>	


</xsl:stylesheet>


