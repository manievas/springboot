package com.example.demo;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND)
public class PlayerException extends RuntimeException{

	public PlayerException(String msg) {
		super(msg);
	}
}
