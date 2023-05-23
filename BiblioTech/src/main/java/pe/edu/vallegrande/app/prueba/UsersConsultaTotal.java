package pe.edu.vallegrande.app.prueba;

import java.util.List;

import pe.edu.vallegrande.app.model.Users;
import pe.edu.vallegrande.app.service.CrudUsersService;

public class UsersConsultaTotal {

	public static void main(String[] args) {
		try {
			CrudUsersService userService = new CrudUsersService();
			List<Users> lista = userService.getAll();
			for (Users user : lista) {
				System.out.println(user);
			}
		} catch (Exception e) {
			System.err.println("Hubo un error");
		}
	}
}
