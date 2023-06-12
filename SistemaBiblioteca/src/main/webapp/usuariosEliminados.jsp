<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Usuarios - BiblioTech</title>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/bootstrap.css">

<link rel="stylesheet" href="assets/vendors/iconly/bold.css">

<link rel="stylesheet"
	href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="shortcut icon" href="assets/images/favicon.svg"
	type="image/x-icon">
</head>

<body>
	<div id="app">
		<jsp:include page="sidebar_admin.jsp"></jsp:include>
		<div id="main">
			<header class="mb-3">
				<a href="#" class="burger-btn d-block d-xl-none"> <i
					class="bi bi-justify fs-3"></i>
				</a>
			</header>

			<div class="page-heading">
				<h3>Usuarios</h3>
			</div>
			<div class="page-content">
				<section class="row">
					<div class="card">
						<div class="card-header">
							<h4>Usuarios Eliminados</h4>
						</div>
						<div class="card-body">
							<form method="post" action="#">
								<div class="mb-2 row">
									<div class="col-sm d-none">
										<button type="button" class="btn btn-primary float-end d-none"
											id="btnActualizar" name="btnActualizar">Actualizar</button>
									</div>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="names"
											name="names" placeholder="Ingrese nombre">
									</div>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="last_name"
											name="last_name" placeholder="Ingrese apellido">
									</div>
									<div class="col-sm-2">
										<button type="button" class="btn btn-primary mb-2"
											id="btnBuscar" name="btnBuscar">Buscar</button>
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
							<div class="card-header" id="tituloFormulario">{accion}
								USUARIOS</div>
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
				</section>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
	<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendors/apexcharts/apexcharts.js"></script>
	<script src="assets/js/pages/dashboard.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		const ACCION_RESTAURAR = "RESTAURAR";
		const ACCION_ELIMINATE = "ELIMINATE";
	
		let btnActualizar = document.getElementById("btnActualizar");

		let arreglo = [];

		btnActualizar.addEventListener("click", fnBtnActualizar);
		
		function fnEliminar(identifier) {
			Swal.fire({
				  title: 'Quieres eliminar el Usuario?',
				  text: "El usuario se eliminara permanentemente!",
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
				      'El usuario se eliminado, no podras recuperarlo.',
				      'success'
				    )
					document.getElementById("accion").value = ACCION_ELIMINATE;
					fnCargarForm(identifier);
					fnBtnProcesar();
				  }
				})
		}
		
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
								resultadoTabla += "<a class='btn btn-primary' href='javascript:fnRestaurar(" + item.identifier + ");'>Restaurar</a> ";
								resultadoTabla += "<a class='btn btn-primary' href='javascript:fnEliminar(" + item.identifier + ");'>Eliminar</a> ";
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