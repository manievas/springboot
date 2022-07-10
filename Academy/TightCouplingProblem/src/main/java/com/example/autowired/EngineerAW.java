package com.example.autowired;

import org.springframework.stereotype.Component;

@Component
public class EngineerAW implements JobAW{

	@Override
	public void Display () {
		System.out.println("I'm Engineer");
	}
}