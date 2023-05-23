package pe.edu.vallegrande.app.prueba;

import pe.edu.vallegrande.app.model.Book;
import pe.edu.vallegrande.app.service.CrudBookService;

public class BookModificar {

	public static void main(String[] args) {
		try {
			Book bean = new Book(6, "La fiesta del Chivo", "23", "9786124244216", 10, 4);
			CrudBookService bookService = new CrudBookService();
			bookService.update(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
