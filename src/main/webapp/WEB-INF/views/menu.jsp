<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menu</title>
</head>
<body>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<div>
		<h1>Menu de Op��es</h1>
		<ul>
			<li><a href=<c:url value="/eventos/inicio" />>Gest�o de Eventos</a></li>
			<li><a href=<c:url value="/viacep" />>Buscar Endere�o</a></li>
		</ul>
	</div>
	
</body>
</html>