package pe.edu.vallegrande.app.prueba;

import java.util.List;

import pe.edu.vallegrande.app.model.Librarian;
import pe.edu.vallegrande.app.service.CrudLibrarianService;

public class LibrarianConsultaTotal {

	public static void main(String[] args) {
		try {
			CrudLibrarianService librarianService = new CrudLibrarianService();
			List<Librarian> lista = librarianService.getAll();
			for (Librarian librarian : lista) {
				System.out.println(librarian);
			}
		} catch (Exception e) {
			System.err.println("Hubo un error");
		}
	}
}
