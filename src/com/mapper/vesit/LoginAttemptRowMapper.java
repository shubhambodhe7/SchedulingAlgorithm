package com.mapper.vesit;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dto.vesit.Login;

public class LoginAttemptRowMapper implements RowMapper<Login> {

	@Override
	public Login mapRow(ResultSet rs, int rowSeq) throws SQLException {
		// TODO Auto-generated method stub
		Login login = new Login();
		// login.setEmpLoginAttempts(rs.getInt("login_attempts"));
		return login;
	}

}
