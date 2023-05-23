package pe.edu.vallegrande.app.prueba;

import pe.edu.vallegrande.app.model.Users;
import pe.edu.vallegrande.app.service.CrudUsersService;

public class UsersConsultaID {

	public static void main(String[] args) {
		try {
			CrudUsersService userService = new CrudUsersService();
			Users bean = userService.getForId("4");
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
