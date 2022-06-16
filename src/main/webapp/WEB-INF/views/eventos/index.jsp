<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eventos</title>
</head>
<body>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<div>
		<h1>Gestão de Eventos</h1>
		
		<ul>
			<li><a href=<c:url value="/eventos/listar" />>Lista de Eventos</a> </li>
			<li><a href=<c:url value="/eventos/incluir" />>Cadastro de Eventos</a> </li>
		</ul>
	</div>
</body>
</html>