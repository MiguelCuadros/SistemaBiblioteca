package pe.edu.vallegrande.app.prueba;

import pe.edu.vallegrande.app.service.CrudUsersService;

public class UsersEliminar {

	public static void main(String[] args) {
		try {
			CrudUsersService userService = new CrudUsersService();
			userService.delete("1002");
			System.out.println("Usuario eliminado correctamente.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
