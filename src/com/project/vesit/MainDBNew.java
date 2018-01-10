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

public class MainDBNew {

	public static final int NO_OF_ITERATION = 10;

	public static void main(String areg[]) {
		/*----- */

		clearDB();
		List<Event> sports = getAllSports();

		int loop = 0;
		while (loop < NO_OF_ITERATION) {
			++loop;
			System.out.println("loop  : " + loop);
			long schedule_index = System.currentTimeMillis();
			List<Game> games = new ArrayList<>();

			Collections.shuffle(sports);

			Iterator<Event> i = sports.iterator();

			while (i.hasNext()) {
				Event s = i.next();
				System.out.println(s.getEventName());
				while (!s.schedulingCmplt()) {
					ListIterator<Team> itr = s.getTeams().listIterator();
					Team final1 = null, final2 = null;

					while (itr.hasNext()) {
						boolean conflict = false;
						Team t = itr.next();
						Iterator<Player> playItr = t.getPlayers().iterator();
						while (playItr.hasNext() && !t.isScheduled()) {
							Player p = playItr.next();
							// System.out.print(p.getPlayerName() + " : ");

							Random rand = new Random();
							conflict = checkConflict(p, s);

							int n = rand.nextInt(5) + 1;
							if (n == 1) {
								conflict = true;
								System.out.println("conflict!!");
								break;
							} else
								conflict = false;

						}
						if (!conflict && !t.isScheduled()) {
							if (final1 == null)
								final1 = t;
							else if (final2 == null && !t.isScheduled())
								final2 = t;

						} else {
							continue;
							// itr.remove();
							// s.getTeams().remove(t);
							// s.getTeams().add(s.getTeams().size() - 1, t);
						}
						if (final1 != null && final2 != null) {
							System.out.println();
							final1.setScheduled(true);
							final2.setScheduled(true);
							Timestamp sch = getSchedule(s);

							// check here
							games.add(new Game(final1, final2, sch, new Timestamp(sch.getTime() + 0), s.getEventId()));

							// check ends

							final1 = null;
							final2 = null;
							/*
							 * for (Game g : games) { //
							 * System.out.println("INC"+g.getTeamA().getTeamName
							 * () // + " vs " + g.getTeamB().getTeamName()); }
							 */

						}

					}

					// System.out.println(s.getSportName());

					// System.out.println(games);

				}
				s.setGames(games);
			}
			for (Game g : games) {
				System.out.println("--------");
				System.out.println(g.getTeamA().getTeamName() + " vs " + g.getTeamB().getTeamName() + " @  "
						+ g.getStartTimeStamp() + " - " + g.getEndTimeStamp());
			}
			saveGames(games, schedule_index);
			for (Event s : sports) {

				System.out.println(s.getEventName());
				for (Game g : s.getGames()) {

					System.out.println(g.getTeamA().getTeamName() + " vs " + g.getTeamB().getTeamName() + " @  "
							+ getTimeStr(g.getStartTimeStamp()) + " - " + getTimeStr(g.getEndTimeStamp()));
				}
				/*
				 * for (Team t : s.getTeams()) {
				 * System.out.println(t.getTeamName() + " : " +
				 * t.isScheduled()); }
				 */
				// games.removeAll(games);
				games = null;

				/*
				 * for (Game g : games) { System.out.println(
				 * "-------- after clean");
				 * System.out.println(g.getTeamA().getTeamName() + " vs " +
				 * g.getTeamB().getTeamName() + " @  " + g.getStartTimeStamp() +
				 * " - " + g.getEndTimeStamp()); }
				 */
				System.out.println("--------");
			}
		}

		getScheduleCost();

	}

	public static void addSchedule(long index, int gameId) {
		System.out.println("MainDB | addSchedule start");
		Connection c = null;
		PreparedStatement stmt = null;
		try {
			c = getConnection();
			System.out.println("Opened database successfully");
			stmt = c.prepareStatement("INSERT INTO public.schedule(  schedule_id, game_id)    VALUES (?, ?) ");
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

	public static Timestamp getSchedule(Event s) {

		System.out.println("MainDB | checkConflict starts");
		Timestamp t = null;
		long interval = 0;
		Connection c = null;
		PreparedStatement stmt = null;
		// List<Team> teamList = new ArrayList<>();
		try {
			c = getConnection();

			stmt = c.prepareStatement("select s.current_ts,s.game_interval from  public.sport s where s.sport_id = ?");
			stmt.setInt(1, s.getEventId());
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				t = rs.getTimestamp(1);
				interval = rs.getLong(2);
			}

			stmt = c.prepareStatement("Update  public.sport s SET s.current_ts = ? where s.sport_id = ?");

			// check here
			/*
			 * stmt.setTimestamp(1, new Timestamp((t.getTime() + s.getSlotTime()
			 * + interval))); stmt.setInt(2, s.getSportId());
			 */
			// check ends
			rs.close();
			stmt.close();
			c.close();

		} catch (Exception e) {
			e.printStackTrace();

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

	public static List<Event> getAllSports() {

		System.out.println("MainDB | getAllSports start");
		Connection c = null;
		Statement stmt = null;
		List<Event> sportList = new ArrayList<>();
		try {
			c = getConnection();

			stmt = c.createStatement();
			ResultSet rs = stmt
					.executeQuery("SELECT event_id, event_name, gender, parallel_matches, details  FROM public.event");
			while (rs.next()) {
				Event e = new Event(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5));
				// System.out.println(s);
				sportList.add(e);
			}
			rs.close();
			stmt.close();
			c.close();
			for (Event s : sportList) {
				s.setTeams(getTeams(s));
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		System.out.println("MainDB | getAllSports ends");
		return sportList;
	}

	public static List<Team> getTeams(Event event) {

		System.out.println("MainDB | getTeams start");
		Connection c = null;
		PreparedStatement stmt = null;
		List<Team> teamList = new ArrayList<>();
		try {
			c = getConnection();

			stmt = c.prepareStatement("SELECT * FROM public.team t where t.event_id = ?");
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

			stmt = c.prepareStatement("SELECT player_id, player_name FROM public.player p where p.team_id = ?");
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

	private static void saveGames(List<Game> games, long schedule_index) {
		System.out.println("MainDB | saveGames start");
		Connection c = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		int gameId = 0;
		try {
			c = getConnection();
			for (Game g : games) {
				stmt = c.prepareStatement(
						"INSERT INTO public.game(team_a, team_b, start_ts, end_ts, sport_id)   VALUES ( ?, ?, ?, ?, ?);");
				stmt.setInt(1, g.getTeamA().getTeamId());
				stmt.setInt(2, g.getTeamB().getTeamId());
				stmt.setTimestamp(3, g.getStartTimeStamp());
				stmt.setTimestamp(4, g.getEndTimeStamp());
				stmt.setInt(5, g.getSportId());

				stmt.executeUpdate();

				stmt = c.prepareStatement(
						"SELECT game_id  FROM public.game where team_a = ?  and team_b = ? and start_ts = ? and end_ts =? and sport_id = ?");
				stmt.setInt(1, g.getTeamA().getTeamId());
				stmt.setInt(2, g.getTeamB().getTeamId());
				stmt.setTimestamp(3, g.getStartTimeStamp());
				stmt.setTimestamp(4, g.getEndTimeStamp());
				stmt.setInt(5, g.getSportId());

				rs = stmt.executeQuery();
				while (rs.next()) {
					gameId = rs.getInt(1);
				}

				stmt = c.prepareStatement("INSERT INTO public.schedule(   schedule_id, game_id)   VALUES (?, ?)");
				stmt.setLong(1, schedule_index);
				stmt.setInt(2, gameId);

				stmt.executeUpdate();

				rs.close();
				stmt.close();

			}
			c.close();

		} catch (Exception e) {
			e.printStackTrace();

		}

		System.out.println("MainDB | saveGames ends");

	}

	public static boolean checkConflict(Player p, Event s) {
		System.out.println("MainDB | checkConflict starts");
		/*
		 * Connection c = null; PreparedStatement stmt = null; // List<Team>
		 * teamList = new ArrayList<>(); try { c = getConnection();
		 * 
		 * stmt = c.prepareStatement(
		 * "select distinct t.team_id,s.sport_id from  public.sport s,public.game g, public.team t, public.player p where s.sport_id = t.sport_id and g.sport_id = s.sport_id and t.team_id = p.team_id  and p.player_id = ? and g.start_ts = ? and g.end_ts = ?"
		 * ); stmt.setInt(1, p.getPlayerId()); stmt.setTimestamp(2,
		 * s.getCurTimestamp()); stmt.setTimestamp(3, new
		 * Timestamp(s.getCurTimestamp().getTime() + s.getSlotTime()));
		 * ResultSet rs = stmt.executeQuery(); if (rs.getRow() > 1) { return
		 * true; } rs.close(); stmt.close(); c.close();
		 * 
		 * } catch (Exception e) { e.printStackTrace();
		 * 
		 * }
		 */
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
					"SELECT distinct s.schedule_id, MAX(g.end_ts) - MIN(g.start_ts)   FROM public.schedule s, public.game g   group by s.schedule_id;");

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				System.out.println(rs.getTime(2));
				if (rs.getTimestamp(2).getTime() < minSchCost) {
					minSchId = rs.getLong(1);
					minSchCost = rs.getTimestamp(2).getTime();

				}

			}

			stmt = c.prepareStatement("delete  FROM public.schedule s where s.schedule_id != ? ");
			stmt.setLong(1, minSchId);
			stmt.executeUpdate();

			stmt = c.prepareStatement(
					" delete from public.game g where g.game_id  NOT IN  (select s.game_id FROM public.schedule s where s.schedule_id = ?)");
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

			stmt = c.prepareStatement("delete   FROM public.schedule s");
			stmt.executeUpdate();

			stmt = c.prepareStatement("delete   FROM public.game g");
			stmt.executeUpdate();

			stmt.close();
			c.close();
		} catch (Exception e) {
			e.printStackTrace();

		}

		System.out.println("MainDB | clearDB ends");
	}

}
