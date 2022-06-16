<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Titulo</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<h1>Exemplo Javascript</h1>
	
	<div class="container">
		<input type="button" value="Mostrar Mensagem" id="botaoMensagem" />
		<input type="button" value="Mostrar Mensagem (fun��o anonima)" id="botaoMensagem2" />
		<input type="button" value="Mostrar Mensagem (jquery)" id="botaoMensagem3" />
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		// Vamos escrever uma fun��o que, quando executada, apresenta uma mensagem
		// na tela para o usu�rio
		function mostrar() {
			alert('Exemplo de mensagem no Javascript');
		}
		
		let botao = document.getElementById('botaoMensagem');
		botao.addEventListener('click', mostrar);
		
		// usando fun��o an�nima
		let botao2 = document.getElementById('botaoMensagem2');
		
		botao2.addEventListener('click', function () { 
			alert('Exemplo de fun��o an�nima');
		});
		
		// usando JQuery
		$('#botaoMensagem3').click(function() {
			alert('Exemplo de chamada JQuery');
		});
	</script>
	
</body>
</html>