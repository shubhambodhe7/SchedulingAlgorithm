package com.dao.vesit;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dto.vesit.Event;
import com.dto.vesit.Login;
import com.dto.vesit.Player;
import com.dto.vesit.Team;
import com.mapper.vesit.EventRowMapper;
import com.mapper.vesit.LoginRowMapper;

@Repository
public class EventDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getjdbcTemplate() {
		return jdbcTemplate;
	}

	public void setjdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public EventDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EventDao(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<Event> getAllEvents() {
		return jdbcTemplate.query("Select * from event e order by e.event_name desc ", new EventRowMapper());

	}

	public List<Event> getEventDetails(String userId, int eventId) {
		LoginDao ld = new LoginDao(jdbcTemplate);
		String gender = ld.getUser(userId).get(0).getGender();
		return jdbcTemplate.query("Select * from event where event_id = ? and gender = ?",
				new Object[] { eventId, gender }, new EventRowMapper());

	}

	public List<Login> getEligibleEventHeads(int eventId) {
		return jdbcTemplate.query(
				"SELECT l.user_id, username, userpassword, rolename, gender, contact, dept,   year_of_engg  FROM logindetails l, event_head eh where l.user_id = eh.user_id and event_id = ? order by l.username desc",
				new Object[] { eventId }, new LoginRowMapper());

	}

	public List<Team> getTeamsForEvent(int eventId) {
		List<Map<String, Object>> list = jdbcTemplate.queryForList(
				"SELECT team_id, team_name FROM team where event_id = ? order by team_name desc",
				new Object[] { eventId });
		System.out.println(list);
		List<Team> teamList = new ArrayList<>();
		for (Map<String, Object> m : list) {
			Team t = new Team((int) m.get("team_id"), (String) m.get("team_name"));
			teamList.add(t);
			System.out.println("m :: " + m);
		}
		return teamList;

	}

	public List<Event> getPendingEventsForRefreeAssignment() {
		return jdbcTemplate.query("select * from event e  where e.eventhead = 'none' order by e.event_name desc ",
				new EventRowMapper());

	}

	public int addEvent(Event e) {

		return jdbcTemplate.update(
				"INSERT INTO event(event_name, gender, event_type,parallel_matches, details, max_participate, max_team, teams_in_one_match)  VALUES (?,?,?,?, ?, ?, ?, ?)",
				new Object[] { e.getEventName(), e.getGender(), e.getEventType(), e.getParallelMatches(),
						e.getDetails(), e.getMaxPlayers(), e.getMaxTeams(), e.getTeamsInOneMatch() });

	}

	public int registerAsEventHead(String userId, int eventId) {
		return jdbcTemplate.update("INSERT INTO event_head( user_id, event_id)   VALUES ( ?, ?)",
				new Object[] { userId, eventId });

	}

	public boolean checkIfAlreadyRegisteredEventHead(String userId, int eventId) {
		List<Map<String, Object>> list = jdbcTemplate.queryForList(
				"Select * from event_head where user_id = ? and event_id=?", new Object[] { userId, eventId });

		// System.out.println("list" + list);
		if (null == list || list.isEmpty()) {
			return false;
		}
		return true;
	}

	public boolean checkIfAlreadyRegisteredForIndEvent(String userId, int eventId) {
		List<Map<String, Object>> list = jdbcTemplate.queryForList(
				"SELECT t.team_id FROM team t,player p where p.team_id = t.team_id and p.player_id = ? and t.event_id=?",
				new Object[] { userId, eventId });

		// System.out.println("list" + list);
		if (null == list || list.isEmpty()) {
			return false;
		}
		return true;
	}

	public int registerForIndEvent(String userId, int eventId) {
		LoginDao dao = new LoginDao(jdbcTemplate);
		Login l = dao.getUser(userId).get(0);
		int ret = jdbcTemplate.update(
				"INSERT INTO team(team_name,classroom, scheduled, event_id)   VALUES ( ?,  ?, ?, ?)",
				new Object[] { l.getUserName(), l.getClassroom(), false, eventId });

		List<Map<String, Object>> list = jdbcTemplate.queryForList(
				"SELECT t.team_id FROM team t where t.team_name = ? and t.event_id=?",
				new Object[] { l.getUserName(), eventId });

		if (null == list || list.isEmpty()) {
			return -1;
		}
		System.out.println("list" + list.get(0).get("team_id"));
		int teamId = (int) list.get(0).get("team_id");

		jdbcTemplate.update("INSERT INTO player( player_id, team_id)    VALUES (?, ?)",
				new Object[] { userId, teamId });

		return ret;

	}

	public int registerForTeamEvent(Team team, List<Player> pList) {
		List<Map<String, Object>> checklist = jdbcTemplate.queryForList(
				"SELECT t.team_id FROM team t where t.team_name = ? and t.event_id=?",
				new Object[] { team.getTeamName(), team.getEventId() });
		System.out.println(checklist);
		if (null != checklist && !checklist.isEmpty()) {
			return -2;
		}

		for (Player p : pList) {

			List<Map<String, Object>> checkplayerlist = jdbcTemplate.queryForList(
					"SELECT p.player_id FROM team t ,player p where t.team_id = p.team_id and  p.player_id = ? and t.event_id=?",
					new Object[] { p.getPlayerId(), team.getEventId() });
			if (null != checkplayerlist && !checkplayerlist.isEmpty()) {
				return -3;
			}
		}
		int ret = jdbcTemplate.update(
				"INSERT INTO team(team_name, dept, year_of_engg, scheduled, event_id)   VALUES ( ?, ?, ?, ?, ?)",
				new Object[] { team.getTeamName(), team.getDept(), team.getYearOfEng(), false, team.getEventId() });

		List<Map<String, Object>> list = jdbcTemplate.queryForList(
				"SELECT t.team_id FROM team t where t.team_name = ? and t.event_id=?",
				new Object[] { team.getTeamName(), team.getEventId() });

		if (null == list || list.isEmpty()) {
			return -1;
		}
		System.out.println("list" + list.get(0).get("team_id"));
		int teamId = (int) list.get(0).get("team_id");

		for (Player p : pList) {
			jdbcTemplate.update("INSERT INTO player( player_id, team_id)    VALUES (?, ?)",
					new Object[] { p.getPlayerId(), teamId });

		}

		return ret;

	}

	public int assignReferee(int eventId, int userId) {

		return jdbcTemplate.update("UPDATE event  SET eventhead= ? WHERE  event_id = ?",
				new Object[] { userId, eventId });

	}

	public int advanceTeam(String round, String eventId, List<Team> teams) {
		int ret = -1;
		int points = 0;
		if (round.equalsIgnoreCase("Final Winner")) {
			points = 10;
		} else if (round.equalsIgnoreCase("Finalists")) {
			points = 8;
		} else if (round.equalsIgnoreCase("Semi Finalists")) {
			points = 6;
		} else if (round.equalsIgnoreCase("Quarter Finalists")) {
			points = 4;
		} else if (round.equalsIgnoreCase("Pre quarter finalists")) {
			points = 2;
		} else if (round.equalsIgnoreCase("Participated")) {
			points = 1;
		}
		System.out.println("points : " + points);
		for (Team t : teams) {
			System.out.println(round + "  " + eventId + "  " + t.getTeamId() + " :  " + t.getTeamName());
			ret = jdbcTemplate.update("UPDATE team set round=?, points= ?  WHERE team_id = ? and event_id = ?",
					new Object[] { round, points, t.getTeamId(), Integer.parseInt(eventId) });

		}
		return ret;
	}

}
