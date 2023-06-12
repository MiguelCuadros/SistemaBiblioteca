package pe.edu.vallegrande.app.prueba.users;

import pe.edu.vallegrande.app.model.Users;
import pe.edu.vallegrande.app.service.CrudUsersService;

public class Insertar {

	public static void main(String[] args) {
		try {
			Users bean = new Users("Luis", "Manzo", "DNI", "70804050", "lmanzo@gmail.com", "920002013");
			CrudUsersService userService = new CrudUsersService();
			userService.insert(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
