package com.dao.vesit;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.Catch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.dto.vesit.Event;
import com.dto.vesit.Login;
import com.dto.vesit.PasswordEncryption;
import com.mapper.vesit.EventRowMapper;
import com.mapper.vesit.LoginRowMapper;

@Component
public class LoginDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public LoginDao() {
		// TODO Auto-generated constructor stub
	}

	public Login loginUser(Login login) throws NoSuchAlgorithmException {
		System.out.println("LoginDao | loginUser");
		// TODO Auto-generated method stub
		String password = login.getUserPassword();
		PasswordEncryption passwordEncrypt = new PasswordEncryption();
		// String hashPassword = passwordEncrypt.passwordEncrypt(password);
		String hashPassword = password;
		System.out.println(password + " : " + hashPassword);
		Login user = null;
		String sql = "SELECT user_id, username, userpassword, rolename, contact  FROM public.logindetails where user_id = ? and userpassword = ?";
		try {
			user = jdbcTemplate.query(sql, new Object[] { Integer.parseInt(login.getUserId()), hashPassword },
					new LoginRowMapper()).get(0);
		} catch (Exception e) {
			e.printStackTrace();
			return new Login("Incorrect credentails.");
		} finally {
			if (null != user) {
				return user;
			}

		}
		return new Login("Incorrect credentails.");

	}

	public List<Login> getAllUsers() {
		return jdbcTemplate.query("Select * from public.logindetails", new LoginRowMapper());

	}

	public List<Login> getAllUsers(String dept) {
		return jdbcTemplate.query("Select * from public.logindetails where dept=?", new Object[] { dept },
				new LoginRowMapper());

	}

	public List<Login> getAllUsers(String dept, int year) {
		return jdbcTemplate.query("Select * from public.logindetails where dept=? and year = ?",
				new Object[] { dept, year }, new LoginRowMapper());

	}

	public List<Login> getEligiblePlayers(int userId) {
		// TODO Auto-generated method stub
		return jdbcTemplate.query("Select * from public.logindetails l order by l.username", new LoginRowMapper());
	}

}
