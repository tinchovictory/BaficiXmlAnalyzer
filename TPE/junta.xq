declare variable $fecha as xs:string external ;
declare variable $dates_in_file as xs:string ;
declare variable $format as xs:string ;

$dates_in_file = '2013-0[34]-(0[2-9]|1[2-9]|2[012])';
$format = '(\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01]))$';

{

if (matches($fecha, $dates_in_file))
then ($fecha)
else if (!matches($fecha, $format))
then ('La fecha ingresada no es valida. Formato valido: YYYY-MM-DD')
else (($fecha,'No se encontraron entradas con esa fecha.'))

}












/*
declare variable $year as xs:string ;
declare variable $month_and_day as xs:string ;
declare variable $month as xs:string ;
declare variable $day as xs:string ;

try {
	
	$year = substring-before($fecha,"-");
	$month_and_day = substring-after($fecha,"-");
	$month = substring-before($month_and_day,"-");
	$day = substring-after($month_and_day,"-");

	if (string(number($year)) = 'NaN') {
		// "WRONG"
	}

	if ( number($month) < 0 || number($month) > 12) {
		// "WRONG"
	}

	if ( number($day) < 0 || number($day) > 31) {
		// "WRONG"
	}

}
catch {
	// "WRONG"
}  

<peliculas>

	<pelicula fecha="" >

		<titulo>

		</titulo>

		<descripcion>

		</descripcion>

		<lugar>
			<nombre>

			</nombre>
			<direccion>

			</direccion>
			<sala>

			</sala>


		</lugar>

		<hora>

		</hora>

		<nacionalidad>

			<pais>

			</pais>

		</nacionalidad>


	</pelicula>


</peliculas>

*/