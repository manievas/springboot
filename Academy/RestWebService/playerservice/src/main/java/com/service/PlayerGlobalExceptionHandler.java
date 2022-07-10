package com.service;

import java.util.Date;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;


@RestController
@ControllerAdvice
public class PlayerGlobalExceptionHandler extends ResponseEntityExceptionHandler{

	@ExceptionHandler(Exception.class)
	public ResponseEntity<Object> handleAllException(Exception ex, WebRequest request){
		PlayerExceptionResponse exception = new PlayerExceptionResponse(ex.getMessage(),
				                                                        request.getDescription(false), 
				                                                        new Date());
		return new ResponseEntity<Object>(exception, HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@ExceptionHandler(PlayerException.class)
	public ResponseEntity<Object> handlePlayerNotFoundException(Exception ex, WebRequest request){
		PlayerExceptionResponse exception = new PlayerExceptionResponse(ex.getMessage(),
				                                                        request.getDescription(false), 
				                                                        new Date());
		return new ResponseEntity<Object>(exception, HttpStatus.NOT_FOUND);
	}
	
	
}