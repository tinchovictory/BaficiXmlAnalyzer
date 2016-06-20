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
for $evento in doc('bafici13-programacion.xml')/ROWSET/ROW[./date_ eq $fecha]
where $evento[./id_film != 0]
return 
	( <pelicula>
		<titulo>{
		doc('bafici13-films.xml')//ROW[./id_film/text() eq $evento/id_film/text()]/title/text()
		}
		</titulo>

		<descripcion>
		{
		doc('bafici13-films.xml')//ROW[./id_film/text() eq $evento/id_film/text()]/synopsis_es/text()
		}
		</descripcion>

		<lugar>
			<nombre>
			{
			doc('bafici13-sedes.xml')//ROW[./id_place/text() eq $evento/id_place/text()]/title/text()
			}
			</nombre>
			<direccion>
			{
			doc('bafici13-sedes.xml')//ROW[./id_film/text() eq $evento/id_place/text()]/address/text()
			}
			</direccion>
			<sala>
			{
			$evento/rooms/text()
			}
			</sala>
		</lugar>

		<hora>
			{
			$evento/time_/text()
			}
		</hora>

		<nacionalidad>
		{
		for $seq in (1 to 8)
		let $id_country := concat('id_country',$seq)
		return (
					let $pais := doc('bafici13-films.xml')//ROW[./id_film/text() eq $evento/id_film/text()]/*[name()=$id_country]

					return if (($pais != 0 ) and ($pais != 'NULL'))
					then <pais>
						{doc('bafici13-paises.xml')//ROW[./id_country/text() eq $pais]/name_es/text()}
						</pais>
					else ()
				)
		}
		</nacionalidad>

	</pelicula>
	) 
} 
</peliculas>





