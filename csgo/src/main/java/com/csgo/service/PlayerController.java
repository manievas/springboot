package com.csgo.service;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.csgo.application.PlayerManager;
import com.csgo.entity.Player;
import com.csgo.exception.PlayerException;

@RestController
public class PlayerController {
	
	
	@Autowired
	PlayerManager service;
	
	@CrossOrigin(origins = "http://localhost:8080")
	
	@GetMapping(path = "/players")	 
	public List<Player> getAll(){
	    return service.getAllPlayers();
	}
	
	@GetMapping(path = "/players/{playerId}")
	public Player getPlayerById(@PathVariable int playerId) {
		Player player = service.getPlayerById(playerId);
		
		if(null == player){
			throw new PlayerException("Player not found");
		}
		
		return player;
	}

	@PostMapping(path = "/players/user")
	public ResponseEntity<Object> savePlayer(@RequestBody Player player) {
		Player newPlayer = service.savePlayer(player);
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("{playerId}")
				.buildAndExpand(newPlayer.getPlayerId()).toUri();
		return ResponseEntity.created(uri).build();
	
	}
	
	@DeleteMapping("/players/delete/{playerId}")
	public void deletePlayerById(@PathVariable int playerId) {
		Player playerDeleted = service.deletePlayer(playerId);
		
		if(null == playerDeleted){
			throw new PlayerException("Player not exists");
		}
	}
	
	@PutMapping(path = "/players/change/{playerId}")
	public ResponseEntity<Object> modifyPlayer(@PathVariable int playerId, @RequestBody Player player) {
		Player playerUpdated = service.updatePlayer(playerId, 	player);
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("{playerId}")
				.buildAndExpand(playerUpdated.getPlayerId()).toUri();
		return ResponseEntity.created(uri).build();

	}
	
}
