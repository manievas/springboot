package com.academy.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;


//I need to scan dataaccess and service packages because application main package is not included in any of those.
@SpringBootApplication
@ComponentScan(basePackages = {"com.academy.dataaccess", 
		                       "com.academy.service", 
		                       })
//I need to do this because player entity is out of application main package
@EntityScan( basePackages = {"com.academy.entity"} ) 
public class JpatestApplication {

	public static void main(String[] args) {
		SpringApplication.run(JpatestApplication.class, args);
	}

}
