<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Usuarios - BiblioTech</title>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/vendors/iconly/bold.css">
<link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
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
							<h4 id="tituloRegistro">Lista de Libros</h4>
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
							<button type="button" class="btn btn-primary"
								onclick="exportToExcel()">Generar Reporte</button>
						</div>
						<div class="card" id="divRegistro" style="display: none;">
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
											Documento</label>
										<div class="col-sm-10">
											<select id="frmDocument_type" class="form-select"
												aria-label="Default select example">
												<option>DNI</option>
												<option>CNE</option>
											</select>
										</div>
									</div>
									<div class="row mb-3">
										<label for="frmDocument_number"
											class="col-sm-2 col-form-label">Nº Documento</label>
										<div class="col-sm-10">
											<input type="number" class="form-control"
												id="frmDocument_number">
										</div>
									</div>
									<div class="row mb-3">
										<label for="frmEmail" class="col-sm-2 col-form-label">Email</label>
										<div class="col-sm-10">
											<input type="email" class="form-control" id="frmEmail">
										</div>
									</div>
									<div class="row mb-3">
										<label for="frmCellphone" class="col-sm-2 col-form-label">Celular</label>
										<div class="col-sm-10">
											<input type="number" class="form-control" id="frmCellphone">
										</div>
									</div>
									<button type="submit" class="btn btn-primary" id="btnProcesar">Procesar</button>
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
			document.getElementById("tituloRegistro").innerHTML = "Nuevo Usuario";
			document.getElementById("btnBuscar").innerHTML = "Regresar";
			let names = document.getElementById("names").classList.add("d-none");
			let last_name = document.getElementById("last_name").classList.add("d-none");
			document.getElementById("accion").value = ACCION_NUEVO;
			document.getElementById("divResultado").style.display = "none";
			document.getElementById("divRegistro").style.display = "block";
		}
		
		function fnEditar(identifier) {
			document.getElementById("tituloRegistro").innerHTML = "Editar Usuario";
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
			let url = "UsersBuscar?names=" + names + "&last_name=" + last_name;
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
					document.getElementById("divResultado").style.display = "block";
					document.getElementById("divRegistro").style.display = "none";
					document.getElementById("btnBuscar").innerHTML = "Buscar";
					let names = document.getElementById("names").classList.remove("d-none");
					let last_name = document.getElementById("last_name").classList.remove("d-none");
				}
			};
			xhttp.send();
		}
		
		//setInterval(fnBtnBuscar, 1000);

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
		
		function exportToExcel() {
			  // Obtener los datos de la tabla
			  let rows = document.querySelectorAll("#resultadoTabla tr");

			  // Crear una matriz de datos con las columnas deseadas
			  let data = [];
			  
			  // Agregar los encabezados de columna
			  data.push(["ID", "NOMBRE", "APELLIDO", "TIPO DOCUMENTO", "Nº DOCUMENTO", "CORREO ELECTRONICO", "Nº CELULAR"]);
			  
			  rows.forEach(function(row) {
			    let rowData = [];
			    let columns = row.querySelectorAll("td:nth-child(1), td:nth-child(2), td:nth-child(3), td:nth-child(4), td:nth-child(5), td:nth-child(6), td:nth-child(7)"); // Incluir solo las columnas deseadas
			    columns.forEach(function(column) {
			      rowData.push(column.innerText);
			    });
			    data.push(rowData);
			  });

			  // Crear una hoja de cálculo de Excel
			  let worksheet = XLSX.utils.aoa_to_sheet(data);

			  // Crear un libro de Excel y agregar la hoja de cálculo
			  let workbook = XLSX.utils.book_new();
			  XLSX.utils.book_append_sheet(workbook, worksheet, "Usuarios");

			  // Guardar el archivo de Excel
			  XLSX.writeFile(workbook, "reporteUsuarios.xlsx");
		}
	</script>
</body>

</html>