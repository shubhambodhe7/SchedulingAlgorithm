package com.dao.vesit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import org.joda.time.DateTime;

import com.dto.vesit.Event;
import com.dto.vesit.MainEvent;
import com.dto.vesit.Player;
import com.dto.vesit.PublicHoliday;
import com.dto.vesit.Team;

public class ScheduleGeneration {

	public static final int NO_OF_ITERATION = 5;
	static int seed = 0;
	static int slot = 1;
	static Timestamp startTime = new Timestamp(new DateTime().toDateMidnight().toDateTime().plusDays(1).getMillis());
	static String round = "registered";
	static List<PublicHoliday> holidays = getPublicHolidays();
	static long globalCost = Long.MAX_VALUE;

	public static void main(String args[]) {
		round = "registered";
		runMain(startTime, round);
	}

	public static int runMain(Timestamp date, String r) {
		long exeStartTime = System.currentTimeMillis();
		resetStartTime(date);
		round = r;
		System.out.println("converted starttime : " + startTime);
		System.out.println("::::::::::::::::::::START:::::::::::::::::::::::");
		clearDB(round);

		int loop = 0;
		while (loop < NO_OF_ITERATION) {
			++loop;
			resetTeamScheduleFlag();
			clearMainEventDB();
			List<Event> events = getAllEvents();
			// System.out.println("::::::::::::::::" + events);

			System.out.println("loop  : " + loop);
			long scheduleIndex = System.currentTimeMillis();

			Collections.shuffle(events);

			Iterator<Event> i = events.iterator();

			while (i.hasNext()) {
				Event e = i.next();
				if (!e.getEventName().equalsIgnoreCase("Carrom")) {
					// continue;
				}
				resetStartTime(date);
				// resetTeamScheduleFlag();
				slot = 1;
				Collections.shuffle(e.getTeams());

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

						if (numConflicts > (remainingTeams(e, round) - e.getTeamsInOneMatch())) {
							System.out.println("---------numConflicts--------------");
							getSchedule(e, true);
						}
						boolean conflict = false;
						Team t = itr.next();

						if (selectedTeams.contains(t)) {
							continue;
						}
						// System.out.println("Team Name : " + t.getTeamName());
						Iterator<Player> playItr = t.getPlayers().iterator();

						// while (playItr.hasNext()) {
						while (playItr.hasNext() && !t.isScheduled()) {

							Player p = playItr.next();
							// System.out.print(p.getPlayerName() + " : ");

							// Random rand = new Random();
							conflict = checkConflict(p, getSchedule(e, false),
									new Timestamp(getSchedule(e, false).getTime() + 1000 * 60 * 60));

							// int n = rand.nextInt(5) + 1;
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
									new Timestamp(getSchedule(e, false).getTime() + 1000 * 60 * 60), scheduleIndex,
									round);

							for (Team team : selectedTeams) {
								team.setScheduled(true);

							}
							selectedTeams.clear();
							System.out.println("-------outside---------");
							if (checkIfEligibleForPruning(scheduleIndex)) {
								deleteScheduleData(scheduleIndex);
								break;
							}
							getSchedule(e, true);

						}
						if (checkIfEligibleForPruning(scheduleIndex)) {
							break;
						}
					}
					if (remainingTeams(e, round) < e.getTeamsInOneMatch()) {
						break;
					}
					if (checkIfEligibleForPruning(scheduleIndex)) {
						break;
					}
					// System.out.println(e.getSportName());

					// System.out.println(games);

				}
				// e.setGames(games);
			}

			if (updateGlobalCost(scheduleIndex)) {
				deleteScheduleData(scheduleIndex);
			}
			if (checkIfEligibleForPruning(scheduleIndex)) {
				continue;
			}

		}

		long exeEndTime = System.currentTimeMillis();
		long elapsedTime = exeEndTime - exeStartTime;
		long seconds = (elapsedTime / 1000) % 60;
		long minutes = (elapsedTime / 1000) / 60;
		System.out.println("ExecutionTime : " + minutes + "min :" + seconds + "sec");
		System.out.println("::::::::::::::::::::END:::::::::::::::::::::::");
		return scheduleTableSize(round);

	}

	public static void resetStartTime(Timestamp date) {

		startTime = new Timestamp(date.getTime() + 1000 * 60 * 60 * 15);

	}

	// check -- del sc
	static int scheduleTableSize(String round) {
		Connection c = null;
		PreparedStatement stmt = null;
		int scheduleTableSize = 0;
		try {
			c = getConnection();
			stmt = c.prepareStatement("SELECT count(1) from schedule where round = ?");
			stmt.setString(1, round);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				scheduleTableSize = rs.getInt(1);
				break;
			}

			stmt.close();
			rs.close();
			c.close();

		} catch (Exception ex) {
			ex.printStackTrace();

		}
		return scheduleTableSize;

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
		// System.out.println("MainDB | resetTeamScheduleFlag starts");
		Connection c = null;
		PreparedStatement stmt = null;
		// List<Team> teamList = new ArrayList<>();
		try {
			c = getConnection();

			stmt = c.prepareStatement("UPDATE team SET scheduled=false");
			stmt.executeUpdate();

			stmt.close();
			c.close();

		} catch (Exception ex) {
			ex.printStackTrace();

		}

		// System.out.println("MainDB | resetTeamScheduleFlag ends");

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

	@SuppressWarnings("deprecation")
	public static Timestamp getSchedule(Event e, boolean update) {

		// System.out.println("MainDB | getSchedule starts");
		e.setCurrentTime(startTime);
		if (update) {
			int getMainEventParallelMatches = getMainEventParallelMatches(e.getMainEventId(), slot, startTime,
					new Timestamp(startTime.getTime() + 1000 * 60 * 60));
			if (0 < getMainEventParallelMatches)
				getMainEventParallelMatchesUpdate(e.getMainEventId(), slot, startTime,
						new Timestamp(startTime.getTime() + 1000 * 60 * 60));
			if (0 == getMainEventParallelMatches) {

				if (17 == startTime.getHours()) {// evening 6pm advance to next
													// day

					startTime = new Timestamp(startTime.getTime() + 1000 * 60 * 60 * 22);
					slot = 1;

					while (0 == new Timestamp(startTime.getTime()).getDay() || isPublicHoliday(startTime)) {
						startTime = new Timestamp(startTime.getTime() + 1000 * 60 * 60 * 24);
					}

					// Sunday

				} else {
					startTime = new Timestamp(startTime.getTime() + 1000 * 60 * 60);
					slot++;
				}
				// resetMainEventParallelMatches(e.getMainEventId());
				// e.setCounter(e.getCounter() + 1);
			}
		}
		// System.out.println("MainDB | getSchedule ends");
		return e.getCurrentTime();

	}

	private static boolean isPublicHoliday(Timestamp st) {
		for (PublicHoliday h : holidays) {

			Calendar cal1 = Calendar.getInstance();
			Calendar cal2 = Calendar.getInstance();
			cal1.setTime(st);
			cal2.setTime(h.getDate());
			if (cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR)
					&& cal1.get(Calendar.DAY_OF_YEAR) == cal2.get(Calendar.DAY_OF_YEAR)) {
				return true;
			}
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

		// System.out.println("MainDB | getAllEvents start");
		Connection c = null;
		Statement stmt = null;
		List<Event> sportList = new ArrayList<>();
		try {
			c = getConnection();

			stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery(
					"SELECT event_id, event_name, gender,  details, max_participate,  teams_in_one_match, eventhead,seed,main_event_id FROM event");
			while (rs.next()) {

				Event e = new Event(rs.getInt(1), rs.getString(2), rs.getString(3), 0, rs.getString(4), rs.getInt(5), 0,
						rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getDouble(9));
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

		// System.out.println("MainDB | getAllEvents ends");
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

	private static void saveGames(List<Team> teams, int eventId, Timestamp st, Timestamp et, long scheduleIndex,
			String round) {
		System.out.println("MainDB | saveGames start");
		// schdeule true
		// game save
		Connection c = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		int gameId = 0;
		try {
			c = getConnection();
			stmt = c.prepareStatement("INSERT INTO game( start_ts, end_ts, event_id,schedule_id) VALUES (?, ?, ?,?)");
			stmt.setTimestamp(1, st);
			stmt.setTimestamp(2, et);
			stmt.setInt(3, eventId);
			stmt.setLong(4, scheduleIndex);

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
				stmt.setLong(3, scheduleIndex);
				stmt.executeUpdate();
				///

				// chekc here put schedle id check
				stmt = c.prepareStatement("UPDATE team  SET  scheduled = true WHERE team_id =?");
				stmt.setLong(1, t.getTeamId());
				stmt.executeUpdate();

			}

			stmt = c.prepareStatement("INSERT INTO schedule(schedule_id, game_id,seed,round)   VALUES (?, ?,?,?)");
			stmt.setLong(1, scheduleIndex);
			stmt.setInt(2, gameId);
			stmt.setInt(3, seed);
			stmt.setString(4, round);

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
		// System.out.println("MainDB | checkConflict starts");

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

		// System.out.println("MainDB | checkConflict ends");
		return false;

	}

	public static boolean updateGlobalCost(long scheduleIndex) {
		// System.out.println("MainDB | geScheduleCost start");

		Connection c = null;
		PreparedStatement stmt = null;
		boolean updateFlag = false;
		try {
			c = getConnection();

			stmt = c.prepareStatement(
					"SELECT MAX(g.end_ts) , MIN(g.start_ts)   FROM  game g  where g.schedule_id = ?");
			stmt.setLong(1, scheduleIndex);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Timestamp endTS = rs.getTimestamp(1);
				Timestamp startTS = rs.getTimestamp(2);
				if (null != startTS && null != endTS) {
					long timeTaken = endTS.getTime() - startTS.getTime();
					if (timeTaken < globalCost) {
						globalCost = timeTaken;
						updateFlag = true;
						System.out.println("update flag" + updateFlag);

					}

				}
			}

			rs.close();
			stmt.close();
			c.close();
		} catch (Exception e) {
			e.printStackTrace();

		}
		return updateFlag;
		// System.out.println("MainDB | geScheduleCost ends");
	}

	public static boolean checkIfEligibleForPruning(long scheduleIndex) {
		// System.out.println("MainDB | geScheduleCost start");

		Connection c = null;
		PreparedStatement stmt = null;
		boolean pruneFlag = false;
		try {
			c = getConnection();

			stmt = c.prepareStatement(
					"SELECT MAX(g.end_ts) , MIN(g.start_ts)   FROM  game g  where g.schedule_id = ?");
			stmt.setLong(1, scheduleIndex);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Timestamp endTS = rs.getTimestamp(1);
				Timestamp startTS = rs.getTimestamp(2);
				if (null != startTS && null != endTS) {

					long timeTaken = endTS.getTime() - startTS.getTime();
					if (timeTaken >= globalCost) {
						pruneFlag = true;
						System.out.println("pruning.....");
					}
				}
			}

			rs.close();
			stmt.close();
			c.close();
		} catch (Exception e) {
			e.printStackTrace();

		}
		return pruneFlag;
		// System.out.println("MainDB | geScheduleCost ends");
	}

	public static void deleteScheduleData(long scheduleIndex) {
		// System.out.println("MainDB | geScheduleCost start");

		Connection c = null;
		PreparedStatement stmt = null;
		try {
			c = getConnection();

			stmt = c.prepareStatement("delete FROM schedule where schedule_id = ?");
			stmt.setLong(1, scheduleIndex);
			stmt.executeUpdate();

			stmt = c.prepareStatement("delete  FROM gameteammapping where schedule_id = ?");
			stmt.setLong(1, scheduleIndex);
			stmt.executeUpdate();

			stmt = c.prepareStatement(
					" delete from game  where game_id  IN  (select game_id FROM schedule where schedule_id = ?)");
			stmt.setLong(1, scheduleIndex);
			stmt.executeUpdate();

			stmt.close();
			c.close();
		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	public static void clearDB(String round) {
		System.out.println("MainDB | clearDB start");

		Connection c = null;
		PreparedStatement stmt = null;
		try {
			c = getConnection();

			long scheduleId = 0L;
			stmt = c.prepareStatement("SELECT schedule_id  FROM schedule where round = ?");
			stmt.setString(1, round);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				scheduleId = rs.getLong(1);
				break;
			}

			stmt = c.prepareStatement("delete  FROM schedule where schedule_id = ?");
			stmt.setLong(1, scheduleId);
			stmt.executeUpdate();

			stmt = c.prepareStatement("delete  FROM gameteammapping where schedule_id = ?");
			stmt.setLong(1, scheduleId);
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

	public static void clearMainEventDB() {
		System.out.println("MainDB | clearDB start");

		Connection c = null;
		PreparedStatement stmt = null;
		try {
			c = getConnection();

			stmt = c.prepareStatement("delete FROM `mainevent` WHERE start_ts != '0000-00-00 00:00:00'");
			stmt.executeUpdate();

			stmt.close();
			c.close();
		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	static int getMainEventParallelMatches(double mainEventId, int slot, Timestamp st, Timestamp et) {
		// System.out.println("MainDB | getMainEventParallelMatches start");
		int parallelMatches = 0;
		Connection c = null;
		PreparedStatement stmt = null;
		boolean add = false;

		try {
			c = getConnection();
			stmt = c.prepareStatement(
					"SELECT count(1) FROM mainevent WHERE main_event_id = ? and slot = ? and start_ts = ? and end_ts= ?");
			stmt.setDouble(1, mainEventId);
			stmt.setInt(2, slot);
			stmt.setTimestamp(3, st);
			stmt.setTimestamp(4, et);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				if (rs.getInt(1) == 0) {
					add = true;
					System.out.println("Add : " + add);
					break;
				}

			}
			if (add) {
				MainEvent me = null;
				stmt = c.prepareStatement(
						"SELECT `main_event_name`, `main_event_parallel_matches` FROM `mainevent` where `main_event_id` = ? ");
				stmt.setDouble(1, mainEventId);
				rs = stmt.executeQuery();
				while (rs.next()) {
					me = new MainEvent(mainEventId, rs.getString(1), rs.getInt(2));
					break;

				}
				stmt = c.prepareStatement(
						"INSERT INTO `mainevent`(`main_event_id`,`main_event_name`, `main_event_parallel_matches`,`temp_counter`,`slot`,`start_ts`,`end_ts`) VALUES (?,?,?,?,?,?,?)");
				stmt.setDouble(1, mainEventId);
				stmt.setString(2, me.getMainEventName());
				stmt.setInt(3, me.getMainEventParallelMatches());
				stmt.setInt(4, me.getMainEventParallelMatches());
				stmt.setInt(5, slot);
				stmt.setTimestamp(6, st);
				stmt.setTimestamp(7, et);
				stmt.executeUpdate();
			}

			stmt = c.prepareStatement(
					"SELECT  temp_counter FROM mainevent WHERE main_event_id = ?  and slot =? and start_ts = ? and end_ts= ?");
			stmt.setDouble(1, mainEventId);
			stmt.setInt(2, slot);
			stmt.setTimestamp(3, st);
			stmt.setTimestamp(4, et);
			rs = stmt.executeQuery();
			while (rs.next()) {
				parallelMatches = rs.getInt(1);
				break;
			}

			stmt.close();
			rs.close();
			c.close();

		} catch (Exception ex) {
			ex.printStackTrace();

		}
		// System.out.println("MainDB | getMainEventParallelMatches ends");
		return parallelMatches;
	}

	static int getMainEventParallelMatchesUpdate(double mainEventId, int slot, Timestamp st, Timestamp et) {
		// System.out.println("MainDB | getMainEventParallelMatches start");
		int parallelMatches = 0;
		Connection c = null;
		PreparedStatement stmt = null;

		try {
			c = getConnection();

			stmt = c.prepareStatement(
					"UPDATE mainevent SET temp_counter=temp_counter -1 WHERE main_event_id = ? and slot =?  and start_ts = ? and end_ts= ?");
			stmt.setDouble(1, mainEventId);
			stmt.setInt(2, slot);
			stmt.setTimestamp(3, st);
			stmt.setTimestamp(4, et);
			stmt.executeUpdate();

			stmt.close();
			c.close();

		} catch (Exception ex) {
			ex.printStackTrace();

		}
		// System.out.println("MainDB | getMainEventParallelMatches ends");
		return parallelMatches;
	}

	public static List<PublicHoliday> getPublicHolidays() {

		Connection c = null;
		PreparedStatement stmt = null;
		List<PublicHoliday> list = new ArrayList<>();
		try {
			c = getConnection();

			stmt = c.prepareStatement("SELECT * FROM `publicholiday` order by date");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				PublicHoliday h = new PublicHoliday(rs.getInt(1), rs.getTimestamp(2), rs.getString(3));
				list.add(h);
			}
			rs.close();
			stmt.close();
			c.close();
		} catch (Exception e) {
			e.printStackTrace();

		}
		System.out.println(list);

		// System.out.println("MainDB | getPlayers ends");
		return list;
	}
}