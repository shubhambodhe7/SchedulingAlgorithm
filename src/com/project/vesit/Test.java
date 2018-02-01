package com.project.vesit;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.Gson;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Team t = new Team();
		t.setTeamName("team name");
		Player p = new Player(1, "aa");
		List<Player> pl = new ArrayList<>();
		pl.add(p);
		t.setPlayers(pl);

		Gson gson = new Gson();
		String jsonString = gson.toJson(t);
		System.out.println(jsonString);
		try {
			JSONObject request = new JSONObject(jsonString);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
