package com.chat.controller;


import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;



@RestController
@CrossOrigin(origins = "http://127.0.0.1:8887")
public class UserController {

	@RequestMapping(value = "/")
	public ModelAndView index()
	{
		return new ModelAndView("index");
	}

}
