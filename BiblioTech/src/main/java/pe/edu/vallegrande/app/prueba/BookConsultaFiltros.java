package pe.edu.vallegrande.app.prueba;

import java.util.List;

import pe.edu.vallegrande.app.model.Book;
import pe.edu.vallegrande.app.service.CrudBookService;

public class BookConsultaFiltros {

	public static void main(String[] args) {
		try {
			Book bean = new Book();
			bean.setTitle("   M     ");
			CrudBookService bookService = new CrudBookService();
			List<Book> lista = bookService.get(bean);
			for (Book book : lista) {
				System.out.println(book);
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
