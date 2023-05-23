package pe.edu.vallegrande.app.prueba;

import pe.edu.vallegrande.app.model.Librarian;
import pe.edu.vallegrande.app.service.CrudLibrarianService;

public class LibrarianInsertar {

	public static void main(String[] args) {
		try {
			Librarian bean = new Librarian(0,"Roberto", "Quispe", "DNI", "70000008", "rquispe@gmail.com", "900000008");
			CrudLibrarianService librarianService = new CrudLibrarianService();
			librarianService.insert(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
