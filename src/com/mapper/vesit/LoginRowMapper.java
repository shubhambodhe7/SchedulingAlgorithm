package com.mapper.vesit;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dto.vesit.Login;

public class LoginRowMapper implements RowMapper<Login> {

	@Override
	public Login mapRow(ResultSet rs, int rowSeq) throws SQLException {
		// TODO Auto-generated method stub
		Login user = new Login();

		user.setUserId(rs.getString("user_id"));
		user.setUserName(rs.getString("username"));
		user.setUserPassword("");
		user.setChangedPassword("");
		user.setRoleName(rs.getString("rolename"));
		user.setContact(rs.getString("contact"));
		user.setGender(rs.getString("gender"));
		user.setClassroom(rs.getString("classroom"));
		return user;
	}

}
