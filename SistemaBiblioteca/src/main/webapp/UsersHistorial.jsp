<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Historial de Usuarios</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="card-header row">
			<div class="col-sm-9 h3 fw-bold">Historial de Usuarios</div>
			<form class="col-xl-3" method="post" action="#">
				<div class="float-end row">
					<div class="col-sm">
						<button type="button" class="btn btn-primary float-end d-none"
							id="btnActualizar" name="btnActualizar">Actualizar</button>
					</div>
					<div class="col-sm">
						<a href="Users.jsp"><button class="btn btn-primary float-end" type="button"
								id="btnUsers" name="btnUsers">Regresar</button></a>
					</div>
				</div>
			</form>
		</div>
		<br>
		<div class="card-body">
			<form method="post" action="#">
				<div class="mb-2 row">
					<div class="col-sm-4">
						<input type="text" class="form-control" id="names" name="names"
							placeholder="Ingrese nombre">
					</div>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="last_name"
							name="last_name" placeholder="Ingrese apellido">
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-primary mb-2" id="btnBuscar"
							name="btnBuscar">Buscar</button>
					</div>
				</div>
			</form>
		</div>
		<div class="card" id="divResultado">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Nombre</th>
						<th scope="col">Apellido</th>
						<th scope="col">Tipo Documento</th>
						<th scope="col">Nº Documento</th>
						<th scope="col">Email</th>
						<th scope="col">Nº Celular</th>
						<th scope="col">Accion</th>
					</tr>
				</thead>
				<tbody id="resultadoTabla">
				</tbody>
			</table>
		</div>
		<div class="card" id="divRegistro" style="display: none;">
			<div class="card-header" id="tituloFormulario">{accion} USUARIOS</div>
			<div class="card-body">
				<form>
					<input type="hidden" id="accion" name="accion">
					<div class="row mb-3 d-none">
						<label for="frmIdentifier" class="col-sm-2 col-form-label">ID</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="frmIdentifier"
								disabled="disabled" value="0">
						</div>
					</div>
					<button type="button" class="btn btn-primary" id="btnProcesar">Procesar</button>
				</form>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		const ACCION_RESTAURAR = "RESTAURAR";
	
		let btnActualizar = document.getElementById("btnActualizar");

		let arreglo = [];

		btnActualizar.addEventListener("click", fnBtnActualizar);
		
		function fnRestaurar(identifier) {
			Swal.fire('Good job!', 'You clicked the button!', 'success')
			document.getElementById("accion").value = ACCION_RESTAURAR;
			fnCargarForm(identifier);
			fnBtnProcesar();
		}
		
		function fnBtnProcesar() {
			// Preparar los datos
			let datos = "accion=" + document.getElementById("accion").value;
			datos += "&identifier=" + document.getElementById("frmIdentifier").value;
			// El envio con AJAX
			let xhr = new XMLHttpRequest();
			xhr.open("POST", "UsersProcesar", true);
			xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					// La solicitud se completó correctamente
					console.log(xhr.responseText);
				}
			};
			xhr.send(datos);
			document.getElementById("divResultado").style.display = "block";
			document.getElementById("divRegistro").style.display = "none";
			setTimeout(fnBtnActualizar, 1000);
		}

		function fnBtnActualizar() {
			// La llama AJAX
			let xhttp = new XMLHttpRequest();
			xhttp.open("GET", "UsersHistorial", true);
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					let respuesta = xhttp.responseText;
					arreglo = JSON.parse(respuesta);
					let resultadoTabla = "";
					arreglo.forEach(function(item) {
								resultadoTabla += "<tr>";
								resultadoTabla += "<td>" + item.identifier
										+ "</td>";
								resultadoTabla += "<td>" + item.names + "</td>";
								resultadoTabla += "<td>" + item.last_name
										+ "</td>";
								resultadoTabla += "<td>" + item.document_type
										+ "</td>";
								resultadoTabla += "<td>" + item.document_number
										+ "</td>";
								resultadoTabla += "<td>" + item.email + "</td>";
								resultadoTabla += "<td>" + item.cellphone
										+ "</td>";
								resultadoTabla += "<td>";
								resultadoTabla += "<a class='btn btn-primary' href='javascript:fnRestaurar("
										+ item.identifier + ");'>Restaurar</a> ";
								resultadoTabla += "</td>";
								resultadoTabla += "</tr>";
							});
					document.getElementById("resultadoTabla").innerHTML = resultadoTabla;
				}
			};
			xhttp.send();
		}
		
		fnBtnActualizar();
		
		function fnCargarForm(identifier){
			arreglo.forEach(function(item) {
				if(item.identifier == identifier){
					document.getElementById("frmIdentifier").value = item.identifier;
				}
			});
		}
	</script>
</body>
</html>