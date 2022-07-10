package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.entity.Player;
import com.entity.PlayerManager;

@RestController
public class PlayerController {
	
	
	@Autowired
	PlayerManager service;
	
	@GetMapping(path = "/players")	 
	public List<Player> getAll(){
	    return service.getAllPlayers();
	}
	
	@GetMapping(path = "/players/{playerId}")
	public Player getPlayerById(@PathVariable int playerId) {
		Player player = service.getPlayerById(playerId);
		
		if(null == player){
			throw new RuntimeException("Player not found");
		}
		
		return player;
	}

	@PostMapping(path = "/players/user")
	public void savePlayer(@RequestBody Player player) {
		service.savePlayer(player);
	}

	
}
