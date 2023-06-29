package pe.edu.vallegrande.app.model;

import java.util.Date;

public class Loan {

	private Integer identifier;
	private Date start_dates;
	private String return_date;
	private String user_identifier;
	private String librarian_identifier;
	private String active;
	
	public Loan() {
	}

	public Loan(Integer identifier, Date start_dates, String return_date, String user_identifier,
			String librarian_identifier, String active) {
		super();
		this.identifier = identifier;
		this.start_dates = start_dates;
		this.return_date = return_date;
		this.user_identifier = user_identifier;
		this.librarian_identifier = librarian_identifier;
		this.active = active;
	}

	public Loan(Integer identifier, Date start_dates, String return_date, String user_identifier,
			String librarian_identifier) {
		super();
		this.identifier = identifier;
		this.start_dates = start_dates;
		this.return_date = return_date;
		this.user_identifier = user_identifier;
		this.librarian_identifier = librarian_identifier;
	}

	public Loan(Date start_dates, String return_date, String user_identifier, String librarian_identifier) {
		super();
		this.start_dates = start_dates;
		this.return_date = return_date;
		this.user_identifier = user_identifier;
		this.librarian_identifier = librarian_identifier;
	}

	public Integer getIdentifier() {
		return identifier;
	}

	public void setIdentifier(Integer identifier) {
		this.identifier = identifier;
	}

	public Date getStart_dates() {
		return start_dates;
	}

	public void setStart_dates(Date start_dates) {
		this.start_dates = start_dates;
	}

	public String getReturn_date() {
		return return_date;
	}

	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}

	public String getUser_identifier() {
		return user_identifier;
	}

	public void setUser_identifier(String user_identifier) {
		this.user_identifier = user_identifier;
	}

	public String getLibrarian_identifier() {
		return librarian_identifier;
	}

	public void setLibrarian_identifier(String librarian_identifier) {
		this.librarian_identifier = librarian_identifier;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	@Override
	public String toString() {
		return "Loan [identifier=" + identifier + ", start_dates=" + start_dates + ", return_date=" + return_date
				+ ", user_identifier=" + user_identifier + ", librarian_identifier=" + librarian_identifier
				+ ", active=" + active + "]";
	}
}
