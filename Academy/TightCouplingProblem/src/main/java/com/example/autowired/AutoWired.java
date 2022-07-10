
package com.example.autowired;

import org.springframework.beans.factory.annotation.Autowired;

public class AutoWired {
	
	
	@Autowired
	JobAW job;
	
	public void ShowData()
	{
		job.Display();
	}
}
