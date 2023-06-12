package pe.edu.vallegrande.app.model;

public class Users {

	private Integer identifier;
	private String names;
	private String last_name;
	private String document_type;
	private String document_number;
	private String email;
	private String cellphone;
	private String active;
	
	public Users() {
	}

	public Users(String names, String last_name, String document_type, String document_number, String email,
			String cellphone) {
		super();
		this.names = names;
		this.last_name = last_name;
		this.document_type = document_type;
		this.document_number = document_number;
		this.email = email;
		this.cellphone = cellphone;
	}
	
	public Users(Integer identifier, String names, String last_name, String document_type, String document_number,
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

	public Users(String names, String last_name, String document_type, String document_number, String email,
			String cellphone, String active) {
		super();
		this.names = names;
		this.last_name = last_name;
		this.document_type = document_type;
		this.document_number = document_number;
		this.email = email;
		this.cellphone = cellphone;
		this.active = active;
	}

	public Users(Integer identifier, String names, String last_name, String document_type, String document_number,
			String email, String cellphone, String active) {
		super();
		this.identifier = identifier;
		this.names = names;
		this.last_name = last_name;
		this.document_type = document_type;
		this.document_number = document_number;
		this.email = email;
		this.cellphone = cellphone;
		this.active = active;
	}

	public Integer getIdentifier() {
		return identifier;
	}

	public void setIdentifier(Integer identifier) {
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

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	@Override
	public String toString() {
		String data = "[ID: " + this.identifier;
		data += ", Nombre: " + this.names;
		data += ", Apellido: " + this.last_name;
		data += ", Tipo Documento: " + this.document_type;
		data += ", Numero Documento: " + this.document_number;
		data += ", Email: " + this.email;
		data += ", Celular: " + this.cellphone;
		data += ", Estado: " + this.active + "]";
		return data;
	}
}
