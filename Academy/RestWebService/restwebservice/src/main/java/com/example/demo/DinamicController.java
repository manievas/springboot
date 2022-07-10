package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DinamicController {

	@GetMapping (path = "/welcome/{msg}")
	public TestBean showMessage(@PathVariable String msg) {
		return new TestBean("Welcome to my second Web Service: "+ msg);
	}
	
}
