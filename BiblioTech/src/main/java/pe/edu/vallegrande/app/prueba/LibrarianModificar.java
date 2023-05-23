package pe.edu.vallegrande.app.prueba;

import pe.edu.vallegrande.app.model.Librarian;
import pe.edu.vallegrande.app.service.CrudLibrarianService;

public class LibrarianModificar {

	public static void main(String[] args) {
		try {
			Librarian bean = new Librarian(7,"Richard","Manucci","CNE","070000008","rmanucci@extranjero.com","900000009");
			CrudLibrarianService librarianService = new CrudLibrarianService();
			librarianService.update(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
