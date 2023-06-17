<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Usuarios - SB Admin</title>
<link href="css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="navbar.jsp"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Lista de Usuarios</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item">Dashboard</li>
						<li class="breadcrumb-item">Usuarios</li>
						<li class="breadcrumb-item active">Lista</li>
					</ol>
					<div class="card-body">
						<form method="post" action="#">
							<div class="mb-2 row">
								<div class="col-sm d-none">
									<button type="button" class="btn d-none" id="btnActualizar"
										name="btnActualizar">Actualizar</button>
								</div>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="names" name="names"
										placeholder="Ingrese nombre">
								</div>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="last_name"
										name="last_name" placeholder="Ingrese apellido">
								</div>
								<div class="col-sm-2">
									<button type="button" class="btn btn-primary mb-2"
										id="btnBuscar" name="btnBuscar">Buscar</button>
								</div>
								<div class="col-sm-2">
									<button type="button" class="btn btn-success float-end mb-2"
										id="btnNuevo" name="btnNuevo">Nuevo</button>
								</div>
							</div>
						</form>
					</div>
					<div class="card mb-4" id="divResultado">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> Registros
						</div>
						<div class="card-body">
							<table class="table caption-top">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Nombre</th>
										<th scope="col">Apellido</th>
										<th scope="col">Tipo Documento</th>
										<th scope="col">Nº Documento</th>
										<th scope="col">Correo Electrónico</th>
										<th scope="col">Nº Celular</th>
										<th scope="col">Accion</th>
									</tr>
								</thead>
								<tbody id="resultadoTabla">
								</tbody>
							</table>
						</div>
					</div>
					<div class="card" id="divRegistro" style="display: none;">
						<div class="card-header">
							<i class="fa-solid fa-list"></i> Formulario
						</div>
						<div class="card-body">
							<form class="row g-3 needs-validation" novalidate>
								<input type="hidden" id="accion" name="accion">
								<div class="col-md-4 d-none">
									<label for="frmIdentifier" class="form-label">ID</label> <input
										type="text" class="form-control" id="frmIdentifier" required>
								</div>
								<div class="col-md-4">
									<label for="frmNames" class="form-label">Nombre</label> <input
										type="text" class="form-control" id="frmNames" required>
									<div class="valid-feedback">¡Se ve bien!</div>
									<div class="invalid-feedback">Por favor, coloque algo válido.</div>
								</div>
								<div class="col-md-4">
									<label for="frmLast_name" class="form-label">Apellido</label>
									<input type="text" class="form-control" id="frmLast_name"
										required>
									<div class="valid-feedback">¡Se ve bien!</div>
									<div class="invalid-feedback">Por favor, coloque algo válido.</div>
								</div>
								<div class="col-md-3">
									<label for="frmDocument_type" class="form-label">Tipo Documento</label> <select
										class="form-select" id="frmDocument_type" required>
										<option selected disabled value="">Elige...</option>
										<option value="DNI">DNI</option>
										<option value="CNE">CNE</option>
									</select>
									<div class="invalid-feedback">Seleccione un tipo de documento.</div>
								</div>
								<div class="col-md-3">
									<label for="frmDocument_number" class="form-label">Nº Documento</label>
									<input type="number" class="form-control" id="frmDocument_number"
										required>
									<div class="valid-feedback">¡Se ve bien!</div>
									<div class="invalid-feedback">Por favor, coloque algo válido.</div>
								</div>
								<div class="col-md-4">
									<label for="frmEmail" class="form-label">Correo
										Electronico</label>
									<div class="input-group has-validation">
										<input type="text" class="form-control" id="frmEmail"
											aria-describedby="inputGroupPrepend" required>
										<div class="valid-feedback">¡Se ve bien!</div>
										<div class="invalid-feedback">Por favor, coloque algo válido.</div>
									</div>
								</div>
								<div class="col-md-4">
									<label for="frmCellphone" class="form-label">Nº Celular</label> <input
										type="number" class="form-control" id="frmCellphone" required>
									<div class="valid-feedback">¡Se ve bien!</div>
									<div class="invalid-feedback">Por favor, coloque algo válido.</div>
								</div>
								<div class="col-12">
									<button class="btn btn-primary" id="btnProcesar" type="button">Enviar
										formulario</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="js/formBoostrap.js"></script>
	<script>
		const ACCION_NUEVO = "NUEVO";
		const ACCION_EDITAR = "EDITAR";
		const ACCION_ELIMINAR = "ELIMINAR";
		
		let btnActualizar = document.getElementById("btnActualizar");
		let btnBuscar = document.getElementById("btnBuscar");
		let btnNuevo = document.getElementById("btnNuevo");
		let btnProcesar = document.getElementById("btnProcesar");
		
		let arreglo = [];
		
		btnActualizar.addEventListener("click", ftBtnActualizar);
		btnBuscar.addEventListener("click", fnBtnBuscar);
		btnNuevo.addEventListener("click", ftBtnNuevo);
		btnProcesar.addEventListener("click", fnBtnProcesar);
		
		function ftBtnNuevo(){
			document.getElementById("btnBuscar").innerHTML = "Regresar";
			let names = document.getElementById("names").classList.add("d-none");
			let last_name = document.getElementById("last_name").classList.add("d-none");
			document.getElementById("accion").value = ACCION_NUEVO;
			document.getElementById("divResultado").style.display = "none";
			document.getElementById("divRegistro").style.display = "block";
		}
		
		function ftBtnEliminar(identifier){
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
				setTimeout(ftBtnActualizar, 2000);
			  }
			})
		}
		
		function ftBtnEditar(identifier){
			document.getElementById("tituloRegistro").innerHTML = "Editar Usuario";
			document.getElementById("accion").value = ACCION_EDITAR;
			fnCargarForm(identifier);
			document.getElementById("divResultado").style.display = "none";
			document.getElementById("divRegistro").style.display = "block";
		}
		
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
		}
		
		function fnBtnBuscar() {
			// Datos
			let names = document.getElementById("names").value;
			let last_name = document.getElementById("last_name").value;
			let url = "UsersBuscar?names=" + names + "&last_name=" + last_name;
			let xhttp = new XMLHttpRequest();
			xhttp.open("GET", url, true);
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					let respuesta = xhttp.responseText;
					arreglo = JSON.parse(respuesta);
					let resultadoTabla = "";
					arreglo.forEach(function(item) {
						resultadoTabla += "<tr class='align-middle'>";
						resultadoTabla += "<td scope='row'>" + item.identifier + "</td>";
						resultadoTabla += "<td>" + item.names + "</td>";
						resultadoTabla += "<td>" + item.last_name + "</td>";
						resultadoTabla += "<td>" + item.document_type + "</td>";
						resultadoTabla += "<td>" + item.document_number + "</td>";
						resultadoTabla += "<td>" + item.email + "</td>";
						resultadoTabla += "<td>" + item.cellphone + "</td>";
						resultadoTabla += "<td>";
						resultadoTabla += "<a class='btn btn-warning' href='javascript:ftBtnEditar(" + item.identifier + ");'> <i class='fa-solid fa-pen'></i> </a>";
						resultadoTabla += "<a class='btn btn-danger' href='javascript:ftBtnEliminar(" + item.identifier + ");'> <i class='fa-solid fa-trash-can'></i> </a>";
						resultadoTabla += "</td>";
						resultadoTabla += "</tr>";
					});
					document.getElementById("resultadoTabla").innerHTML = resultadoTabla;
				}
			};
			xhttp.send();
		}
		
		function ftBtnActualizar() {
			// La llama AJAX
			let xhttp = new XMLHttpRequest();
			xhttp.open("GET", "UsersActualizar", true);
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					let respuesta = xhttp.responseText;
					arreglo = JSON.parse(respuesta);
					let resultadoTabla = "";
					arreglo.forEach(function(item) {
								resultadoTabla += "<tr class='align-middle'>";
								resultadoTabla += "<td scope='row'>" + item.identifier + "</td>";
								resultadoTabla += "<td>" + item.names + "</td>";
								resultadoTabla += "<td>" + item.last_name + "</td>";
								resultadoTabla += "<td>" + item.document_type + "</td>";
								resultadoTabla += "<td>" + item.document_number + "</td>";
								resultadoTabla += "<td>" + item.email + "</td>";
								resultadoTabla += "<td>" + item.cellphone + "</td>";
								resultadoTabla += "<td>";
								resultadoTabla += "<a class='btn btn-warning' href='javascript:ftBtnEditar(" + item.identifier + ");'> <i class='fa-solid fa-pen'></i> </a> ";
								resultadoTabla += "<a class='btn btn-danger' href='javascript:ftBtnEliminar(" + item.identifier + ");'> <i class='fa-solid fa-trash-can'></i> </a>";
								resultadoTabla += "</td>";
								resultadoTabla += "</tr>";
							});
					document.getElementById("resultadoTabla").innerHTML = resultadoTabla;
				}
			};
			xhttp.send();
		}
		
		ftBtnActualizar();
		
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
				}
			});
		}
	</script>
</body>
</html>