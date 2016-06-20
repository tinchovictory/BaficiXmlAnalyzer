 java net.sf.saxon.Query junta.xq fecha=$1 > datos_json.xml
 java net.sf.saxon.Transform -s:datos_json.xml -xsl:toJson.xslt -o:peliculas.json
