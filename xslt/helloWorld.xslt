<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output
        method="xml"
        version="1.0"
        encoding="UTF-8"
        indent="yes"
    />

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="data-set">
        <output>
            <xsl:value-of select="concat('Hello, ', input/text())"/>
        </output>
    </xsl:template>

</xsl:stylesheet>
