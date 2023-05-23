package pe.edu.vallegrande.app.prueba;

import pe.edu.vallegrande.app.model.Book;
import pe.edu.vallegrande.app.service.CrudBookService;

public class BookInsertar {

	public static void main(String[] args) {
		try {
			Book bean = new Book(0,"La fiesta del Chivo", "15", "9786124244216", 7, 3);
			CrudBookService bookService = new CrudBookService();
			bookService.insert(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
