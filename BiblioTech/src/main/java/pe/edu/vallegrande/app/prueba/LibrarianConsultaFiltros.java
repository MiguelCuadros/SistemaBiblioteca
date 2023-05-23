package pe.edu.vallegrande.app.prueba;

import java.util.List;

import pe.edu.vallegrande.app.model.Librarian;
import pe.edu.vallegrande.app.service.CrudLibrarianService;

public class LibrarianConsultaFiltros {

	public static void main(String[] args) {
		try {
			Librarian bean = new Librarian();
			bean.setNames("B");
			bean.setLast_name("T");
			CrudLibrarianService librarianService = new CrudLibrarianService();
			List<Librarian> lista = librarianService.get(bean);
			for (Librarian librarian : lista) {
				System.out.println(librarian);
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
