package pe.edu.vallegrande.app.prueba.loanDetail;

import pe.edu.vallegrande.app.model.LoanDetail;
import pe.edu.vallegrande.app.service.CrudLoanDetailService;

public class ConsultaID {

	public static void main(String[] args) {
		try {
			CrudLoanDetailService service = new CrudLoanDetailService();
			LoanDetail bean = service.getForId("3");
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
