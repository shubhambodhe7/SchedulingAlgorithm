package com.project.vesit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Random;

import com.dto.vesit.Event;
import com.dto.vesit.Game;
import com.dto.vesit.Player;
import com.dto.vesit.Team;

public class MainDBNew {

	public static final int NO_OF_ITERATION = 1;

	public static void main(String areg[]) {
		/*----- */

		clearDB();
		List<Event> events = getAllEvents();
		System.out.println("::::::::::::::::" + events);
		System.out.println();

		int loop = 0;
		while (loop < NO_OF_ITERATION) {
			++loop;
			System.out.println("loop  : " + loop);
			long schedule_index = System.currentTimeMillis();
			List<Game> games = new ArrayList<>();

			Collections.shuffle(events);

			Iterator<Event> i = events.iterator();

			while (i.hasNext()) {
				Event e = i.next();
				resetTeamScheduleFlag();
				System.out.println(e.getEventName());
				while (!e.schedulingCmplt()) {
					ListIterator<Team> itr = e.getTeams().listIterator();

					// int index = 0;
					List<Team> selectedTeams = new ArrayList<Team>();
					while (itr.hasNext()) {
						boolean conflict = false;
						Team t = itr.next();
						Iterator<Player> playItr = t.getPlayers().iterator();

						// while (playItr.hasNext()) {
						while (playItr.hasNext() && !t.isScheduled()) {

							Player p = playItr.next();
							System.out.print(p.getPlayerName() + " : ");

							Random rand = new Random();
							conflict = checkConflict(p, new Timestamp(System.currentTimeMillis()),
									new Timestamp(System.currentTimeMillis()));

							int n = rand.nextInt(5) + 1;
							if (conflict) {
								break;
							}
							/*
							 * if (n == 1) { conflict = true;
							 * System.out.println("conflict!!"); break; } else
							 * conflict = false;
							 */
						}

						if (!conflict && !t.isScheduled()) {
							selectedTeams.add(t);
						} else {
							continue;

						}

						if (selectedTeams.size() == e.getTeamsInOneMatch()
								&& null != selectedTeams.get(e.getTeamsInOneMatch() - 1)) {
							System.out.println(selectedTeams);

							saveGames(selectedTeams, e.getEventId(), new Timestamp(System.currentTimeMillis()),
									new Timestamp(System.currentTimeMillis() + 60 * 60 * 1000), schedule_index);

							for (Team team : selectedTeams) {
								team.setScheduled(true);

							}
							selectedTeams.clear();

						}

					}

					// System.out.println(e.getSportName());

					// System.out.println(games);

				}
				// e.setGames(games);
			}

			/*
			 * for (Event e : events) {
			 * 
			 * System.out.println(e.getEventName());
			 * System.out.println("--------"); }
			 */
		}

		// getScheduleCost();

	}

	private static void resetTeamScheduleFlag() {
		// TODO Auto-generated method stub
		System.out.println("MainDB | resetTeamScheduleFlag starts");
		Connection c = null;
		PreparedStatement stmt = null;
		// List<Team> teamList = new ArrayList<>();
		try {
			c = getConnection();

			stmt = c.prepareStatement("UPDATE team   SET scheduled=false ");

			stmt.close();
			c.close();

		} catch (Exception ex) {
			ex.printStackTrace();

		}

		System.out.println("MainDB | resetTeamScheduleFlag starts");

	}

	public static void addSchedule(long index, int gameId) {
		System.out.println("MainDB | addSchedule start");
		Connection c = null;
		PreparedStatement stmt = null;
		try {
			c = getConnection();
			System.out.println("Opened database successfully");
			stmt = c.prepareStatement("INSERT INTO schedule(  schedule_id, game_id)    VALUES (?, ?) ");
			stmt.setLong(1, index);
			stmt.setInt(2, gameId);

			stmt.executeUpdate();

			stmt.close();
			c.close();
		} catch (Exception e) {
			e.printStackTrace();

		}
		System.out.println("Operation done successfully");
		System.out.println("Games Stored");
		System.out.println("MainDB | addSchedule ends");

	}

	public static Connection getConnection() {
		Connection c = null;
		try {
			Class.forName("org.postgresql.Driver");
			c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "root");
		} catch (Exception e) {
			e.printStackTrace();

		}
		System.out.println("Opened database successfully");
		return c;
	}

	public static Timestamp getSchedule(Event e) {

		System.out.println("MainDB | checkConflict starts");
		Timestamp t = null;
		long interval = 0;
		Connection c = null;
		PreparedStatement stmt = null;
		// List<Team> teamList = new ArrayList<>();
		try {
			c = getConnection();

			stmt = c.prepareStatement("select e.current_ts,e.game_interval from  sport e where e.sport_id = ?");
			stmt.setInt(1, e.getEventId());
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				t = rs.getTimestamp(1);
				interval = rs.getLong(2);
			}

			stmt = c.prepareStatement("Update  sport e SET e.current_ts = ? where e.sport_id = ?");

			// check here
			/*
			 * stmt.setTimestamp(1, new Timestamp((t.getTime() + e.getSlotTime()
			 * + interval))); stmt.setInt(2, e.getSportId());
			 */
			// check ends
			rs.close();
			stmt.close();
			c.close();

		} catch (Exception ex) {
			ex.printStackTrace();

		}

		System.out.println("MainDB | checkConflict starts");
		return t;

	}

	public static String getTimeStr(Timestamp ts) {
		Date date = new Date();
		date.setTime(ts.getTime());
		String formattedDate = new SimpleDateFormat("dd-MM-yyyy hh:mm a").format(date);
		return formattedDate;
	}

	public static List<Event> getAllEvents() {

		System.out.println("MainDB | getAllEvents start");
		Connection c = null;
		Statement stmt = null;
		List<Event> sportList = new ArrayList<>();
		try {
			c = getConnection();

			stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery(
					"SELECT event_id, event_name, gender, parallel_matches, details, max_participate, max_team, teams_in_one_match, eventhead FROM event");
			while (rs.next()) {

				Event e = new Event(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9));
				// System.out.println(e);
				sportList.add(e);
			}
			rs.close();
			stmt.close();
			c.close();
			for (Event e : sportList) {
				e.setTeams(getTeams(e));
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		System.out.println("MainDB | getAllEvents ends");
		return sportList;
	}

	public static List<Team> getTeams(Event event) {

		System.out.println("MainDB | getTeams start");
		Connection c = null;
		PreparedStatement stmt = null;
		List<Team> teamList = new ArrayList<>();
		try {
			c = getConnection();

			stmt = c.prepareStatement("SELECT * FROM team t where t.event_id = ?");
			stmt.setInt(1, event.getEventId());
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Team t = new Team(rs.getInt(1), rs.getString(2), rs.getBoolean(3), rs.getInt(4), 0);
				// System.out.println(t);
				teamList.add(t);
			}
			rs.close();
			stmt.close();
			c.close();

			for (Team t : teamList) {
				t.setPlayers(getPlayers(t));
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		System.out.println("MainDB | getTeams ends");
		return teamList;
	}

	public static List<Player> getPlayers(Team t) {
		System.out.println("MainDB | getPlayers start");

		Connection c = null;
		PreparedStatement stmt = null;
		List<Player> playerList = new ArrayList<>();
		try {
			c = getConnection();

			stmt = c.prepareStatement(
					"SELECT player_id, username FROM player p,logindetails l where p.player_id = l.user_id and p.team_id = ?");
			stmt.setInt(1, t.getTeamId());
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Player p = new Player(rs.getInt(1), rs.getString(2));
				// System.out.println(t);
				playerList.add(p);
			}
			rs.close();
			stmt.close();
			c.close();
		} catch (Exception e) {
			e.printStackTrace();

		}

		System.out.println("MainDB | getPlayers ends");
		return playerList;
	}

	private static void saveGames(List<Team> teams, int eventId, Timestamp st, Timestamp et, long schedule_index) {
		System.out.println("MainDB | saveGames start");
		// schdeule true
		// game save
		Connection c = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		int gameId = 0;
		try {
			c = getConnection();
			stmt = c.prepareStatement("INSERT INTO game( start_ts, end_ts, event_id) VALUES (?, ?, ?)");
			stmt.setTimestamp(1, st);
			stmt.setTimestamp(2, et);
			stmt.setInt(3, eventId);

			stmt.executeUpdate();

			stmt = c.prepareStatement(
					"SELECT game_id  FROM game where start_ts = ? and end_ts =? and event_id = ? order by game_id desc");
			stmt.setTimestamp(1, st);
			stmt.setTimestamp(2, et);
			stmt.setInt(3, eventId);

			rs = stmt.executeQuery();
			while (rs.next()) {
				gameId = rs.getInt(1);
				break;
			}

			for (Team t : teams) {
				stmt = c.prepareStatement(
						"INSERT INTO gameteammapping(game_id, team_id,schedule_id)   VALUES (?,?, ?)");
				stmt.setLong(1, gameId);
				stmt.setInt(2, t.getTeamId());
				stmt.setLong(3, schedule_index);
				stmt.executeUpdate();
				///

				// chekc here put schedle id check
				stmt = c.prepareStatement("UPDATE team  SET  scheduled = true WHERE team_id =?");
				stmt.setLong(1, t.getTeamId());
				stmt.executeUpdate();

			}

			stmt = c.prepareStatement("INSERT INTO schedule(schedule_id, game_id)   VALUES (?, ?)");
			stmt.setLong(1, schedule_index);
			stmt.setInt(2, gameId);

			stmt.executeUpdate();

			rs.close();
			stmt.close();

			c.close();

		} catch (Exception e) {
			e.printStackTrace();

		}

		System.out.println("MainDB | saveGames ends");

	}

	public static boolean checkConflict(Player p, Timestamp st, Timestamp et) {
		System.out.println("MainDB | checkConflict starts");

		Connection c = null;
		PreparedStatement stmt = null; // List<Team>
		// teamList = new ArrayList<>();
		try {
			c = getConnection();

			stmt = c.prepareStatement(
					"select g.game_id from game g where (g.start_ts <  ? and g.end_ts > ? ) or ( g.start_ts < ? and g.end_ts > ? ) and  g.game_id IN( select gt.game_id from gameteammapping gt, player p where gt.team_id=p.team_id and p.player_id = ? )");
			stmt.setTimestamp(1, st);
			stmt.setTimestamp(2, st);
			stmt.setTimestamp(3, et);
			stmt.setTimestamp(4, et);
			stmt.setInt(5, p.getPlayerId());
			ResultSet rs = stmt.executeQuery();
			if (rs.getRow() > 1) {
				return true;
			}
			rs.close();
			stmt.close();
			c.close();

		} catch (Exception e) {
			e.printStackTrace();

		}

		System.out.println("MainDB | checkConflict ends");
		return false;

	}

	public static void getScheduleCost() {
		System.out.println("MainDB | geScheduleCost start");

		Connection c = null;
		PreparedStatement stmt = null;
		// List<Player> playerList = new ArrayList<>();
		long minSchCost = Long.MAX_VALUE;
		long minSchId = 0;
		try {
			c = getConnection();

			stmt = c.prepareStatement(
					"SELECT distinct e.schedule_id, MAX(g.end_ts) - MIN(g.start_ts)   FROM schedule e, game g   group by e.schedule_id;");

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				System.out.println(rs.getTime(2));
				if (rs.getTimestamp(2).getTime() < minSchCost) {
					minSchId = rs.getLong(1);
					minSchCost = rs.getTimestamp(2).getTime();

				}

			}

			stmt = c.prepareStatement("delete  FROM schedule e where e.schedule_id != ? ");
			stmt.setLong(1, minSchId);
			stmt.executeUpdate();

			stmt = c.prepareStatement(
					" delete from game g where g.game_id  NOT IN  (select e.game_id FROM schedule e where e.schedule_id = ?)");
			stmt.setLong(1, minSchId);
			stmt.executeUpdate();

			rs.close();
			stmt.close();
			c.close();
		} catch (Exception e) {
			e.printStackTrace();

		}
		System.out.println("Min Sch id and cost" + minSchCost + " : " + minSchId);

		System.out.println("MainDB | geScheduleCost ends");
	}

	public static void clearDB() {
		System.out.println("MainDB | clearDB start");

		Connection c = null;
		PreparedStatement stmt = null;
		try {
			c = getConnection();

			stmt = c.prepareStatement("delete  FROM schedule e");
			stmt.executeUpdate();

			stmt = c.prepareStatement("delete  FROM gameteammapping g");
			stmt.executeUpdate();

			stmt = c.prepareStatement("delete  FROM game g");
			stmt.executeUpdate();

			stmt.close();
			c.close();
		} catch (Exception e) {
			e.printStackTrace();

		}

		System.out.println("MainDB | clearDB ends");
	}

}
