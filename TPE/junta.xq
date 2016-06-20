declare variable $fecha as xs:string := '2013-04-11';
declare variable $dates_in_file as xs:string := '2013-04-(1[0-9]|2[01])';
declare variable $date_format as xs:string := '^(\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01]))$';


<peliculas fecha ="{
if (matches($fecha, $dates_in_file))
then ($fecha)
else if (matches($fecha, $date_format))
then (($fecha,'No se encontraron entradas con esa fecha.'))
else ('La fecha ingresada no es valida. Formato valido: YYYY-MM-DD')
}">{
	for $event in doc('bafici13-programacion.xml')//ROWSET/ROW[date_=$fecha]
	let $film:= doc('bafici13-films.xml')//ROWSET/ROW[id_film=$event/id_film]
	let $sedes:= doc('bafici13-sedes.xml')//ROWSET/ROW[id_place=$event/id_place]
	let $pais:= doc('bafici13-paises.xml')//ROWSET/ROW
	where $event[id_film!=0]
	return
	<pelicula>
		<titulo>{data($film/title)}</titulo>
		<descripcion>{data($film/synopsis_es)}</descripcion>
		<lugar>
			<nombre>{data($sedes/title)}</nombre>
			<direccion>{data($sedes/address)}</direccion>
			<sala>{data($event/rooms)}</sala>
		</lugar>
		<hora>{data($event/time_)}</hora>
		<nacionalidad>{
			for $seq in (1 to 4)
		let $id_country := concat('id_country',$seq)
		return (
					let $pais := doc('bafici13-films.xml')//ROWSET/ROW[id_film=$event/id_film]/*[name()=$id_country]
					return if (($pais != 0 ) and ($pais != 'NULL'))
					then <pais>
						{data(doc('bafici13-paises.xml')//ROW[id_country=$pais]/name_es)}
						</pais>
					else ()
				)
		}</nacionalidad>
		
		
	</pelicula>
}
	 
</peliculas>