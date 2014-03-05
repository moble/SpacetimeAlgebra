<?xml version="1.0" encoding="UTF-8"?>

<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:param name="multivectorName" select="'multivector'"/>
  <xsl:param name="multivector3Name" select="'multivector3'"/>
  <xsl:param name="vectorName" select="'vector'"/>
  <xsl:param name="vector3Name" select="'vector3'"/>
  <xsl:param name="bivectorName" select="'bivector'"/>
  <xsl:param name="bivector3Name" select="'bivector3'"/>
  <xsl:param name="rotorName" select="'rotor'"/>
  <xsl:param name="rotor3Name" select="'rotor3'"/>

  <xsl:template match="function[@arg2='anysmv']/@arg2">
    <xsl:attribute name="arg2">
      <xsl:value-of select="$vectorName"/>
    </xsl:attribute>
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
