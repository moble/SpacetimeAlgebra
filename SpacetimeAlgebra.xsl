<?xml version="1.0" encoding="UTF-8"?>

<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:variable name="smvTypes"
		select="'multivector', 'multivector3', 'vector', 'vector3', 'bivector', 'bivector3', 'rotor', 'rotor3'"/>

  <xsl:template match="function[@arg1='anysmv']" priority="1">
    <xsl:variable name="functionElement" select="."/>
    <xsl:for-each select="1 to count($smvTypes)">
      <function>
	<xsl:copy-of select="$functionElement/@*"/> <!-- Copy all attributes -->
	<xsl:attribute name="arg1">
	  <xsl:value-of select="subsequence($smvTypes, ., 1)"/>
	</xsl:attribute>
      </function>
      <xsl:if test=". &lt; count($smvTypes)">
        <xsl:text>&#10;  </xsl:text>
      </xsl:if>
    </xsl:for-each>

    <!-- <xsl:for-each select="1 to 8"> -->
      <!-- <xsl:copy> -->
      <!-- 	<xsl:apply-templates select="@* | node()" /> -->
      <!-- 	<xsl:attribute name="arg1">vector</xsl:attribute> -->
      <!-- </xsl:copy> -->
    <!-- </xsl:for-each> -->

    <!-- <xsl:variable name="function" select="."/> -->
    <!-- <xsl:for-each select="$smvTypes"> -->
      <!-- <xsl:copy select="$function"> -->
      <!--   <xsl:attribute name="width">100</xsl:attribute> -->
      <!--   <xsl:apply-templates select="@*|node()" /> -->
      <!-- </xsl:copy> -->
      <!-- <xsl:copy-of select="$function"/> -->
      <!-- <xsl:copy-of select=".."/> -->
      <!-- <xsl:text>&#10;</xsl:text> -->
    <!-- </xsl:for-each> -->
    <!-- Do something! -->
  </xsl:template>

  <xsl:template match="function[@arg2='anysmv']" priority="1">Nuthin' I says!</xsl:template>

  <xsl:template match="function[@arg1='anysmv' and @arg2='anysmv']" priority="3">You ain't gettin' nothin'</xsl:template>


  <!-- This is an identity template - it copies everything
       that doesn't match another template.  Note that this is
       generic, so it has low priority; more-specific matches get
       higher priority, and thus get used instead of this.  Note that
       the order of templates is irrelevant; this could have been the
       first element in the transform. -->
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:transform>
