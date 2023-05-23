package pe.edu.vallegrande.app.prueba;

import pe.edu.vallegrande.app.model.Book;
import pe.edu.vallegrande.app.service.CrudBookService;

public class BookConsultaID {

	public static void main(String[] args) {
		try {
			CrudBookService bookService = new CrudBookService();
			Book bean = bookService.getForId("4");
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
