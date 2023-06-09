package pe.edu.vallegrande.app.model;

public class Book {

	private Integer identifier;
	private String title;
	private String stock;
	private String isbn;
	private String category_identifier;
	private String author_identifier;
	private String active;
	
	public Book() {
	}
	
	public Book(Integer identifier, String title, String stock, String isbn, String category_identifier,
			String author_identifier, String active) {
		super();
		this.identifier = identifier;
		this.title = title;
		this.stock = stock;
		this.isbn = isbn;
		this.category_identifier = category_identifier;
		this.author_identifier = author_identifier;
		this.active = active;
	}

	public Integer getIdentifier() {
		return identifier;
	}

	public void setIdentifier(Integer identifier) {
		this.identifier = identifier;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getCategory_identifier() {
		return category_identifier;
	}

	public void setCategory_identifier(String category_identifier) {
		this.category_identifier = category_identifier;
	}

	public String getAuthor_identifier() {
		return author_identifier;
	}

	public void setAuthor_identifier(String author_identifier) {
		this.author_identifier = author_identifier;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}
	
	@Override
	public String toString() {
		String data = "[ID: " + this.identifier;
		data += ", Titulo: " + this.title;
		data += ", Stock: " + this.stock;
		data += ", ISBN: " + this.isbn;
		data += ", Categoria: " + this.category_identifier;
		data += ", Autor: " + this.author_identifier;
		data += ", Estado: " + this.active + "]";
		return data;
	}
}
