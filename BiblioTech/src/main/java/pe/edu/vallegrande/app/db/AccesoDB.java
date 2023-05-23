package pe.edu.vallegrande.app.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class AccesoDB {

	private AccesoDB() {
	}
	
	public static Connection getConnection() throws SQLException {
		Connection cn = null;
		String Driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String urlDB = "jdbc:sqlserver://localhost:1433;databaseName=dbSistemaBiblioteca;encrypt=true;TrustServerCertificate=True;";
		String user = "sa";
		String pass = "1234";
		
		try {
			Class.forName(Driver).getDeclaredConstructor().newInstance();
			cn = DriverManager.getConnection(urlDB, user, pass);
		} catch (SQLException e) {
			throw e;
		} catch (ClassNotFoundException e) {
			throw new SQLException("No se encontró el driver de la base de datos.");
		} catch (Exception e) {
			throw new SQLException("No se puede establecer la conexión con la BD.");
		}
		return cn;
	}
}
