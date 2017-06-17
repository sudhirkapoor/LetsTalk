package com.chat.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.chat.dao.UserDAO;



@RestController
@CrossOrigin(origins = "http://127.0.0.1:9000/")
public class UserController {
	@Autowired
	UserDAO userDAO;

	@RequestMapping(value = "/")
	public ModelAndView index()
	{
		System.out.println(userDAO.findAllUsers());
		return new ModelAndView("index");
	}

}
