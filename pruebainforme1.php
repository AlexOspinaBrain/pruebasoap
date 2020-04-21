<?php

//conexión bd proyecto -- configurar los parametros a una bd accesible
$mysqli = mysqli_connect("localhost", "root", "", "prueba");



//creamos el informe
	//realizamos la consulta
$result = mysqli_query($mysqli,'select id_archivo,nombre,archivos.extension,tipoarchivo from archivos, tipoarchivo where archivos.id_extension = tipoarchivo.id_extension');

//creamos el xml a partir del resultado del query usando la clase DOMDocument
$xmlDom = new DOMDocument();
$xmlDom->formatOutput = true;
$xmlDom->appendChild($xmlDom->createElement('archivos'));
$xmlRoot = $xmlDom->documentElement;

while ( $row = mysqli_fetch_row($result) ) 
    {
      $xmlRowElementNode = $xmlDom->createElement('archivo');

      $i=0;
      for($i=0;$i<mysqli_field_count($mysqli);$i++)
      {
      	  $fieldinffo = mysqli_fetch_field_direct($result,$i);


          $xmlRowElement = $xmlDom->createElement($fieldinffo->name);
          $xmlText = $xmlDom->createTextNode($row[$i]);
            $xmlRowElement->appendChild($xmlText);

            $xmlRowElementNode->appendChild($xmlRowElement);
      }

      $xmlRoot->appendChild($xmlRowElementNode);
   }


$xmlDom->saveXML();

//Cargamos la plantilla xsl
   $xslDoc = new DOMDocument();
   $xslDoc->load("plantillainfo1.xsl");

//se reemplaza segun la plantilla
   $proc = new XSLTProcessor();
   $proc->importStylesheet($xslDoc);
//mostramos luego de realizar los cambios
   echo $proc->transformToXML($xmlDom);

mysqli_close($mysqli);

?>