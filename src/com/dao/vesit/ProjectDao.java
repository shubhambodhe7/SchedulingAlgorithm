package com.dao.vesit;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dto.vesit.Sport;
import com.mapper.vesit.SportRowMapper;

@Repository
public class ProjectDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public ProjectDao(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}

	public ProjectDao() {
		// TODO Auto-generated constructor stub
	}

	public JdbcTemplate getjdbcTemplate() {
		return jdbcTemplate;
	}

	public void setjdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	/*
	 * public static Connection getConnection() { Connection c = null; try {
	 * Class.forName("org.postgresql.Driver"); c =
	 * DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres",
	 * "postgres", "root"); } catch (Exception e) { e.printStackTrace(); ;
	 * e.printStackTrace();
	 * 
	 * } System.out.println("Opened database successfully"); return c; }
	 */
	public List<Sport> getAllSports() {
		List<Sport> sportList = new ArrayList<>();
		try {
			return jdbcTemplate.query(
					"SELECT sport_id, sport_name, slot_time, start_ts, current_ts, game_interval FROM sport",
					new SportRowMapper());

		} catch (Exception e) {
			e.printStackTrace();

		}
		return sportList;
	}

}
