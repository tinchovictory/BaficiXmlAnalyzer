declare variable $fecha as xs:string := '2013-04-11';
declare variable $dates_in_file as xs:string := '2013-04-(1[0-9]|2[01])';
declare variable $date_format as xs:string := '^(\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01]))$';


<peliculas fecha ="{
if (matches($fecha, $dates_in_file))
then ($fecha)
else if (matches($fecha, $date_format))
then (($fecha,'No se encontraron entradas con esa fecha.'))
else ('La fecha ingresada no es valida. Formato valido: YYYY-MM-DD')
}">

{
	for $evento in doc('/Users/JuanmaAlonso/tpXml/TPE/bafici13-programacion.xml')//ROWSET/ROW
  	let $film:= doc('/Users/JuanmaAlonso/tpXml/TPE/bafici13-films.xml')//ROWSET/ROW[id_film=$evento/id_film]
  	let $sedes:= doc('/Users/JuanmaAlonso/tpXml/TPE/bafici13-sedes.xml')//ROWSET/ROW[id_place=$evento/id_place]
  	where $evento[id_film!=0]
  	return
	( <pelicula>
		<titulo> { $film/title/text() } </titulo>

		<descripcion> { $film/synopsis_es/text() } </descripcion>

		<lugar>
			<nombre> { $sedes/title/text() } </nombre>
			<direccion> { $sedes/address/text() } </direccion>
			<sala> { $evento/rooms/text() } </sala>
		</lugar>

		<hora> { $evento/time_/text() } </hora>

		<nacionalidad>
		{
		let $id_country := 'id_country'
		for $seq in (1 to 4)
		let $id_country := concat('id_country',$seq)
		return (
					let $pais := $film/*[name()=$id_country]

					return if (($pais != 0 ) and ($pais != 'NULL'))
					then <pais>
						{doc('/Users/JuanmaAlonso/tpXml/TPE/bafici13-paises.xml')//ROW[./id_country/text() eq $pais]/name_es/text()}
						</pais>
					else ()
				)
		}
		</nacionalidad>

	</pelicula>
	) 
} 
</peliculas>





