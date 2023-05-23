package pe.edu.vallegrande.app.prueba;

import pe.edu.vallegrande.app.service.CrudLibrarianService;

public class LibrarianEliminar {

	public static void main(String[] args) {
		try {
			CrudLibrarianService librarianService = new CrudLibrarianService();
			librarianService.delete("2");
			System.out.println("Usuario eliminado correctamente.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
