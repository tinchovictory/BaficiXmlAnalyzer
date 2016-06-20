


<peliculas>{
	for $event in doc('bafici13-programacion.xml')//ROWSET/ROW
	let $film:= doc('bafici13-films.xml')//ROWSET/ROW[id_film=$event/id_film]
	let $sedes:= doc('bafici13-sedes.xml')//ROWSET/ROW[id_place=$event/id_place]
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
			for $i in (1 to 8)
			let $pais:= doc('bafici13-paises.xml')//ROWSET/ROW[id_country=$film/id_country{$i}]
			return
			<pais>{data($pais/name_es)}</pais>
		}</nacionalidad>
		
		
	</pelicula>
}
	 
</peliculas>