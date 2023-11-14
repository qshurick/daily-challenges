<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output
        method="xml"
        version="1.0"
        encoding="UTF-8"
        indent="yes"
    />

    <xsl:template match="/">
        <result>
            <xsl:apply-templates/>
        </result>
    </xsl:template>

    <xsl:template match="data-set">
        <xsl:variable name="placeholder" select="'##PLACEHOLDER##'"/>
        <xsl:variable name="character1" select="swap/character[1]/text()"/>
        <xsl:variable name="character2" select="swap/character[2]/text()"/>
        <output>
            <xsl:value-of select="replace(replace(replace(input/text(), $character1, $placeholder), $character2, $character1), $placeholder, $character2)"/>
        </output>
    </xsl:template>

</xsl:stylesheet>
