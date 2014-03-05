<?xml version="1.0" encoding="UTF-8"?>

<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:variable name="smvTypes" as="xs:string*">
    <xsl:sequence
	select="('multivector', 'multivector3, 'vector', 'vector3,
		 'bivector', 'bivector3, 'rotor', 'rotor3')"/>
  </xsl:variable>

  <xsl:for-each select="1 to 8">
    <function name="Mike's" arg1="{subsequence($smvTypes, ., 1)}"/>
  </xsl:for-each>


  <!-- Define arg replacement functions -->
  <xsl:template name="arg1_multivector" match="function[@arg1='anysmv']/@arg1">
    <xsl:attribute name="arg1">multivector</xsl:attribute>
  </xsl:template>
  <xsl:template name="arg2_multivector3" match="function[@arg2='anysmv']/@arg2">
    <xsl:attribute name="arg2">multivector3</xsl:attribute>
  </xsl:template>

  <xsl:template name="arg1_vector" match="function[@arg1='anysmv']/@arg1">
    <xsl:attribute name="arg1">vector</xsl:attribute>
  </xsl:template>
  <xsl:template name="arg2_vector3" match="function[@arg2='anysmv']/@arg2">
    <xsl:attribute name="arg2">vector3</xsl:attribute>
  </xsl:template>

  <xsl:template name="arg1_bivector" match="function[@arg1='anysmv']/@arg1">
    <xsl:attribute name="arg1">bivector</xsl:attribute>
  </xsl:template>
  <xsl:template name="arg2_bivector3" match="function[@arg2='anysmv']/@arg2">
    <xsl:attribute name="arg2">bivector3</xsl:attribute>
  </xsl:template>

  <xsl:template name="arg1_rotor" match="function[@arg1='anysmv']/@arg1">
    <xsl:attribute name="arg1">rotor</xsl:attribute>
  </xsl:template>
  <xsl:template name="arg2_rotor3" match="function[@arg2='anysmv']/@arg2">
    <xsl:attribute name="arg2">rotor3</xsl:attribute>
  </xsl:template>



  <xsl:template match="function[@arg1='anysmv']">
    <!-- Do something! -->
  </xsl:template>

  <xsl:template match="function[@arg2='anysmv']">
    <!-- Do something! -->
  </xsl:template>

  <xsl:template match="function[@arg1='anysmv' and @arg2='anysmv']">
    <!-- Do something! -->
  </xsl:template>


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
