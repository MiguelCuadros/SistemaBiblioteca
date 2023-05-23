package pe.edu.vallegrande.app.prueba;

import pe.edu.vallegrande.app.service.CrudBookService;

public class BookEliminar {

	public static void main(String[] args) {
		try {
			CrudBookService bookService = new CrudBookService();
			bookService.delete("6");
			System.out.println("Usuario eliminado correctamente.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
