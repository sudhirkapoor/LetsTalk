package com.chat.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chat.model.UserDetail;

@Repository(value="userDAO")
@Transactional

public class UserDAO {

	@Autowired
	private SessionFactory session;
	

	public List<UserDetail> findAllUsers() {
		return session.getCurrentSession().createQuery("from UserDetail").list();
	}

}
