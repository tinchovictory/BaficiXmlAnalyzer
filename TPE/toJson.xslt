 <xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/peliculas">
		<xsl:text>&#xa;</xsl:text>
		<xsl:text>{"fecha": "</xsl:text>
		<xsl:value-of select="./@fecha" />
		<xsl:text>",</xsl:text>
		<xsl:text>&#xa;</xsl:text>
		<xsl:text>"peliculas": [ </xsl:text>
			<xsl:for-each select="./pelicula">
				<xsl:text>&#9;&#9;{ "pelicula": {</xsl:text>
					<xsl:text>&#xa;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;</xsl:text>
					<xsl:text>"titulo": "</xsl:text>
					<xsl:value-of select="./titulo" />
					<xsl:text>",&#xa;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;</xsl:text>
					<xsl:text>"descripcion": "</xsl:text>
					<xsl:value-of select="./descripcion" />
					<xsl:text>",&#xa;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;</xsl:text>
					<xsl:text>"lugar": {</xsl:text>
						<xsl:text>&#xa;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;</xsl:text>
						<xsl:text>"nombre": "</xsl:text>
						<xsl:value-of select="./lugar/nombre" />
						<xsl:text>",&#xa;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;</xsl:text>
						<xsl:text>"direccion": "</xsl:text>
						<xsl:value-of select="./lugar/direccion" />
						<xsl:text>",&#xa;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;</xsl:text>
						<xsl:text>"sala": "</xsl:text>
						<xsl:value-of select="./lugar/sala" />
					<xsl:text>"},&#xa;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;</xsl:text>
					<xsl:text>"hora": "</xsl:text>
					<xsl:value-of select="./hora" />
					<xsl:text>",&#xa;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;</xsl:text>
					<xsl:text>"nacionalidad": [</xsl:text>
					<xsl:text>&#xa;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;</xsl:text>
						<xsl:for-each select="./nacionalidad/pais">
							<xsl:text>&#9;&#9;&#9;&#9;</xsl:text>
							<xsl:text>{ "pais": "</xsl:text>
							<xsl:value-of select="." />
							<xsl:text>"}&#9;&#9;&#9;&#9;&#xa;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;</xsl:text>
						</xsl:for-each>
					<xsl:text>]</xsl:text>
				<xsl:text>&#xa;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;}</xsl:text>
				<xsl:text>&#xa;&#9;&#9;&#9;&#9;&#9;&#9;&#9;},</xsl:text>
			</xsl:for-each>
		<xsl:text>&#xa;&#xa;]</xsl:text>
		<xsl:text>&#xa;}</xsl:text>
	</xsl:template>
</xsl:stylesheet>
