package pe.edu.vallegrande.app.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.app.db.AccesoDB;
import pe.edu.vallegrande.app.model.Loan;

public class CrudLoanService {

	public List<Loan> getActive() {
		List<Loan> lista = new ArrayList<>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql;
		try {
			cn = AccesoDB.getConnection();
			sql = "SELECT * FROM loan WHERE active='A'";
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while(rs.next()) {
				Loan bean = new Loan();
				bean.setIdentifier(rs.getInt(1));
				bean.setStart_dates(rs.getDate(2));
				bean.setReturn_date(rs.getString(3));
				bean.setUser_identifier(rs.getString(4));
				bean.setLibrarian_identifier(rs.getString(5));
				bean.setActive(rs.getString(6));
				lista.add(bean);
			}
		} catch (Exception e) {
			throw new RuntimeException("Hay un error.");
		}
		return lista;
	}

	public List<Loan> getInactive() {
		List<Loan> lista = new ArrayList<>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql;
		try {
			cn = AccesoDB.getConnection();
			sql = "SELECT * FROM loan WHERE active='I'";
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while(rs.next()) {
				Loan bean = new Loan();
				bean.setIdentifier(rs.getInt(1));
				bean.setStart_dates(rs.getDate(2));
				bean.setReturn_date(rs.getString(3));
				bean.setUser_identifier(rs.getString(4));
				bean.setLibrarian_identifier(rs.getString(5));
				bean.setActive(rs.getString(6));
				lista.add(bean);
			}
		} catch (Exception e) {
			throw new RuntimeException("Hay un error.");
		}
		return lista;
	}

	public Loan getForId(String identifier) {
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Loan bean = null;
		String sql;
		try {
			cn = AccesoDB.getConnection();
			sql = "SELECT * FROM loan WHERE active='A' AND identifier=?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, Integer.parseInt(identifier));
			rs = pstm.executeQuery();
			if(rs.next()) {
				bean = new Loan();
				bean.setIdentifier(rs.getInt(1));
				bean.setStart_dates(rs.getDate(2));
				bean.setReturn_date(rs.getString(3));
				bean.setUser_identifier(rs.getString(4));
				bean.setLibrarian_identifier(rs.getString(5));
				bean.setActive(rs.getString(6));
			}
			rs.close();
			pstm.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return bean;
	}

	public void insert(Loan bean) {
		Connection cn = null;
		PreparedStatement pstm = null;
		String sql;
		int filas;
		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			sql = "INSERT INTO loan (start_dates, return_date, user_identifier, librarian_identifier) VALUES (GETDATE(),?,?,?)";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, bean.getReturn_date());
			pstm.setString(2, bean.getUser_identifier());
			pstm.setString(3, bean.getLibrarian_identifier());
			filas = pstm.executeUpdate();
			pstm.close();
			if(filas != 1) {
				throw new RuntimeException();
			}
			cn.commit();
		} catch (Exception e) {
			try {
				cn.rollback();
				cn.close();
			} catch (Exception e2) {
			}
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
	}

	public void update(Loan bean) {
		// TODO Auto-generated method stub
		
	}

	public void delete(String identifier) {
		// TODO Auto-generated method stub
		
	}

}
