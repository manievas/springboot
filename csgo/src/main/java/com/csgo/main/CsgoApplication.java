package com.csgo.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.csgo.application", 
		                       "com.csgo.service", 
		                       "com.csgo.exception", 
		                       })
public class CsgoApplication {

	public static void main(String[] args) {
		SpringApplication.run(CsgoApplication.class, args);
	}

}
