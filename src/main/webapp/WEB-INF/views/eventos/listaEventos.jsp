<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de Eventos</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css">
<style>
	.borda {
		max-width: 400px;
		margin: auto;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<div class="container">
		<h1 class="text-primary">Lista de Eventos:</h1>
		<div>
			<ul>
				<li><a href=<c:url value="/eventos/inicio" />>Voltar para o menu de opções</a></li>
				<li><a href=<c:url value="/" />>Voltar para a página inicial</a></li>
			</ul>
		</div>
		<button type="button" class="btn btn-primary"
			data-bs-toggle="modal"
			data-bs-target="#modalinc">Novo Evento</button>
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>DESCRIÇÃO</th>
					<th>DATA</th>
					<th>RESPONSAVEL</th>
					<th>PREÇO</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ev" items="${eventos}">
					<tr>
						<td>${ev.id}</td>
						<td>${ev.descricao}</td>
						<td>${ev.data}</td>
						<td>${ev.responsavel}</td>
						<td>${ev.preco}</td>
						<td>
<%-- 							<a href=<c:url value="/eventos/alterar/${ev.id}" />>Alterar</a> --%>

							<button type="button" class="btn btn-warning altera"
								data-id="${ev.id}"
								data-descricao="${ev.descricao}"
								data-dataEvento="${ev.data}"
								data-responsavel="${ev.responsavel}"
								data-preco="${ev.preco}"
								data-bs-toggle="modal"
								data-bs-target="#modalupd"><i class="bi bi-pencil"></i></button> | 
							
							
							<button type="button" class="btn btn-danger remove"
								data-id="${ev.id}"
								data-bs-toggle="modal"
								data-bs-target="#modal"><i class="bi bi-trash"></i></button>
						</td>
					</tr>
				</c:forEach>
			</tbody>			
		</table>
	</div>
	
	
	
	
	<!-- Modal - Remoção -->
	<div class="modal fade" id="modal" tabindex="-1" 
			aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    
	      <!-- Cabeçalho (header) -->
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Confirmar exclusão</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      
	      <!-- Conteúdo (body) -->
	      <div class="modal-body">
	        <h4>Tem certeza que deseja remover este evento?</h4>

	      </div>
	      
	      <!-- Rodapé (footer) -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
	        	Não, voltar para a lista
	        </button>
	        <button type="button" id="btnRemover" class="btn btn-danger" data-bs-dismiss="modal">
	        	Sim, remover
	        </button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal - Alteração -->
	<div class="modal fade" id="modalupd" tabindex="-1" 
			aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    	<form action=<c:url value="/alteraevento" /> method="post">
	      <!-- Cabeçalho (header) -->
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Alteração</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      
	      <!-- Conteúdo (body) -->
	      <div class="modal-body">
			<div class="borda">
				<input type="hidden" id="id" name="id" />
				<div class="md-3">
					<label class="form-label">Descrição:</label>
					<input class="form-control" type="text" id="descricao" name="descricao"  />
				</div>
				
				<div class="md-3">
					<label class="form-label">Data:</label>
					<input class="form-control" type="date" id="dataEvento" name="dataEvento" />
				</div>
				
				<div class="md-3">
					<label class="form-label">Responsável:</label>
					<input class="form-control" type="text" id="responsavel" name="responsavel"  />
				</div>	
				
				<div class="md-3">
					<label class="form-label">Preço:</label>
					<input class="form-control" type="text" id="preco" name="preco" />
				</div>
			</div>
	      </div>
	      
	      <!-- Rodapé (footer) -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
	        	Cancelar
	        </button>
	        <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">
	        	Alterar Evento
	        </button>
	      </div>
	      </form>
	      
	    </div>
	  </div>
	</div>


	<!-- Modal - Novo -->
	<div class="modal fade" id="modalinc" tabindex="-1" 
			aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    	<form action=<c:url value="/cadevento" /> method="post">
	      <!-- Cabeçalho (header) -->
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Novo Evento</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      
	      <!-- Conteúdo (body) -->
	      <div class="modal-body">
			<div class="borda">

				<div class="md-3">
					<label class="form-label">Descrição:</label>
					<input class="form-control" type="text" id="descricao" name="descricao"  />
				</div>
				
				<div class="md-3">
					<label class="form-label">Data:</label>
					<input class="form-control" type="date" id="dataEvento" name="dataEvento" />
				</div>
				
				<div class="md-3">
					<label class="form-label">Responsável:</label>
					<input class="form-control" type="text" id="responsavel" name="responsavel"  />
				</div>	
				
				<div class="md-3">
					<label class="form-label">Preço:</label>
					<input class="form-control" type="text" id="preco" name="preco" />
				</div>
			</div>
	      </div>
	      
	      <!-- Rodapé (footer) -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
	        	Cancelar
	        </button>
	        <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">
	        	Incluir
	        </button>
	      </div>
	      </form>
	      
	    </div>
	  </div>
	</div>
	
			
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			let id;

			$('.remove').click(function(){
				id = $(this).attr('data-id');
			});
			
			$('.altera').click(function() {
				$('#id').val($(this).attr('data-id'));
				$('#descricao').val($(this).attr('data-descricao'));
				$('#dataEvento').val($(this).attr('data-dataEvento'));
				$('#responsavel').val($(this).attr('data-responsavel'));
				$('#preco').val($(this).attr('data-preco'));
			});
			
			$('#btnRemover').click(function() {
				let url = "http://localhost:8080/Projeto01_Eventos_SpringMVC/eventos/remover/" + id;
				$(location).attr('href', url);
			});
			
			
		});
	
	</script>
</body>
</html>