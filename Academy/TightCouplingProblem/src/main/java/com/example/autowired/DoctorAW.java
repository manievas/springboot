package com.example.autowired;

import org.springframework.stereotype.Component;

@Component
public class DoctorAW implements JobAW{

	@Override
	public void Display() {
		System.out.println("I'm a Doctor");
		
	}
	
}