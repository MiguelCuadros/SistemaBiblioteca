package pe.edu.vallegrande.app.prueba.users;

import pe.edu.vallegrande.app.model.Users;
import pe.edu.vallegrande.app.service.CrudUsersService;

public class Insertar {

	public static void main(String[] args) {
		try {
			Users bean = new Users("Omar", "Lopez", "DNI", "70000003", "olopez@gmail.com", "900000003");
			CrudUsersService userService = new CrudUsersService();
			userService.insert(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
