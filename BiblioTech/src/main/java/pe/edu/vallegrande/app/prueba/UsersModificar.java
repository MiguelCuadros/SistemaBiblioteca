package pe.edu.vallegrande.app.prueba;

import pe.edu.vallegrande.app.model.Users;
import pe.edu.vallegrande.app.service.CrudUsersService;

public class UsersModificar {

	public static void main(String[] args) {
		try {
			Users bean = new Users(7,"Richard","Manucci","CNE","070000008","rmanucci@extranjero.com","900000009");
			CrudUsersService userService = new CrudUsersService();
			userService.update(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
