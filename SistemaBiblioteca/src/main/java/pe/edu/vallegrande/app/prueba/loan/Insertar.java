package pe.edu.vallegrande.app.prueba.loan;

import pe.edu.vallegrande.app.model.Loan;
import pe.edu.vallegrande.app.service.CrudLoanService;

public class Insertar {

	public static void main(String[] args) {
		try {
			Loan bean = new Loan();
            bean.setReturn_date("2023-08-16");
			bean.setUser_identifier("1");
			bean.setLibrarian_identifier("1");
			CrudLoanService loanService = new CrudLoanService();
			loanService.insert(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
