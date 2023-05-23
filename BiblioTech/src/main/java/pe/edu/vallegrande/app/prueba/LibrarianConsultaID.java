package pe.edu.vallegrande.app.prueba;

import pe.edu.vallegrande.app.model.Librarian;
import pe.edu.vallegrande.app.service.CrudLibrarianService;

public class LibrarianConsultaID {

	public static void main(String[] args) {
		try {
			CrudLibrarianService librarianService = new CrudLibrarianService();
			Librarian bean = librarianService.getForId("1");
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
