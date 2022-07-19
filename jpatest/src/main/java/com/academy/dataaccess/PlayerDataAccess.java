package com.academy.dataaccess;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.academy.entity.Player;

@Repository
@Transactional
public class PlayerDataAccess {

	@PersistenceContext
	EntityManager em;
	
	public void insertPlayer(Player player) {
		em.persist(player);
	}
}
