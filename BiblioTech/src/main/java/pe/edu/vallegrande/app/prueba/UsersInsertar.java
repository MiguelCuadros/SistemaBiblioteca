package pe.edu.vallegrande.app.prueba;

import pe.edu.vallegrande.app.model.Users;
import pe.edu.vallegrande.app.service.CrudUsersService;

public class UsersInsertar {

	public static void main(String[] args) {
		try {
			Users bean = new Users(0,"Roberto", "Quispe", "DNI", "70000008", "rquispe@gmail.com", "900000008");
			CrudUsersService userService = new CrudUsersService();
			userService.insert(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
