 <xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/peliculas">
		<xsl:text>{ "fecha": "</xsl:text>
		<xsl:value-of select="./@fecha" />	
		<xsl:text>", "peliculas": [ </xsl:text>
			<xsl:for-each select="./pelicula">
				<xsl:text>{ "pelicula": {</xsl:text>
					<xsl:text> "titulo": "</xsl:text>
					<xsl:value-of select="./titulo" />
					<xsl:text>", "descripcion": "</xsl:text>
					<xsl:value-of select="./descripcion" />
					<xsl:text>", "lugar": {</xsl:text>
						<xsl:text> "nombre": "</xsl:text>
						<xsl:value-of select="./lugar/nombre" />
						<xsl:text>", "direccion": "</xsl:text>
						<xsl:value-of select="./lugar/direccion" />
						<xsl:text>", "sala": "</xsl:text>
						<xsl:value-of select="./lugar/sala" />
					<xsl:text> "}</xsl:text>
					<xsl:text>, "hora": "</xsl:text>
					<xsl:value-of select="./hora" />
					<xsl:text>", "nacionalidad": [</xsl:text>
						<xsl:for-each select="./nacionalidad">
							<xsl:text>{ "pais": "</xsl:text>
							<xsl:value-of select="./pais" />
							<xsl:text>"}</xsl:text>
						</xsl:for-each>
					<xsl:text> ]</xsl:text>
				<xsl:text> }},</xsl:text>
			</xsl:for-each>
		<xsl:text> {}] }</xsl:text>
	</xsl:template>
</xsl:stylesheet>