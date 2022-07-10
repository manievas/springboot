package com.example.demo.tightcoupling;

public class TightCoupleSolution {
	Job job;
	
	
	public TightCoupleSolution(Job job) {
		this.job = job;
	}
	
	public void ShowData()
	{
		job.Display();
	}

}
