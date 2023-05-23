package pe.edu.vallegrande.app.model;

public class Librarian {

	private int identifier;
	private String names;
	private String last_name;
	private String document_type;
	private String document_number;
	private String email;
	private String cellphone;
	
	public Librarian() {
	}
	
	public Librarian(int identifier, String names, String last_name, String document_type, String document_number,
			String email, String cellphone) {
		super();
		this.identifier = identifier;
		this.names = names;
		this.last_name = last_name;
		this.document_type = document_type;
		this.document_number = document_number;
		this.email = email;
		this.cellphone = cellphone;
	}

	public int getIdentifier() {
		return identifier;
	}

	public void setIdentifier(int identifier) {
		this.identifier = identifier;
	}

	public String getNames() {
		return names;
	}

	public void setNames(String names) {
		this.names = names;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getDocument_type() {
		return document_type;
	}

	public void setDocument_type(String document_type) {
		this.document_type = document_type;
	}

	public String getDocument_number() {
		return document_number;
	}

	public void setDocument_number(String document_number) {
		this.document_number = document_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	@Override
	public String toString() {
		String data = "[identifier: " + this.identifier;
		data += ", names: " + this.names;
		data += ", last_name: " + this.last_name;
		data += ", document_type: " + this.document_type;
		data += ", document_number: " + this.document_number;
		data += ", email: " + this.email;
		data += ", cellphone: " + this.cellphone + "]";
		return data;
	}
}
