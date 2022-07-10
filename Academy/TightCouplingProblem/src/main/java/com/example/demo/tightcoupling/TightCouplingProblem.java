package com.example.demo.tightcoupling;

public class TightCouplingProblem {

	Doctor doctor;
	Engineer engineer;
	
	public TightCouplingProblem(Doctor doctor, Engineer engineer) {
		this.doctor = doctor;
		this.engineer = engineer;
	}
	
	public void ShowData() {
		doctor.Display();
		engineer.Display();
	}
	
}
