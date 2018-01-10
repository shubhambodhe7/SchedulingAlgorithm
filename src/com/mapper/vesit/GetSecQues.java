package com.mapper.vesit;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dto.vesit.Login;

public class GetSecQues implements RowMapper<Login> {

	@Override
	public Login mapRow(ResultSet rs, int rowSeq) throws SQLException {
		Login user = new Login();
		user.setUserId(rs.getString("user_id"));
		user.setUserName(rs.getString("username"));
		user.setUserPassword(rs.getString("userpassword"));
		user.setRoleName(rs.getString("rolename"));
		user.setContact(rs.getString("contact"));

		return user;
	}
}
