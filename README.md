# pruebasoap
Se consulta a un WS por medio de SOAP.

En primer lugar se debe crear la base de datos prueba en MySQL el archivo con el script es prueba.sql.

El script inicial es 'pruebassoap.php', al cargar se conecta por medio de SOAP al WS dado, ejecuta la función y lleva los resultados a la base de datos usando la plantilla xls. Luego muestra un botón para ir ver el primer informe.

El primer informe (pruebainforme1.php) muestra la consulta de los datos en una tabla bootstrap responsive usando también una plantilla xls, muestra también un botón para ir al segundo informe.

El segundo informe (pruebainforme2.php) muestra la consulta de los datos solicitados con group by en una tabla bootstrap responsive usando también una plantilla xls.

Las plantillas xsl son los archivos plantilla.xsl, plantillainfo1.xsl y plantillainfo2.xsl que están en este proyecto.

La documentación está dada en los comentarios de los scripts.



