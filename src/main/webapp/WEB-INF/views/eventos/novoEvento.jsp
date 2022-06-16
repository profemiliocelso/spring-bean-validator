<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Eventos</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	.borda {
		max-width: 400px;
		margin: auto;
	}
</style>
</head>
<body>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<div class="container">
		<div class="borda">
			<h1 class="text-primary">Cadastro de Eventos</h1>
			<form:form action="/Projeto01_Eventos_SpringMVC/cadevento" 
					modelAttribute="evento" method="post">
			
				<div class="md-3">
					<form:label path="descricao" cssClass="form-label">Descrição:</form:label>
					<form:input path="descricao" cssClass="form-control"  />
					<form:errors path="descricao" cssClass="text-danger" />
				</div>
				
				<div class="md-3">
					<form:label path="data" cssClass="form-label">Data:</form:label>
					<form:input path="data" cssClass="form-control" type="date" />
					<form:errors path="data" cssClass="text-danger" />
				</div>
				
				<div class="md-3">
					<form:label path="responsavel" cssClass="form-label">Responsável:</form:label>
					<form:input path="responsavel" cssClass="form-control" />
					<form:errors path="responsavel" cssClass="text-danger" />
				</div>	
				
				<div class="md-3">
					<form:label path="preco" cssClass="form-label">Preço:</form:label>
					<form:input path="preco" cssClass="form-control" type="text"  />
					<form:errors path="data" cssClass="text-danger" />
				</div>
				<button type="submit" class="btn btn-primary">Incluir Evento</button>						
			</form:form>
			
		</div>
	</div>
</body>
</html>


