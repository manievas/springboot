package com.academy.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Player {

	@Column(name = "player_name")
	private String name;
	
	@Column(name = "player_nickname")
	private String nickname;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long playerId;


	public Player(String name, String nickname, Long playerId) {
		this.name = name;
		this.nickname = nickname;
	}
	
	public Player() {
	}
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Long getPlayerId() {
		return playerId;
	}

	public void setPlayerId(Long playerId) {
		this.playerId = playerId;
	}


	@Override
	public String toString() {
		return "Player [name=" + name + ", nickname=" + nickname + ", playerId=" + playerId + "]";
	}
	

}
