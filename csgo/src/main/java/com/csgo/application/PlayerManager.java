package com.csgo.application;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.csgo.entity.Player;

@Component
public class PlayerManager {

	private static List<Player> list = new ArrayList<Player>();
	
	static {		
		list.add(new Player("Maty", "TkDMagic", 1));
		list.add(new Player("Fede", "DiB", 2));
		list.add(new Player("Gonza", "EL TETAS", 3));
	}

	public List<Player> getAllPlayers(){
		return list;
	}
	
	public Player getPlayerById(int playerId) {
		return list.stream().filter(player -> player.getPlayerId()==playerId).findAny().orElse(null);
	}
	
	public Player savePlayer(Player player) {
		player.setPlayerId(list.size()+1);
		list.add(player);
		return player;
	}
	
	public Player deletePlayer(int playerId) {
		Player playerToDelete = new Player(null, null, playerId);
		playerToDelete = getPlayerById(playerId);
		list.remove(playerToDelete);
		return playerToDelete;
	}
	
	public Player updatePlayer(int playerId, Player player) {
		
		list.set(playerId-1, player);
		
		return player;
	}
	
}


