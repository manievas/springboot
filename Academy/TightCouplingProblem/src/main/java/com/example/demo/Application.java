package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.demo.tightcoupling.*;

@SpringBootApplication
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
		System.out.println("Hola esta es mi primer app springboot");
		
		//TightCouplingProblem problem = new TightCouplingProblem(new Doctor(), new Engineer());
		//problem.ShowData();
		
		TightCoupleSolution solution = new TightCoupleSolution(new Engineer());
		solution.ShowData();
	}

}
