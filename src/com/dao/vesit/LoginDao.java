package com.dao.vesit;

import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import org.apache.jasper.tagplugins.jstl.core.Catch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
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
	PasswordEncryption passwordEncrypt = new PasswordEncryption();

	public LoginDao() {
		// TODO Auto-generated constructor stub
	}

	public LoginDao(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}

	public Login loginUser(Login login) throws NoSuchAlgorithmException {
		System.out.println("LoginDao | loginUser");
		// TODO Auto-generated method stub
		String password = login.getUserPassword();
		PasswordEncryption passwordEncrypt = new PasswordEncryption();
		String hashPassword = passwordEncrypt.passwordEncrypt(password);
		// String hashPassword = password;
		System.out.println(password + " : " + hashPassword);
		Login user = null;
		String sql = "SELECT user_id, username, gender, rolename, contact,classroom  FROM logindetails where user_id = ? and userpassword = ?";
		try {
			user = jdbcTemplate.query(sql, new Object[] { login.getUserId(), hashPassword }, new LoginRowMapper())
					.get(0);
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

	public int changePass(Login login) throws NoSuchAlgorithmException {

		System.out.println("change dao");
		String oldPassword = login.getUserPassword();
		PasswordEncryption passwordEncrypt = new PasswordEncryption();
		String hashOldPassword = passwordEncrypt.passwordEncrypt(oldPassword);
		String newPassword = login.getChangedPassword();
		String hashNewPassword = passwordEncrypt.passwordEncrypt(newPassword);
		int rowAffected = jdbcTemplate.update(
				"UPDATE logindetails SET userpassword=? WHERE user_id = ? and userpassword = ?",
				new Object[] { hashNewPassword, login.getUserId(), hashOldPassword });
		System.out.println(" rowAffected" + rowAffected);
		return rowAffected;
	}

	public List<Login> getAllUsers() {
		return jdbcTemplate.query("Select user_id, username, gender, rolename, contact,classroom from logindetails",
				new LoginRowMapper());

	}

	// where user_id=?", new Object[] { userId }
	public List<Login> getUser(String userId) {
		System.out.println(userId);
		return jdbcTemplate.query(
				"Select user_id, username, gender, rolename, contact,classroom from logindetails where user_id = ?",
				new Object[] { userId }, new LoginRowMapper());

	}

	public List<Login> getAllUsers(String classroom) {
		return jdbcTemplate.query(
				"Select user_id, username, gender, rolename, contact,classroom from logindetails where classroom=?",
				new Object[] { classroom }, new LoginRowMapper());

	}

	public int signupUser(Login l) {
		List<Map<String, Object>> list = jdbcTemplate.queryForList("Select * from logindetails where  user_id = ?",
				new Object[] { l.getUserId() });

		// System.out.println("list" + list);
		if (null == list || list.isEmpty()) {
			try {
				return jdbcTemplate.update(
						"INSERT INTO logindetails(user_id, username, userpassword, rolename, gender, contact, dept,year_of_engg) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
						new Object[] { l.getUserId(), l.getUserName(),
								passwordEncrypt.passwordEncrypt(l.getUserPassword()), l.getRoleName(), l.getGender(),
								l.getContact(), l.getDept(), l.getYearOfEng() });
			} catch (DataAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return -1;
	}

	public List<Login> getEligiblePlayers(String userId) {
		// TODO Auto-generated method stub
		System.out.println("userId : " + userId);
		List<Login> userDetails = jdbcTemplate.query(
				"Select user_id, username, gender, rolename, contact,classroom from logindetails l where user_id = ? order by username desc ",
				new Object[] { userId }, new LoginRowMapper());

		return getAllUsers(userDetails.get(0).getClassroom());
	}

}
