<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:param name="owner" select="'Alex Ospina'"/>
 <xsl:output method="html" encoding="utf8" indent="no"/>
 <xsl:template match="/">
 	<html>
 		<head>
 			<meta charset="utf-8"/>
 			<meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no"/>
 			
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
 			<title>Archivos</title>

 		</head>
 		<body>
 			<h1>Informe 1</h1>
 			<h2>Cruce de dos tablas relacionadas - aplica plantilla xsl - Tabla responsive bootsrap</h2>
 			<button type="button" class="btn btn-primary" onclick="location='pruebainforme2.php'">Click para Informe 2</button>
 			<br/><br/>
 			<table class="table table-responsive table-bordered table-striped">
 			<thead>
			  <tr align="center">
			  <th>ID Archivo</th>
			  <th>Nombre Archivo</th>
			  <th>Extension</th>
			  <th>Tipo Archivo</th>
			  </tr>
			</thead>
			<tbody>
			 <xsl:for-each order-by="+ id_archivo" select="archivos/archivo">
			  <tr>
			  <td><xsl:value-of select="id_archivo"/></td>
			  <td><xsl:value-of select="nombre"/></td>
			  <td><xsl:value-of select="extension"/></td>
			  <td><xsl:value-of select="tipoarchivo"/></td>
			  </tr>
			 </xsl:for-each>
			</tbody>
			</table>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 		</body>
 	</html>	 
 </xsl:template>
</xsl:stylesheet>