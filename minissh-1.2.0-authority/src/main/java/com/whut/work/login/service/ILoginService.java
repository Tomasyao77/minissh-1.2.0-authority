package com.whut.work.login.service;

import java.util.Map;

public interface ILoginService {

	//登录
	public Map<String,Object> login(String username, String password) throws Exception;
	
	//注册
	public Map<String,Object> register(String username, String password, String tel, String email) throws Exception;
	

	
}
