package com.project.vesit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.dto.vesit.Event;
import com.dto.vesit.Login;
import com.dto.vesit.PasswordEncryption;

public class SetPassword {

	public static void main(String args[]) {

		setPassword();
	}

	public static Connection getConnection() {
		Connection c = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			c = DriverManager.getConnection("jdbc:mysql://localhost:3306/vesit", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();

		}
		System.out.println("Opened database successfully");
		return c;
	}

	public static void setPassword() {

		Connection c = null;
		PreparedStatement stmt = null;
		// List<Team> teamList = new ArrayList<>();
		String userId = null, contact = null;
		PasswordEncryption passwordEncrypt = new PasswordEncryption();
		try {
			c = getConnection();

			stmt = c.prepareStatement("SELECT user_id, contact, classroom FROM logindetails");
			List<Login> list = new ArrayList<>();
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Login l = null;
				userId = rs.getString(1);
				contact = rs.getString(2);
				String hashPassword = passwordEncrypt.passwordEncrypt(userId + "@" + contact);
				l = new Login(userId, hashPassword, contact);
				list.add(l);

			}

			for (Login l : list) {
				stmt = c.prepareStatement("Update  logindetails SET userpassword = ? where user_id = ?");
				stmt.setString(1, l.getUserPassword());
				stmt.setString(2, l.getUserId());
				stmt.executeUpdate();
			}
			rs.close();
			stmt.close();
			c.close();
			System.out.println("Passwords set successfully");

		} catch (Exception ex) {
			ex.printStackTrace();

		}

	}

}
