package com.application;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.entity", 
		                       "com.service", 
		                       })

public class PlayerserviceApplication {

	public static void main(String[] args) {
		SpringApplication.run(PlayerserviceApplication.class, args);
		
	}

}
