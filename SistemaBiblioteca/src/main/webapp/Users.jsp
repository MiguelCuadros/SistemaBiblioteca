<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Usuarios</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="card-header row">
			<div id="tituloRegistro" class="col-sm-9 h3 fw-bold">Lista de
				Usuarios</div>
			<form class="col-xl-3" method="post" action="#">
				<div class="float-end row">
					<div class="col-sm">
						<button type="button" class="btn btn-primary float-end d-none"
							id="btnActualizar" name="btnActualizar">Actualizar</button>
					</div>
					<div class="col-sm">
						<a href="UsersHistorial.jsp"><button
								class="btn btn-primary float-end" type="button"
								id="btnHistorial" name="btnHistorial">Historial</button></a>
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
					<div class="col-sm-2">
						<button type="button" class="btn btn-primary float-end mb-2"
							id="btnNuevo" name="btnNuevo">Nuevo</button>
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
					<div class="row mb-3">
						<label for="frmNames" class="col-sm-2 col-form-label">Nombre</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="frmNames">
						</div>
					</div>
					<div class="row mb-3">
						<label for="frmLast_name" class="col-sm-2 col-form-label">Apellido</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="frmLast_name">
						</div>
					</div>
					<div class="row mb-3">
						<label for="frmDocument_type" class="col-sm-2 col-form-label">Tipo
							documento</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="frmDocument_type">
						</div>
					</div>
					<div class="row mb-3">
						<label for="frmDocument_number" class="col-sm-2 col-form-label">Numero
							documento</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="frmDocument_number">
						</div>
					</div>
					<div class="row mb-3">
						<label for="frmEmail" class="col-sm-2 col-form-label">Email</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="frmEmail">
						</div>
					</div>
					<div class="row mb-3">
						<label for="frmCellphone" class="col-sm-2 col-form-label">Celular</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="frmCellphone">
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
		const ACCION_NUEVO = "NUEVO";
		const ACCION_EDITAR = "EDITAR";
		const ACCION_ELIMINAR = "ELIMINAR";
		
		let btnActualizar = document.getElementById("btnActualizar");
		let btnNuevo = document.getElementById("btnNuevo");
		let btnProcesar = document.getElementById("btnProcesar");
		let btnBuscar = document.getElementById("btnBuscar");

		let arreglo = [];

		btnActualizar.addEventListener("click", fnBtnActualizar);
		btnNuevo.addEventListener("click", fnBtnNuevo);
		btnProcesar.addEventListener("click", fnBtnProcesar);
		btnBuscar.addEventListener("click", fnBtnBuscar)
		
		function fnBtnProcesar() {
			// Preparar los datos
			let datos = "accion=" + document.getElementById("accion").value;
			datos += "&identifier=" + document.getElementById("frmIdentifier").value;
			datos += "&names=" + document.getElementById("frmNames").value;
			datos += "&last_name=" + document.getElementById("frmLast_name").value;
			datos += "&document_type=" + document.getElementById("frmDocument_type").value;
			datos += "&document_number=" + document.getElementById("frmDocument_number").value;
			datos += "&email=" + document.getElementById("frmEmail").value;
			datos += "&cellphone=" + document.getElementById("frmCellphone").value;
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
		
		function fnBtnNuevo(){
			document.getElementById("accion").value = ACCION_NUEVO;
			document.getElementById("divResultado").style.display = "none";
			document.getElementById("divRegistro").style.display = "block";
		}
		
		function fnEditar(identifier) {
			document.getElementById("tituloFormulario").innerHTML = "EDITAR USUARIO";
			document.getElementById("accion").value = ACCION_EDITAR;
			fnCargarForm(identifier);
			document.getElementById("divResultado").style.display = "none";
			document.getElementById("divRegistro").style.display = "block";
		}
		
		function fnEliminar(identifier) {
			Swal.fire({
				  title: 'Quieres eliminar el Usuario?',
				  text: "El usuario aparecera en el Historial de eliminados!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Si, bórralo!',
				  cancelButtonText: 'Cancelar'
				}).then((result) => {
				  if (result.isConfirmed) {
				    Swal.fire(
				      'Usuario eliminado!',
				      'Recuerda que aún los puedes recuperar.',
				      'success'
				    )
					document.getElementById("accion").value = ACCION_ELIMINAR;
					fnCargarForm(identifier);
					fnBtnProcesar();
				  }
				})
		}
		
		function fnBtnBuscar() {
			// Datos
			let names = document.getElementById("names").value;
			let last_name = document.getElementById("last_name").value;
			let url = "UsersBuscar?names=" + names + "&last_name="
					+ last_name;
			let xhttp = new XMLHttpRequest();
			xhttp.open("GET", url, true);
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					let respuesta = xhttp.responseText;
					arreglo = JSON.parse(respuesta);
					let resultadoTabla = "";
					arreglo.forEach(function(item) {
						resultadoTabla += "<tr>";
						resultadoTabla += "<td>" + item.identifier + "</td>";
						resultadoTabla += "<td>" + item.names + "</td>";
						resultadoTabla += "<td>" + item.last_name + "</td>";
						resultadoTabla += "<td>" + item.document_type + "</td>";
						resultadoTabla += "<td>" + item.document_number + "</td>";
						resultadoTabla += "<td>" + item.email + "</td>";
						resultadoTabla += "<td>" + item.cellphone + "</td>";
						resultadoTabla += "<td>";
						resultadoTabla += "<a class='btn btn-primary' href='javascript:fnEditar(" + item.identifier + ");'>Editar</a> ";
						resultadoTabla += "<a class='btn btn-primary' href='javascript:fnEliminar(" + item.identifier + ");'>Eliminar</a>";
						resultadoTabla += "</td>";
						resultadoTabla += "</tr>";
							});
					document.getElementById("resultadoTabla").innerHTML = resultadoTabla;
				}
			};
			xhttp.send();
		}

		function fnBtnActualizar() {
			// La llama AJAX
			let xhttp = new XMLHttpRequest();
			xhttp.open("GET", "UsersActualizar", true);
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
								resultadoTabla += "<a class='btn btn-primary' href='javascript:fnEditar("
										+ item.identifier + ");'>Editar</a> ";
								resultadoTabla += "<a class='btn btn-primary' href='javascript:fnEliminar("
										+ item.identifier + ");'>Eliminar</a>";
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
					document.getElementById("frmNames").value = item.names;
					document.getElementById("frmLast_name").value = item.last_name;
 					document.getElementById("frmDocument_type").value = item.document_type;
					document.getElementById("frmDocument_number").value = item.document_number;
					document.getElementById("frmEmail").value = item.email;
					document.getElementById("frmCellphone").value = item.cellphone;
					//break;
				}
			});
		}
	</script>
</body>
</html>