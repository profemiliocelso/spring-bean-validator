<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buscar Endereço</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	.borda {
		max-width: 400px;
		margin: auto;
	}
</style>
</head>
<body>
	<div class="container">
		<h2 class="text-center">Endereço</h2>
		<div class="borda">
			<div class="md-3">
				<label class="form-label">Informe o CEP:</label>
				<input class="form-control" type="text" name="cep" id="cep" />
				<button type="button" class="btn btn-primary" id="btnEnviar">Enviar</button>
			</div>	
			<hr>
			<div class="md-3">
				<label class="form-label">Logradouro:</label>
				<input class="form-control" type="text" name="logradouro" id="logradouro" readonly />
			</div>				
			<div class="md-3">
				<label class="form-label">Complemento:</label>
				<input class="form-control" type="text" name="complemento" id="complemento" readonly />
			</div>		
			<div class="md-3">
				<label class="form-label">Bairro:</label>
				<input class="form-control" type="text" name="bairro" id="bairro" readonly />
			</div>		
			<div class="md-3">
				<label class="form-label">Cidade:</label>
				<input class="form-control" type="text" name="cidade" id="cidade" readonly />
			</div>		
			<div class="md-3">
				<label class="form-label">UF:</label>
				<input class="form-control" type="text" name="uf" id="uf" readonly />
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>	
		$(document).ready(function() {
			//$('#btnEnviar').click(function(){
			$('#cep').blur(function(){
				$.ajax({
					dataType: 'json',
					url: 'https://viacep.com.br/ws/' + $('#cep').val() + '/json/',
					method: 'GET',
					success: function(resposta) {
						console.log(resposta);
						
						$('#logradouro').val(resposta.logradouro);
						$('#complemento').val(resposta.complemento);
						$('#bairro').val(resposta.bairro);
						$('#cidade').val(resposta.localidade);
						$('#uf').val(resposta.uf);
					},
					error: function(erro) {
						console.log(erro.responseText);
					}
				});
			});
		});
	</script>	
</body>
</html>





