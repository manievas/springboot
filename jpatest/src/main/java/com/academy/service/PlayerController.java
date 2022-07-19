package com.academy.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.academy.dataaccess.PlayerDataAccess;
import com.academy.dataaccess.PlayerRepositoryJPA;
import com.academy.entity.Player;

@RestController
public class PlayerController {

	@Autowired
	PlayerDataAccess playerManager;

	PlayerRepositoryJPA playerRepo;

	/* Entity Manager */
	@PostMapping(path = "/savedByManager")
	public void savePlayerMng(@RequestBody Player player) {
	    playerManager.insertPlayer(player);
	} 
	
	/* JPA Repository*/
	@PostMapping(path = "/savedByJPARepository")
	public void savePlayer(@RequestBody Player player) {
		playerRepo.save(player);
	}	
	
	@GetMapping(path = "/getByJPARepository")
	public List<Player> getPlayers() {
		return playerRepo.findAll();
	}	
	
	@GetMapping(path = "/getIdByJPARepository/{playerId}")
	public Player getPlayerById(@PathVariable Long playerId) {
		Optional<Player> playerById = playerRepo.findById(playerId);
		return playerById.get();
	}	
	
	
}
