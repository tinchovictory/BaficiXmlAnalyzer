declare variable $fecha as xs:string external ;

declare variable $format as xs:string ;

$format = '^(\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01]))$';

if (matches($fecha ,$format))
then('FECHA INVALIDA (YYYY-MM-DD)')















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