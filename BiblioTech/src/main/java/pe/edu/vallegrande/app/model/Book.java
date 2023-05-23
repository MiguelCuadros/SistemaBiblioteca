package pe.edu.vallegrande.app.model;

public class Book {

	private int identifier;
	private String title;
	private String stock;
	private String ISBN;
	private int category_identifier;
	private int author_identifier;
	
	public Book() {
		// TODO Auto-generated constructor stub
	}

	public Book(int identifier, String title, String stock, String ISBN, int category_identifier,
			int author_identifier) {
		super();
		this.identifier = identifier;
		this.title = title;
		this.stock = stock;
		this.ISBN = ISBN;
		this.category_identifier = category_identifier;
		this.author_identifier = author_identifier;
	}

	public int getIdentifier() {
		return identifier;
	}

	public void setIdentifier(int identifier) {
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

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public int getCategory_identifier() {
		return category_identifier;
	}

	public void setCategory_identifier(int category_identifier) {
		this.category_identifier = category_identifier;
	}

	public int getAuthor_identifier() {
		return author_identifier;
	}

	public void setAuthor_identifier(int author_identifier) {
		this.author_identifier = author_identifier;
	}
	
	@Override
	public String toString() {
		String data = "[identifier: " + this.identifier;
		data += ", title: " + this.title;
		data += ", stock: " + this.stock;
		data += ", ISBN: " + this.ISBN;
		data += ", category_identifier: " + this.category_identifier;
		data += ", author_identifier: " + this.author_identifier + "]";
		return data;
	}
	
}
