package com.entity;

public class Player {

	private String name;
	
	private String nickname;
	
	private int playerId;


	public Player(String name, String nickname, int playerId) {
		this.name = name;
		this.nickname = nickname;
		this.playerId = playerId;
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

	public int getPlayerId() {
		return playerId;
	}

	public void setPlayerId(int playerId) {
		this.playerId = playerId;
	}
	
}
