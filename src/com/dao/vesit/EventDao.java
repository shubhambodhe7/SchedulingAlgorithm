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
		return jdbcTemplate.query("Select * from public.event e order by e.event_name desc ", new EventRowMapper());

	}

	public List<Event> getEventDetails(int eventId) {
		return jdbcTemplate.query("Select * from public.event where event_id = ? ", new Object[] { eventId },
				new EventRowMapper());

	}

	public List<Login> getEligibleEventHeads(int eventId) {
		return jdbcTemplate.query(
				"SELECT l.user_id, username, userpassword, rolename, gender, contact, dept,   year_of_engg  FROM public.logindetails l, public.event_head eh where l.user_id = eh.user_id and event_id = ? order by l.username desc",
				new Object[] { eventId }, new LoginRowMapper());

	}

	public List<Team> getTeamsForEvent(int eventId) {
		List<Map<String, Object>> list = jdbcTemplate.queryForList(
				"SELECT team_id, team_name FROM public.team where event_id = ? order by team_name desc",
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
		return jdbcTemplate.query("select * from public.event e  where e.eventhead = -1 order by e.event_name desc ",
				new EventRowMapper());

	}

	public List<Event> addEvent(Event e) {
		jdbcTemplate.update(
				"INSERT INTO public.event(event_name, gender, parallel_matches, details)  VALUES ( ?, ?, ?, ?)",
				new Object[] { e.getEventName(), e.getGender(), e.getParallelMatches(), e.getDetails() });
		return getAllEvents();

	}

	public int registerAsEventHead(int userId, int eventId) {
		return jdbcTemplate.update("INSERT INTO public.event_head( user_id, event_id)   VALUES ( ?, ?)",
				new Object[] { userId, eventId });

	}

	public boolean checkIfAlreadyRegisteredEventHead(int userId, int eventId) {
		List<Map<String, Object>> list = jdbcTemplate.queryForList(
				"Select * from public.event_head where user_id = ? and event_id=?", new Object[] { userId, eventId });

		// System.out.println("list" + list);
		if (null == list || list.isEmpty()) {
			return false;
		}
		return true;
	}

	public boolean checkIfAlreadyRegisteredForIndEvent(int userId, int eventId) {
		List<Map<String, Object>> list = jdbcTemplate.queryForList(
				"SELECT team_id FROM public.team t,public.player p where p.team_id = t.teamid and p.player_id = ? and t.event_id=?",
				new Object[] { userId, eventId });

		// System.out.println("list" + list);
		if (null == list || list.isEmpty()) {
			return false;
		}
		return true;
	}

	public int registerForIndEvent(int userId, int eventId) {

		return 1;

	}

	public int registerForTeamEvent(Team team, List<Player> pList) {
		List<Map<String, Object>> checklist = jdbcTemplate.queryForList(
				"SELECT t.team_id FROM public.team t where t.team_name = ? and t.event_id=?",
				new Object[] { team.getTeamName(), team.getEventId() });
		System.out.println(checklist);
		if (null != checklist && !checklist.isEmpty()) {
			return -2;
		}
		for (Player p : pList) {
			List<Map<String, Object>> checkplayerlist = jdbcTemplate.queryForList(
					"SELECT p.player_id FROM public.team t ,public.player p where t.team_id = p.team_id and  p.player_id = ? and t.event_id=?",
					new Object[] { p.getPlayerId(), team.getEventId() });
			if (null != checkplayerlist && !checkplayerlist.isEmpty()) {
				return -3;
			}
		}
		int ret = jdbcTemplate.update(
				"INSERT INTO public.team(team_name, dept, year_of_engg, scheduled, event_id)   VALUES ( ?, ?, ?, ?, ?)",
				new Object[] { team.getTeamName(), team.getDept(), team.getYearOfEng(), false, team.getEventId() });

		List<Map<String, Object>> list = jdbcTemplate.queryForList(
				"SELECT t.team_id FROM public.team t where t.team_name = ? and t.event_id=?",
				new Object[] { team.getTeamName(), team.getEventId() });

		if (null == list || list.isEmpty()) {
			return -1;
		}
		System.out.println("list" + list.get(0).get("team_id"));
		int teamId = (int) list.get(0).get("team_id");

		for (Player p : pList) {
			jdbcTemplate.update("INSERT INTO public.player( player_id, team_id)    VALUES (?, ?)",
					new Object[] { p.getPlayerId(), teamId });

		}

		return ret;

	}

	public int assignReferee(int eventId, int userId) {

		return jdbcTemplate.update("UPDATE public.event  SET eventhead= ? WHERE  event_id = ?",
				new Object[] { userId, eventId });

	}

	public int advanceTeam(String round, String eventId, List<Team> teams) {
		int ret = -1;
		for (Team t : teams) {
			System.out.println(round + "  " + eventId + "  " + t.getTeamId() + " :  " + t.getTeamName());
			ret = jdbcTemplate.update("UPDATE public.team set round=?  WHERE team_id = ? and event_id = ?",
					new Object[] { Integer.parseInt(round), t.getTeamId(), Integer.parseInt(eventId) });

		}
		return ret;
	}

}
