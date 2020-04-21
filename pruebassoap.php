<?php
//conexión bd proyecto -- configurar los parametros a una bd accesible
$mysqli = mysqli_connect("localhost", "root", "", "prueba");


try{
	//conexión al WS con EndPoint
	$soap = new SoapClient('http://test.analitica.com.co/AZDigital_Pruebas/WebServices/ServiciosAZDigital.wsdl',array('location'=>'http://test.analitica.com.co/AZDigital_Pruebas/WebServices/SOAP/index.php','trace'=>true));
	//prepara la estructura de parametros
	$array=['Condiciones'=>['Condicion'=>['Tipo'=>'FechaInicial','Expresion'=>'2020-02-01 00:00:00',]]];
	//ejecuta la funcion BuscarArchivos
	$array_respuesta = $soap->BuscarArchivo($array);

	//$soap->__getLastResponse()
	//no logré obtener el xml devuelto por el soap de una manera limpia, decidí crear el xml
	//usando DOMDoument a partir del array devuelto

	$xmlDom = new DOMDocument();
	$xmlDom->formatOutput = true;
	$xmlDom->appendChild($xmlDom->createElement('archivos'));
	$xmlRoot = $xmlDom->documentElement;

	//recorremos el array que devolvio el WS en su funcion BuscarArchivo
	foreach ($array_respuesta->Archivo as $value) {
		$xmlRowElementNode = $xmlDom->createElement('archivo');

	          $xmlRowElement = $xmlDom->createElement('id');
	          $xmlText = $xmlDom->createTextNode($value->Id);
	          $xmlRowElement->appendChild($xmlText);	
	          $xmlRowElementNode->appendChild($xmlRowElement);		

	          $xmlRowElement = $xmlDom->createElement('nombre');
	          $xmlText = $xmlDom->createTextNode($value->Nombre);
	          $xmlRowElement->appendChild($xmlText);
	          $xmlRowElementNode->appendChild($xmlRowElement);

			  //extraemos la extension del nombre del archivo
			  $var_ext = substr($value->Nombre,strpos ($value->Nombre,'.')+1);

				//variable para guardar el tipo de archivo: se inicializa con 6 que en la tabla es 
				//un tipo de archivo no identificado
				$id_ext=6;
				//buscamos el tipo de archivo segun su extension
				$result = mysqli_query($mysqli,'select id_extension from tipoarchivo where extension = "' . $var_ext . '";');
				
				if ($result->num_rows !== 0){
					//si lo encuentra reemplaza el codigo
					$ressql = $result->fetch_array();
					$id_ext = $ressql['id_extension'];
				}			  

	          $xmlRowElement = $xmlDom->createElement('extension');
	          $xmlText = $xmlDom->createTextNode($var_ext);
	          $xmlRowElement->appendChild($xmlText);	
	          $xmlRowElementNode->appendChild($xmlRowElement);		
     
	          $xmlRowElement = $xmlDom->createElement('id_extension');
	          $xmlText = $xmlDom->createTextNode($id_ext);
	          $xmlRowElement->appendChild($xmlText);	
	          $xmlRowElementNode->appendChild($xmlRowElement);	

     	$xmlRoot->appendChild($xmlRowElementNode);
	  }

	
	$xmlDom->saveXML();



//Cargamos la plantilla xsl para transformar en sentencias sql 
   $xslDoc = new DOMDocument();
   $xslDoc->load("plantilla.xsl");

//se reemplaza segun la plantilla
   $proc = new XSLTProcessor();
   $proc->importStylesheet($xslDoc);
//guardamos las consultas creadas a partir de la plantilla
   $sql = $proc->transformToXML($xmlDom);

//comenzamos con la insercion a la base de datos
   //primero elimino los registros de la tabla para evitar insertar la misma informacion
   //cada vez que se ejecuta la pagina
    mysqli_query($mysqli,'delete from archivos');

   //insertamos en la base de datos

	foreach (explode(";",$sql) as $sentence) {
		mysqli_query($mysqli,$sentence);
	}

//OK terminado
	echo 'Proceso Terminado -  se consultó el WS BuscaArchivo, se llenó la tabla y ahora puede generar el informe';
	echo "<br><br>";

} catch(Exception $exc){

	echo htmlspecialchars(print_r($exc, true));
	echo "<br><br>";
	echo 'Proceso Terminado con error';
	
	
}
//cerramos la conexion
mysqli_close($mysqli);

//Luego creamos un boton para enviar al primer informe
?>
<html>
<head>
		
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no"/>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
	<title>SOAP Archivos</title>

</head>
<body>
	<button type="button" class="btn btn-primary" onclick="location='pruebainforme1.php'">Informe 1</button>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>


