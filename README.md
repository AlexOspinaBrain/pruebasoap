# pruebasoap
Consulta WS por medio de SOAP

En primer lugar se debe crear la base de datos prueba en MySQL -- Archivo - prueba.sql

El script inicial es pruebassoap.php, este archivo al cargar se conecta por medio de SOAP al WS dado, ejecuta la función, lleva los resultados a la base de datos usando la plantilla xls.  Luego muestra un boton para ver el primer informe.

El primer informe (pruebainforme1.php) muestra la consulta de los datos en una tabla bootstrap responsive usando tambien una plantilla xls, muestra tambien un boton para ir al segundo informe.

El segundo informe (pruebainforme2.php) muestra la consulta de los datos solicitados con group by  en una tabla bootstrap responsive usando tambien una plantilla xls.

Las plantillas xsl son los archivos plantilla.xsl, plantillainfo1.xsl y plantillainfo2.xsl que estan en este proyecto.
