package com.whut.work.user.dao.impl;

import org.springframework.stereotype.Component;

import com.whut.work.base.dao.Impl.BaseDaoImpl;
import com.whut.work.user.dao.IUserDao;
import com.whut.work.user.model.User;

@Component
public class UserDaoImpl extends BaseDaoImpl<User> implements IUserDao {

	public UserDaoImpl(){
		super(User.class);
	}

}
