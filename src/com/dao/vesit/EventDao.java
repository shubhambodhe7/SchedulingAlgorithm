package com.dao.vesit;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dto.vesit.Event;
import com.dto.vesit.EventWinner;
import com.dto.vesit.Login;
import com.dto.vesit.MainEvent;
import com.dto.vesit.Player;
import com.dto.vesit.PublicHoliday;
import com.dto.vesit.Schedule;
import com.dto.vesit.Team;
import com.mapper.vesit.EventRowMapper;
import com.mapper.vesit.EventWinnerRowMapper;
import com.mapper.vesit.LoginRowMapper;
import com.mapper.vesit.MainEventRowMapper;
import com.mapper.vesit.PublicHolidayRowMapper;
import com.mapper.vesit.ScheduleRowMapper;

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

	public List<Schedule> getSchedule() {
		List<Schedule> list = jdbcTemplate.query(
				"SELECT distinct  s.schedule_id, s.round , g.game_id ,g.start_ts,g.end_ts  , g.event_head_id,e.event_id, e.event_name FROM schedule s,game g,event e where s.game_id =  g.game_id and e.event_id = g.event_id order by g.start_ts",
				new ScheduleRowMapper());
		// fetch teams and event had name.

		for (Schedule s : list) {
			List<Map<String, Object>> qList = jdbcTemplate.queryForList(
					"SELECT distinct gt.team_id,t.team_name FROM gameteammapping gt,team t where t.team_id = gt.team_id and gt.game_id = ? ORDER BY t.team_name",
					new Object[] { s.getGameId() });

			List<Team> teamList = new ArrayList<>();
			for (Map<String, Object> m : qList) {
				Team t = new Team((int) m.get("team_id"), (String) m.get("team_name"));
				teamList.add(t);

			}
			s.setTeams(teamList);
			if (null != s.getEventHead()) {
				LoginDao ld = new LoginDao(jdbcTemplate);
				s.setEventHead(ld.getUser(s.getEventHead()).get(0).getUserName());
			}
		}

		return list;
	}

	public List<EventWinner> getClickedEventWinners(String eventId) {
		return jdbcTemplate.query(
				"select distinct e.event_id, event_name, t.team_name, t.classroom,round,points from event e, team t,logindetails l where t.event_id = e.event_id and l.classroom = t.classroom and e.event_id = ? order by event_name asc, points desc",
				new Object[] { eventId }, new EventWinnerRowMapper());

	}

	public List<EventWinner> getWinners(String userId) {
		return jdbcTemplate.query(
				"select distinct e.event_id, event_name, t.team_name, t.classroom,round,points from event e, team t,logindetails l where t.event_id = e.event_id and l.classroom = t.classroom and l.user_id = ? order by event_name asc, points desc",
				new Object[] { userId }, new EventWinnerRowMapper());

	}

	public List<EventWinner> getMyRegistrations(String userId) {
		return jdbcTemplate.query(
				"select distinct e.event_id,event_name, t.team_name, t.classroom,round,points from event e, team t,player p where t.event_id = e.event_id and p.team_id = t.team_id and p.player_id = ? order by event_name asc",
				new Object[] { userId }, new EventWinnerRowMapper());

	}

	public List<MainEvent> getMainEvents() {
		return jdbcTemplate.query("Select * from mainevent e order by e.main_event_name desc ",
				new MainEventRowMapper());

	}

	public List<Event> getEventDetails(String userId, int eventId) {
		LoginDao ld = new LoginDao(jdbcTemplate);
		String gender = ld.getUser(userId).get(0).getGender();
		return jdbcTemplate.query("Select * from event where event_id = ? and gender = ?",
				new Object[] { eventId, gender }, new EventRowMapper());

	}

	public List<Event> getEventDetailsAsPerUser(String userId) {
		LoginDao ld = new LoginDao(jdbcTemplate);
		String gender = ld.getUser(userId).get(0).getGender();
		return jdbcTemplate.query("Select * from event where gender = ?", new Object[] { gender },
				new EventRowMapper());

	}

	public List<Login> getEligibleEventHeads(int eventId) {
		return jdbcTemplate.query(
				"SELECT l.user_id, username, userpassword, rolename, gender, contact,classroom  FROM logindetails l, event_head eh where l.user_id = eh.user_id and event_id = ? order by l.username desc",
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
		System.out.println(e.getEventType());
		long mainEventId = System.currentTimeMillis();
		jdbcTemplate.update(
				"INSERT INTO `mainevent`(`main_event_id`,`main_event_name`, `main_event_parallel_matches`,`temp_counter`,`slot`) VALUES (?,?,?,?,?)",
				new Object[] { mainEventId, e.getEventName(), e.getParallelMatches(), e.getParallelMatches(), 1 });
		jdbcTemplate.update(
				"INSERT INTO `mainevent`(`main_event_id`,`main_event_name`, `main_event_parallel_matches`,`temp_counter`,`slot`) VALUES (?,?,?,?,?)",
				new Object[] { mainEventId, e.getEventName(), e.getParallelMatches(), e.getParallelMatches(), 2 });
		jdbcTemplate.update(
				"INSERT INTO `mainevent`(`main_event_id`,`main_event_name`, `main_event_parallel_matches`,`temp_counter`,`slot`) VALUES (?,?,?,?,?)",
				new Object[] { mainEventId, e.getEventName(), e.getParallelMatches(), e.getParallelMatches(), 3 });

		/*
		 * List<Map<String, Object>> list = jdbcTemplate.queryForList(
		 * "SELECT main_event_id FROM mainevent WHERE  main_event_name= ? and  main_event_parallel_matches = ?"
		 * , new Object[] { e.getEventName(), e.getParallelMatches() });
		 * 
		 * if (null == list || list.isEmpty()) { return -1; }
		 * System.out.println(list.get(0)); System.out.println("list" +
		 * list.get(0)); mainEventId = (int) list.get(0).get("main_event_id");
		 */
		if (e.getEventType().equalsIgnoreCase("Indoor")) {
			int update = 0;

			jdbcTemplate.update(
					"INSERT INTO event(event_name,main_event_id, gender, event_type, details, max_participate, teams_in_one_match,seed)  VALUES (?,?,?,?,?, ?, ?, ?)",
					new Object[] { e.getEventName() + " Boys", mainEventId, "M", e.getEventType(), e.getDetails(),
							e.getMaxPlayers(), e.getTeamsInOneMatch(), 0 });
			jdbcTemplate.update(
					"INSERT INTO event(event_name,main_event_id, gender, event_type, details, max_participate, teams_in_one_match,seed)  VALUES (?,?,?,?,?, ?, ?,  ?)",
					new Object[] { e.getEventName() + " Girls", mainEventId, "F", e.getEventType(), e.getDetails(),
							e.getMaxPlayers(), e.getTeamsInOneMatch(), 0 });
			jdbcTemplate.update(
					"INSERT INTO event(event_name,main_event_id, gender, event_type, details, max_participate, teams_in_one_match,seed)  VALUES (?,?,?,?,?, ?, ?, ?)",
					new Object[] { e.getEventName() + " Boys Seed 1", mainEventId, "M", e.getEventType(),
							e.getDetails(), 1, e.getTeamsInOneMatch(), 1 });
			jdbcTemplate.update(
					"INSERT INTO event(event_name,main_event_id, gender, event_type, details, max_participate, teams_in_one_match,seed)  VALUES (?,?,?,?,?, ?, ?, ?)",
					new Object[] { e.getEventName() + " Boys Seed 2", mainEventId, "M", e.getEventType(),
							e.getDetails(), 1, e.getTeamsInOneMatch(), 1 });
			jdbcTemplate.update(
					"INSERT INTO event(event_name,main_event_id, gender, event_type, details, max_participate, teams_in_one_match,seed)  VALUES (?,?,?,?,?, ?, ?,  ?)",
					new Object[] { e.getEventName() + " Girls Seed 1", mainEventId, "F", e.getEventType(),
							e.getDetails(), 1, e.getTeamsInOneMatch(), 2 });
			jdbcTemplate.update(
					"INSERT INTO event(event_name,main_event_id, gender, event_type, details, max_participate, teams_in_one_match,seed)  VALUES (?,?,?,?,?, ?, ?, ?)",
					new Object[] { e.getEventName() + " Girls Seed 2", mainEventId, "F", e.getEventType(),
							e.getDetails(), 1, e.getTeamsInOneMatch(), 2 });

			// enter in master events

			return update;
		} else {
			return jdbcTemplate.update(
					"INSERT INTO event(event_name,main_event_id, gender, event_type, details, max_participate,  teams_in_one_match,seed)  VALUES (?,?,?,?, ?, ?, ?, ?)",
					new Object[] { e.getEventName(), mainEventId, e.getGender(), "Outdoor", e.getDetails(),
							e.getMaxPlayers(), e.getTeamsInOneMatch(), 0 });
		}

	}

	public int registerAsEventHead(String userId, int eventId) {
		return jdbcTemplate.update("INSERT INTO event_head( user_id, event_id)   VALUES ( ?, ?)",
				new Object[] { userId, eventId });

	}

	public boolean checkIfTeamAlreadyRegistered(String userId, int eventId) {

		LoginDao ld = new LoginDao(jdbcTemplate);
		String classroom = ld.getUser(userId).get(0).getClassroom();

		List<Map<String, Object>> checklist = jdbcTemplate.queryForList(
				"SELECT t.team_id FROM team t where t.classroom = ? and t.event_id=?",
				new Object[] { classroom, eventId });
		System.out.println(checklist);
		if (null != checklist && !checklist.isEmpty()) {
			System.out.println(checklist);
			return true;
		}
		return false;
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

	public boolean checkIfClassAlreadyRegisteredForIndEvent(String userId, int eventId) {
		List<Map<String, Object>> list = jdbcTemplate.queryForList(
				"SELECT t.team_id FROM logindetails l ,team t,player p WHERE p.team_id = t.team_id and l.classroom = t.classroom and l.user_id = ? and t.event_id = ? ",
				new Object[] { userId, eventId });

		// System.out.println("list" + list);
		if (null == list || list.isEmpty()) {
			return false;
		}
		return true;
	}

	// SELECT t.team_id,e.seed FROM team t , event e where t.event_id =
	// e.event_id
	public int registerForIndEvent(String userId, int eventId) {

		if (checkIfAlreadyRegisteredForIndEvent(userId, eventId)) {
			return -1;
		}
		if (checkIfClassAlreadyRegisteredForIndEvent(userId, eventId)) {
			return -2;
		}
		// other seed
		Event event = getEventDetails(userId, eventId).get(0);
		int otherSeedEventId = 0;
		if ("1".equals(event.getEventName().substring(event.getEventName().length() - 1))) {
			otherSeedEventId = eventId + 1;
		} else {
			otherSeedEventId = eventId - 1;
		}
		if (checkIfAlreadyRegisteredForIndEvent(userId, otherSeedEventId)) {
			return -3;
		}
		LoginDao dao = new LoginDao(jdbcTemplate);
		Login l = dao.getUser(userId).get(0);
		int ret = jdbcTemplate.update(
				"INSERT INTO team(team_name,classroom, scheduled, event_id)   VALUES ( ?,  ?, ?, ?)",
				new Object[] { l.getUserName(), l.getClassroom(), false, eventId });

		List<Map<String, Object>> list = jdbcTemplate.queryForList(
				"SELECT t.team_id FROM team t where t.team_name = ? and t.event_id=?",
				new Object[] { l.getUserName(), eventId });

		if (null == list || list.isEmpty()) {
			System.out.println(list);

			return -1;
		}
		System.out.println("list" + list.get(0).get("team_id"));
		int teamId = (int) list.get(0).get("team_id");

		jdbcTemplate.update("INSERT INTO player( player_id, team_id)    VALUES (?, ?)",
				new Object[] { userId, teamId });

		return ret;

	}

	public int unregisterForIndEvent(String userId, int eventId) {

		List<Map<String, Object>> list = jdbcTemplate.queryForList(
				"SELECT t.team_id FROM player p,team t where  p.team_id = t.team_id and p.player_id= ? and t.event_id = ?",
				new Object[] { userId, eventId });

		if (null == list || list.isEmpty()) {
			System.out.println(list);

			return -1;
		}
		System.out.println("list" + list.get(0).get("team_id"));
		int teamId = (int) list.get(0).get("team_id");

		jdbcTemplate.update("Delete from player where team_id = ?", new Object[] { teamId });
		int ret = jdbcTemplate.update("Delete from team where team_id = ?", new Object[] { teamId });

		return ret;

	}

	public int registerForTeamEvent(Team team, List<Player> pList) {

		List<Map<String, Object>> checklist = jdbcTemplate.queryForList(
				"SELECT t.team_id FROM team t where t.classroom = ? and t.event_id=?",
				new Object[] { team.getClassroom(), team.getEventId() });
		System.out.println(checklist);
		if (null != checklist && !checklist.isEmpty()) {
			System.out.println(checklist);
			return -2;
		}

		int ret = jdbcTemplate.update(
				"INSERT INTO team(team_name, classroom, scheduled, event_id)   VALUES ( ?,  ?, ?, ?)",
				new Object[] { team.getTeamName(), team.getClassroom(), false, team.getEventId() });

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

	public int assignReferee(int eventId, String userId, int gameId) {
		return jdbcTemplate.update("UPDATE game  SET event_head_id= ? WHERE  event_id = ? and game_id = ?",
				new Object[] { userId, eventId, gameId });

	}

	public int deleteEvent(int eventId) {

		return jdbcTemplate.update("DELETE FROM event WHERE  event_id = ?", new Object[] { eventId });

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

	public List<PublicHoliday> getPublicHoliday() {
		return jdbcTemplate.query("SELECT * FROM `publicholiday` order by date", new PublicHolidayRowMapper());

	}

	public int addPublicHoliday(String date, String occasion) {
		return jdbcTemplate.update("INSERT INTO publicholiday (date, occasion) VALUES (?,?)",
				new Object[] { new Timestamp(new Date(date).getTime()), occasion });
	}

	public int deletePublicHoliday(int rowId) {

		return jdbcTemplate.update("DELETE FROM publicholiday WHERE  rowid = ?", new Object[] { rowId });

	}

	public int generateSchedule(String date, String round) {

		return ScheduleGeneration.runMain(new Timestamp(new Date(date).getTime()), round);

	}

	public List<Map<String, Object>> getAllClassScore() {

		return jdbcTemplate.queryForList(
				"SELECT  `classroom`, sum(`points`) as points FROM `team` group by `classroom` order by sum(`points`) desc");

	}
}
