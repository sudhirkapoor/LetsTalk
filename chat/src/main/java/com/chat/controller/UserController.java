package com.chat.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.chat.dao.UserDAO;
import com.chat.model.UserDetail;


@RestController
@CrossOrigin(origins = "http://localhost:8080/")
public class UserController {
	@Autowired
	UserDAO userDAO;

	@RequestMapping(value = "/")
	public ModelAndView index() {
		System.out.println(userDAO.findAllUsers());
		return new ModelAndView("index");
	}

	@RequestMapping(value = "/login")
	public ModelAndView login() {

		return new ModelAndView("login");
	}

	@RequestMapping("/signup")
	public ModelAndView registerPage(Model model) {
		ModelAndView mv = new ModelAndView("signup");
	UserDetail	userDetail=new UserDetail();
		model.addAttribute("userDetail",userDetail);
		
		return mv;
	}

	@RequestMapping(value = "/RegisterUser", method = RequestMethod.POST)
	public String registerUser(@Valid @ModelAttribute("userDetail") UserDetail userDetail,
			Model m, HttpServletRequest request) {

		List<UserDetail> userList = userDAO.getAllUsers();

		for (int i = 0; i < userList.size(); i++) {
			if (userDetail.getUsername().equals(userList.get(i).getUsername())) {
				m.addAttribute("emailMsg", "Email already exists");

				return "Register";
			}
		}
		if (userDetail.getId() == 0) {
			this.userDAO.registerUser(userDetail);
			System.out.println(userDetail.getName());

		}

		else

		{
			/* this.userService.updateProduct(product) */;
			this.userDAO.registerUser(userDetail);
			System.out.println(userDetail.getName());
		}

		return "redirect:/Login";
	}
	
	
	@RequestMapping(value = "/user/{username}/{name}/{password}", method = RequestMethod.GET)
	public ResponseEntity<Void> createUser(@PathVariable String username, @PathVariable String name,
			@PathVariable String password, UriComponentsBuilder ucBuilder) {

		UserDetail user = new UserDetail();
		user.setEnable(true);
		user.setId(1243);
		user.setName(name);
		user.setUsername(username);
		user.setRole("ROLE_USER");
		user.setPassword(password);
		System.out.println("hi");
		System.out.println(user);

		/*if (userDAO.isUserExist(user)) {System.out.println("error");
			
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		} else {*/
System.out.println("dao calling");
			userDAO.registerUser(user);
		//}
		// }

		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	
	
	@RequestMapping(value = "/login/{username}/{password}", method = RequestMethod.POST)
	public ResponseEntity<UserDetail> loginUser(@PathVariable String username,@PathVariable String password) {

		UserDetail user = new UserDetail();
		user=userDAO.findById(username);
		System.out.println(user);		
		System.out.println(username);

		if (userDAO.isUserExist(user)) {
			
			System.out.println("first if");
			if(user.getPassword().equals(password))
			{
				System.out.println("inner if");
				System.out.println(password);
				System.out.println(user.getPassword());
				//user.setPassword("");
				String role=user.getRole();
				System.out.println(role);
				return new ResponseEntity<UserDetail>(user,HttpStatus.OK);		
			}
		} else {

			return new ResponseEntity<UserDetail>(user,HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<UserDetail>(user,HttpStatus.INTERNAL_SERVER_ERROR);
	}


}
