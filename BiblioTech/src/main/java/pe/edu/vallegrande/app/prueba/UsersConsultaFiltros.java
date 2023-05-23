package pe.edu.vallegrande.app.prueba;

import java.util.List;

import pe.edu.vallegrande.app.model.Users;
import pe.edu.vallegrande.app.service.CrudUsersService;

public class UsersConsultaFiltros {

	public static void main(String[] args) {
		try {
			Users bean = new Users();
			bean.setNames("   M     ");
			bean.setLast_name("");
			CrudUsersService userService = new CrudUsersService();
			List<Users> lista = userService.get(bean);
			for (Users user : lista) {
				System.out.println(user);
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
