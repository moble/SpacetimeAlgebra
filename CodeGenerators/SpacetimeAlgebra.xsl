<?xml version="1.0" encoding="UTF-8"?>

<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:variable name="smvTypes"
		select="'mv', 'mv3', 'vector',
			'vector3', 'bivector', 'bivector3',
			'pseudovector', 'spinor', 'spinor3'"/>
  <xsl:variable name="smv4Types"
		select="'mv', 'vector', 'bivector', 'pseudovector', 'spinor'"/>
  <xsl:variable name="ssmvTypes"
		select="'mv', 'spinor3', 'spinor'"/>

  <xsl:template match="function[@arg1='anyssmv']">
    <xsl:variable name="functionElement" select="."/>
    <xsl:for-each select="1 to count($ssmvTypes)">
      <function>
	<xsl:copy-of select="$functionElement/@*"/> <!-- Copy all attributes -->
	<xsl:attribute name="arg1">
	  <xsl:value-of select="subsequence($ssmvTypes, ., 1)"/>
	</xsl:attribute>
      </function>
      <xsl:if test=". &lt; count($ssmvTypes)">
        <xsl:text>&#10;  </xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="function[@arg1='anysmv4']">
    <xsl:variable name="functionElement" select="."/>
    <xsl:for-each select="1 to count($smv4Types)">
      <function>
	<xsl:copy-of select="$functionElement/@*"/> <!-- Copy all attributes -->
	<xsl:attribute name="arg1">
	  <xsl:value-of select="subsequence($smv4Types, ., 1)"/>
	</xsl:attribute>
      </function>
      <xsl:if test=". &lt; count($smv4Types)">
        <xsl:text>&#10;  </xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="function[@arg1='anysmv']" priority="2">
    <xsl:variable name="functionElement" select="."/>
    <xsl:for-each select="1 to count($smvTypes)">
      <function>
	<xsl:copy-of select="$functionElement/@*"/> <!-- Copy all attributes -->
	<xsl:attribute name="arg1">
	  <xsl:value-of select="subsequence($smvTypes, ., 1)"/>
	</xsl:attribute>
	<xsl:if test="$functionElement[@arg2='anysmv']">
	  <xsl:attribute name="arg2">
	    <xsl:value-of select="subsequence($smvTypes, ., 1)"/>
	  </xsl:attribute>
	</xsl:if>
      </function>
      <xsl:if test=". &lt; count($smvTypes)">
        <xsl:text>&#10;  </xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="function[@arg2='anysmv']" priority="1">
    <xsl:variable name="functionElement" select="."/>
    <xsl:for-each select="1 to count($smvTypes)">
      <function>
	<xsl:copy-of select="$functionElement/@*"/> <!-- Copy all attributes -->
	<xsl:attribute name="arg2">
	  <xsl:value-of select="subsequence($smvTypes, ., 1)"/>
	</xsl:attribute>
      </function>
      <xsl:if test=". &lt; count($smvTypes)">
        <xsl:text>&#10;  </xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <!-- <xsl:template match="function[@arg1='anysmv' and @arg2='anysmv']" priority="2"> -->
  <!--   <xsl:variable name="functionElement" select="."/> -->
  <!--   <xsl:for-each select="1 to count($smvTypes)"> -->
  <!--     <xsl:variable name="i" select="."/> -->
  <!--     <xsl:for-each select="1 to count($smvTypes)"> -->
  <!-- 	<xsl:variable name="j" select="."/> -->
  <!-- 	<xsl:if test="($i=1 and $j=1) or ($i!=1 and $j!=1)"> -->
  <!-- 	  <function> -->
  <!-- 	    <xsl:copy-of select="$functionElement/@*"/> <\!-\- Copy all attributes -\-> -->
  <!-- 	    <xsl:attribute name="arg1"> -->
  <!-- 	      <xsl:value-of select="subsequence($smvTypes, $i, 1)"/> -->
  <!-- 	    </xsl:attribute> -->
  <!-- 	    <xsl:attribute name="arg2"> -->
  <!-- 	      <xsl:value-of select="subsequence($smvTypes, $j, 1)"/> -->
  <!-- 	    </xsl:attribute> -->
  <!-- 	    <xsl:if test="$i!=$j"> -->
  <!-- 	      <xsl:attribute name="returnType">mv</xsl:attribute> -->
  <!-- 	    </xsl:if> -->
  <!-- 	  </function> -->
  <!-- 	  <xsl:if test="$i &lt; count($smvTypes) or $j &lt; count($smvTypes)"> -->
  <!--           <xsl:text>&#10;  </xsl:text> -->
  <!-- 	  </xsl:if> -->
  <!-- 	</xsl:if> -->
  <!--     </xsl:for-each> -->
  <!--   </xsl:for-each> -->
  <!-- </xsl:template> -->

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
