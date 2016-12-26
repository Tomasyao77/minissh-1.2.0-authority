package com.whut.work.login.service;

import java.util.Map;

public interface ILoginService {

	//登录
	public Map<String,Object> login(String username, String password) throws Exception;
	
	//注册
	public Map<String,Object> register(String username, String password, String tel, String email) throws Exception;

	//编辑登录用户的信息
	public Map<String,Object> editLoger(Integer id,String username,String tel, String email) throws Exception;

    //获取登录用户的信息
    public Map<String,Object> getLoger(Integer id) throws Exception;
	
}
