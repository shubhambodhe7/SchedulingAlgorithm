package com.dao.vesit;

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

import org.joda.time.DateTime;

import com.dto.vesit.Event;
import com.dto.vesit.Game;
import com.dto.vesit.Player;
import com.dto.vesit.PublicHoliday;
import com.dto.vesit.Team;

public class ScheduleGeneration {
	// hange resetdate
	public static final int NO_OF_ITERATION = 1;
	static int seed = 0;
	static int slot = 0;
	static Timestamp startTime = new Timestamp(
			new DateTime().toDateMidnight().toDateTime().plusDays(1).plusHours(15).getMillis());
	static String round = "registered";
	static List<PublicHoliday> holidays = new ArrayList<>();

	public static void runMain(String date, String round) {
		/*----- */
		// startTime = new TimeStamp()
		System.out.println(date);
		clearDB();

		int loop = 0;
		while (loop < NO_OF_ITERATION) {
			++loop;
			List<Event> events = getAllEvents();
			System.out.println("::::::::::::::::" + events);

			System.out.println("loop  : " + loop);
			long schedule_index = System.currentTimeMillis();
			resetTeamScheduleFlag();

			Collections.shuffle(events);

			Iterator<Event> i = events.iterator();

			while (i.hasNext()) {
				Event e = i.next();
				resetStartTime(date);

				System.out.println("Event Name : " + e.getEventName());
				int numConflicts = 0;
				while (!e.schedulingCmplt() && remainingTeams(e, round) >= e.getTeamsInOneMatch()) {
					seed = e.getSeed();
					ListIterator<Team> itr = e.getTeams().listIterator();

					List<Team> selectedTeams = new ArrayList<Team>();

					while (itr.hasNext()) {
						if (remainingTeams(e, round) < e.getTeamsInOneMatch()) {
							break;
						}

						if (numConflicts > (remainingTeams(e, round) - e.getTeamsInOneMatch() - 1)) {
							getSchedule(e, true);
						}
						boolean conflict = false;
						Team t = itr.next();
						System.out.println("Team Name : " + t.getTeamName());
						Iterator<Player> playItr = t.getPlayers().iterator();

						// while (playItr.hasNext()) {
						while (playItr.hasNext() && !t.isScheduled()) {

							Player p = playItr.next();
							System.out.print(p.getPlayerName() + " : ");

							Random rand = new Random();
							conflict = checkConflict(p, getSchedule(e, false),
									new Timestamp(getSchedule(e, false).getTime() + 1000 * 60 * 60));

							int n = rand.nextInt(5) + 1;
							if (conflict) {
								numConflicts++;
								System.out.println("conflict : " + numConflicts);
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

							saveGames(selectedTeams, e.getEventId(), getSchedule(e, false),
									new Timestamp(getSchedule(e, false).getTime() + 1000 * 60 * 60), schedule_index);

							for (Team team : selectedTeams) {
								team.setScheduled(true);

							}
							selectedTeams.clear();
							getSchedule(e, true);

						}

					}
					if (remainingTeams(e, round) < e.getTeamsInOneMatch()) {
						break;
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

	public static void resetStartTime(String date) {

		startTime = new Timestamp(new DateTime().toDateMidnight().toDateTime().plusDays(1).plusHours(15).getMillis());

	}

	static int remainingTeams(Event e, String round) {
		Connection c = null;
		PreparedStatement stmt = null;
		int remainingTeams = 0;
		try {
			c = getConnection();
			stmt = c.prepareStatement(
					"SELECT count(1) from team t  where t.scheduled = false and t.event_id = ? and round = ?");
			stmt.setDouble(1, e.getEventId());
			stmt.setString(2, round);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				remainingTeams = rs.getInt(1);
				break;
			}

			stmt.close();
			rs.close();
			c.close();

		} catch (Exception ex) {
			ex.printStackTrace();

		}
		return remainingTeams;

	}

	private static void resetTeamScheduleFlag() {
		// TODO Auto-generated method stub
		System.out.println("MainDB | resetTeamScheduleFlag starts");
		Connection c = null;
		PreparedStatement stmt = null;
		// List<Team> teamList = new ArrayList<>();
		try {
			c = getConnection();

			stmt = c.prepareStatement("UPDATE team SET scheduled=false where 1 ");
			stmt.executeUpdate();

			stmt.close();
			c.close();

		} catch (Exception ex) {
			ex.printStackTrace();

		}

		System.out.println("MainDB | resetTeamScheduleFlag ends");

	}

	public static void addSchedule(long index, int gameId) {
		System.out.println("MainDB | addSchedule start");
		Connection c = null;
		PreparedStatement stmt = null;
		try {
			c = getConnection();

			stmt = c.prepareStatement("INSERT INTO schedule(  schedule_id, game_id,seed)    VALUES (?, ?,?) ");
			stmt.setLong(1, index);
			stmt.setInt(2, gameId);
			stmt.setInt(3, seed);

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
			Class.forName("com.mysql.jdbc.Driver");
			c = DriverManager.getConnection("jdbc:mysql://localhost:3306/vesit", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();

		}

		return c;
	}

	public static Timestamp getSchedule(Event e, boolean update) {

		System.out.println("MainDB | getSchedule starts");
		e.setCurrentTime(startTime);
		if (update) {
			if (0 == getMainEventParallelMatches(e.getMainEventId())) {
				if (17 == startTime.getHours()) {

					startTime = new Timestamp(startTime.getTime() + 1000 * 60 * 60 * 22);

					while (0 == new Timestamp(startTime.getTime()).getDay() || isPublicHoliday(startTime)) {
						startTime = new Timestamp(startTime.getTime() + 1000 * 60 * 60 * 24);
					}

					// Sunday

				} else {
					startTime = new Timestamp(startTime.getTime() + 1000 * 60 * 60);
				}
				resetMainEventParallelMatches(e.getMainEventId());
				e.setCounter(e.getCounter() + 1);
			}
		}
		System.out.println("MainDB | getSchedule ends");
		return e.getCurrentTime();

	}

	private static boolean isPublicHoliday(Timestamp startTime2) {
		for (PublicHoliday h : holidays) {
//if(h.getDate())
		}
		return false;
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
					"SELECT event_id, event_name, gender,  details, max_participate,  teams_in_one_match, eventhead,seed FROM event");
			while (rs.next()) {

				Event e = new Event(rs.getInt(1), rs.getString(2), rs.getString(3), 0, rs.getString(4), rs.getInt(5), 0,
						rs.getInt(6), rs.getString(7), rs.getInt(8));
				// System.out.println(e);
				sportList.add(e);
			}
			rs.close();
			stmt.close();
			c.close();
			for (Event e : sportList) {
				e.setTeams(getTeams(e, round));
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		System.out.println("MainDB | getAllEvents ends");
		return sportList;
	}

	public static List<Team> getTeams(Event event, String round) {

		// System.out.println("MainDB | getTeams start");
		Connection c = null;
		PreparedStatement stmt = null;
		List<Team> teamList = new ArrayList<>();
		try {
			c = getConnection();

			stmt = c.prepareStatement(
					"SELECT `team_id`, `team_name`, `classroom`, `scheduled`, `event_id`, `round`, `points` FROM `team` t where t.event_id = ? and t.round = ?");
			stmt.setInt(1, event.getEventId());
			stmt.setString(2, round);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Team t = new Team(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getInt(5),
						rs.getString(6), rs.getInt(7));
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
		// System.out.println("MainDB | getTeams ends");
		return teamList;
	}

	public static List<Player> getPlayers(Team t) {
		// System.out.println("MainDB | getPlayers start");

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
				Player p = new Player(rs.getString(1), rs.getString(2));
				// System.out.println(t);
				playerList.add(p);
			}
			rs.close();
			stmt.close();
			c.close();
		} catch (Exception e) {
			e.printStackTrace();

		}

		// System.out.println("MainDB | getPlayers ends");
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

			stmt = c.prepareStatement("INSERT INTO schedule(schedule_id, game_id,seed)   VALUES (?, ?,?)");
			stmt.setLong(1, schedule_index);
			stmt.setInt(2, gameId);
			stmt.setInt(3, seed);

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
			stmt.setString(5, p.getPlayerId());
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

			stmt = c.prepareStatement("delete  FROM schedule ");
			stmt.executeUpdate();

			stmt = c.prepareStatement("delete  FROM gameteammapping");
			stmt.executeUpdate();

			stmt = c.prepareStatement("delete  FROM game ");
			stmt.executeUpdate();

			stmt.close();
			c.close();
		} catch (Exception e) {
			e.printStackTrace();

		}

		System.out.println("MainDB | clearDB ends");
	}

	static int getMainEventParallelMatches(double mainEventId) {
		System.out.println("MainDB | getMainEventParallelMatches start");
		int parallelMatches = 0;
		Connection c = null;
		PreparedStatement stmt = null;

		try {
			c = getConnection();
			stmt = c.prepareStatement("SELECT  temp_counter FROM mainevent WHERE main_event_id = ?  and slot =?");
			stmt.setDouble(1, mainEventId);
			stmt.setInt(2, slot);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				parallelMatches = rs.getInt(1);
				break;
			}

			stmt = c.prepareStatement(
					"UPDATE mainevent SET temp_counter=temp_counter -1 WHERE main_event_id = ? and slot =?");
			stmt.setDouble(1, mainEventId);
			stmt.setInt(2, slot);
			stmt.executeUpdate();

			stmt.close();
			rs.close();
			c.close();

		} catch (

		Exception e) {
			e.printStackTrace();

		}
		System.out.println("MainDB | getMainEventParallelMatches ends");
		return parallelMatches;
	}

	static void resetMainEventParallelMatches(double mainEventId) {
		Connection c = null;
		PreparedStatement stmt = null;

		try {
			c = getConnection();

			stmt = c.prepareStatement(
					"UPDATE mainevent SET temp_counter=main_event_parallel_matches WHERE main_event_id = ? and slot =?");
			stmt.setDouble(1, mainEventId);
			stmt.setInt(2, slot);
			stmt.executeUpdate();

			stmt.close();
			c.close();

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

}
