package pe.edu.vallegrande.app.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.app.db.AccesoDB;
import pe.edu.vallegrande.app.model.Book;
import pe.edu.vallegrande.app.service.spec.CrudServiceSpec;
import pe.edu.vallegrande.app.service.spec.RowMapper;

public class CrudBookService implements CrudServiceSpec<Book>, RowMapper<Book> {

	private final String SQL_SELECT_BASE = "SELECT identifier, title, stock, ISBN, category_identifier, author_identifier FROM book";
	private final String SQL_INSERT = "INSERT INTO book (title, stock, ISBN, category_identifier, author_identifier) VALUES (?,?,?,?,?)";
	private final String SQL_DELETE = "DELETE FROM book WHERE identifier=?";
	private final String SQL_UPDATE = "UPDATE book SET title=?, stock=?, ISBN=?, category_identifier=?, author_identifier=? WHERE identifier=?";

	@Override
	public List<Book> getAll() {
		List<Book> lista = new ArrayList<>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			cn = AccesoDB.getConnection();
			pstm = cn.prepareStatement(SQL_SELECT_BASE);
			rs = pstm.executeQuery();
			while (rs.next()) {
				Book bean = mapRow(rs);
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
	public Book getForId(String identifier) {
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Book bean = null;
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
	public List<Book> get(Book bean) {
		Connection cn = null;
		List<Book> lista = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Book item;
		String sql;
		String title = "%" + UtilService.setStringVacio(bean.getTitle()) + "%";
		try {
			cn = AccesoDB.getConnection();
			sql = SQL_SELECT_BASE + " WHERE title LIKE ?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, title);
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
	public void insert(Book bean) {
		Connection cn = null;
		PreparedStatement pstm = null;
		int filas;
		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			pstm = cn.prepareStatement(SQL_INSERT);
			pstm.setString(1, bean.getTitle());
			pstm.setString(2, bean.getStock());
			pstm.setString(3, bean.getISBN());
			pstm.setInt(4, bean.getCategory_identifier());
			pstm.setInt(5, bean.getAuthor_identifier());
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
	public void update(Book bean) {
		Connection cn = null;
		PreparedStatement pstm = null;
		int filas;
		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			pstm = cn.prepareStatement(SQL_UPDATE);
			pstm.setString(1, bean.getTitle());
			pstm.setString(2, bean.getStock());
			pstm.setString(3, bean.getISBN());
			pstm.setInt(4, bean.getCategory_identifier());
			pstm.setInt(5, bean.getAuthor_identifier());
			pstm.setInt(6, bean.getIdentifier());
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
	public Book mapRow(ResultSet rs) throws SQLException {
		Book bean = new Book();
		bean.setIdentifier(rs.getInt("identifier"));
		bean.setTitle(rs.getString("title"));
		bean.setStock(rs.getString("stock"));
		bean.setISBN(rs.getString("ISBN"));
		bean.setCategory_identifier(rs.getInt("category_identifier"));
		bean.setAuthor_identifier(rs.getInt("author_identifier"));
		return bean;
	}

}
