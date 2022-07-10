package com.example.autowired;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;


@SpringBootApplication
public class ApplicationAutoWired {
	public static void main(String[] args) {
		
		System.out.println("Test Autowired SpringBoot");
		
		ApplicationContext context = SpringApplication.run(ApplicationAutoWired.class, args);
		
		JobAW job = context.getBean(DoctorAW.class);
		
		job.Display();
		
		//Debug en src/main/properties/application.properties
		//logging.level.org.springframework=debug
		
	}
}


