package com.chat.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chat.model.UserDetail;


@Repository(value = "userDAO")
@Transactional

public class UserDAO {

	@Autowired
	private SessionFactory sessionFactory;


	public List<UserDetail> findAllUsers() {
		return sessionFactory.getCurrentSession().createQuery("from UserDetail").list();
	}

	public UserDetail findById(String username) {
		System.out.println("User DAI for id search"+username);
		//UserDetail user = sessionFactory.getCurrentSession().get(UserDetail.class, username);
		List<UserDetail> list=sessionFactory.getCurrentSession().createQuery("from UserDetail where username='"+username+"'").list();
		for (UserDetail user : list) {
			System.out.println("DAO username "+user.getName());
			return user;	
		}
		return null;
		
	}

	
	public boolean isUserExist(UserDetail userDetail) {
		// TODO Auto-generated method stub
		return findById(userDetail.getUsername())!=null;
	}

	public List<UserDetail> getAllUsers()
	{
		Session session=sessionFactory.getCurrentSession();		
		return session.createQuery("from UserDetail").list();
	}
	
	
	public void registerUser(UserDetail userDetail) {

		Session session = sessionFactory.getCurrentSession();
		System.out.println("Hello from DAO");
		userDetail.setEnable(true);
		userDetail.setRole("ROLE_USER");
		
		System.out.println("Start");
		session.save(userDetail);
		System.out.println("end");
	}
}
