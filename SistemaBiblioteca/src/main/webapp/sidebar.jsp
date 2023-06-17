<div id="layoutSidenav_nav">
	<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
		<div class="sb-sidenav-menu">
			<div class="nav">
				<div class="sb-sidenav-menu-heading">Centro</div>
				<a class="nav-link" href="index.jsp">
					<div class="sb-nav-link-icon">
						<i class="fas fa-tachometer-alt"></i>
					</div> Panel
				</a>
				<div class="sb-sidenav-menu-heading">Bibliotecario</div>
				<!--  -->
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseUsuarios" aria-expanded="false"
					aria-controls="#collapseUsuarios">
					<div class="sb-nav-link-icon">
						<i class="fa-solid fa-user"></i>
					</div> Usuarios
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseUsuarios"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="usuarios.jsp">Lista</a>
						<a class="nav-link" href="usuariosEliminados.jsp">Eliminados</a>
					</nav>
				</div>
				<!-- Reservas -->
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseReservas" aria-expanded="false"
					aria-controls="#collapseReservas">
					<div class="sb-nav-link-icon">
						<i class="fa-solid fa-calendar-days"></i>
					</div> Reservas
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseReservas"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="layout-static.html"></a>
						<a class="nav-link" href="layout-sidenav-light.html"></a>
					</nav>
				</div>
				<!-- Prestamos -->
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapsePrestamos" aria-expanded="false"
					aria-controls="#collapsePrestamos">
					<div class="sb-nav-link-icon">
						<i class="fa-solid fa-book-open-reader"></i>
					</div> Prestamos
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapsePrestamos"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="layout-static.html"></a>
						<a class="nav-link" href="layout-sidenav-light.html"></a>
					</nav>
				</div>
				<!-- Bibliotecario -->
				<div class="sb-sidenav-menu-heading">Biblioteca</div>
				<a class="nav-link" href="charts.html">
					<div class="sb-nav-link-icon">
						<i class="fas fa-align-justify"></i>
					</div> Categorias
				</a>
				<a class="nav-link" href="tables.html">
					<div class="sb-nav-link-icon">
						<i class="fa-solid fa-address-book"></i>
					</div> Autores
				</a>
				<a class="nav-link" href="tables.html">
					<div class="sb-nav-link-icon">
						<i class="fa-solid fa-book"></i>
					</div> Libros
				</a>
			</div>
		</div>
		<div class="sb-sidenav-footer">
			<div class="small">Conectado como:</div>
			Admin
		</div>
	</nav>
</div>