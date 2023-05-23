package pe.edu.vallegrande.app.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.app.db.AccesoDB;
import pe.edu.vallegrande.app.model.Librarian;
import pe.edu.vallegrande.app.service.spec.CrudServiceSpec;
import pe.edu.vallegrande.app.service.spec.RowMapper;

public class CrudLibrarianService implements CrudServiceSpec<Librarian>, RowMapper<Librarian> {

	private final String SQL_SELECT_BASE = "SELECT identifier, names, last_name, document_type, document_number, email, cellphone FROM librarian";
	private final String SQL_INSERT = "INSERT INTO librarian (names, last_name, document_type, document_number, email, cellphone) VALUES (?,?,?,?,?,?)";
	private final String SQL_DELETE = "DELETE FROM librarian WHERE identifier=?";
	private final String SQL_UPDATE = "UPDATE librarian SET names=?, last_name=?, document_type=?, document_number=?, email=?, cellphone=? WHERE identifier=?";

	@Override
	public List<Librarian> getAll() {
		List<Librarian> lista = new ArrayList<>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			cn = AccesoDB.getConnection();
			pstm = cn.prepareStatement(SQL_SELECT_BASE);
			rs = pstm.executeQuery();
			while (rs.next()) {
				Librarian bean = mapRow(rs);
				lista.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lista;
	}

	@Override
	public Librarian getForId(String identifier) {
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Librarian bean = null;
		String sql;
		try {
			cn = AccesoDB.getConnection();
			sql = SQL_SELECT_BASE + " WHERE identifier=?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, Integer.parseInt(identifier));
			rs = pstm.executeQuery();
			if (rs.next()) {
				bean = mapRow(rs);
			}
			rs.close();
			pstm.close();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		return bean;
	}

	@Override
	public List<Librarian> get(Librarian bean) {
		Connection cn = null;
		List<Librarian> lista = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Librarian item;
		String sql;
		String names = "%" + UtilService.setStringVacio(bean.getNames()) + "%";
		String last_name = "%" + UtilService.setStringVacio(bean.getLast_name()) + "%";
		try {
			cn = AccesoDB.getConnection();
			sql = SQL_SELECT_BASE + " WHERE names LIKE ? AND last_name LIKE ?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, names);
			pstm.setString(2, last_name);
			rs = pstm.executeQuery();
			while (rs.next()) {
				item = mapRow(rs);
				lista.add(item);
			}
			rs.close();
			pstm.close();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		return lista;
	}

	@Override
	public void insert(Librarian bean) {
		Connection cn = null;
		PreparedStatement pstm = null;
		int filas;
		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			pstm = cn.prepareStatement(SQL_INSERT);
			pstm.setString(1, bean.getNames());
			pstm.setString(2, bean.getLast_name());
			pstm.setString(3, bean.getDocument_type());
			pstm.setString(4, bean.getDocument_number());
			pstm.setString(5, bean.getEmail());
			pstm.setString(6, bean.getCellphone());
			filas = pstm.executeUpdate();
			pstm.close();
			if(filas != 1) {
				throw new SQLException("Error, verifique sus datos e intentelo nuevamente");
			}
			cn.commit();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	@Override
	public void update(Librarian bean) {
		Connection cn = null;
		PreparedStatement pstm = null;
		int filas;
		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			pstm = cn.prepareStatement(SQL_UPDATE);
			pstm.setString(1, bean.getNames());
			pstm.setString(2, bean.getLast_name());
			pstm.setString(3, bean.getDocument_type());
			pstm.setString(4, bean.getDocument_number());
			pstm.setString(5, bean.getEmail());
			pstm.setString(6, bean.getCellphone());
			pstm.setInt(7, bean.getIdentifier());
			filas = pstm.executeUpdate();
			pstm.close();
			if (filas != 1) {
				throw new SQLException("Error, verifique sus datos e intentelo nuevamente.");
			}
			cn.commit();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	@Override
	public void delete(String identifier) {
		Connection cn = null;
		PreparedStatement pstm = null;
		int filas;
		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			pstm = cn.prepareStatement(SQL_DELETE);
			pstm.setInt(1, Integer.parseInt(identifier));
			filas = pstm.executeUpdate();
			pstm.close();
			if (filas != 1) {
				throw new SQLException("No se pudo eliminar el usuario");
			}
			cn.commit();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	@Override
	public Librarian mapRow(ResultSet rs) throws SQLException {
		Librarian bean = new Librarian();
		bean.setIdentifier(rs.getInt("identifier"));
		bean.setNames(rs.getString("names"));
		bean.setLast_name(rs.getString("last_name"));
		bean.setDocument_type(rs.getString("document_type"));
		bean.setDocument_number(rs.getString("document_number"));
		bean.setEmail(rs.getString("email"));
		bean.setCellphone(rs.getString("cellphone"));
		return bean;
	}

}
