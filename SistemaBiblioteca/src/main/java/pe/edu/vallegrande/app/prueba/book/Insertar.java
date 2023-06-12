package pe.edu.vallegrande.app.prueba.book;

import pe.edu.vallegrande.app.model.Book;
import pe.edu.vallegrande.app.service.CrudBookService;

public class Insertar {

	public static void main(String[] args) {
		try {
			Book bean = new Book("Iliada", "12", "9780140445046", 1, 1);
			CrudBookService bookService = new CrudBookService();
			bookService.insert(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
