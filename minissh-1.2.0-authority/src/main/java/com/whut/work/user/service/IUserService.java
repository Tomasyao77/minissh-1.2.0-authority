package com.whut.work.user.service;

import com.whut.work.base.model.Page;
import com.whut.work.user.model.Role;
import com.whut.work.user.model.User;

import java.util.Map;

public interface IUserService {

    //获取用户分页列表
	public Page<User> getUserPageList(int currentPage, int pageSize) throws Exception;

    //删除用户
    public Map<String,Object> deleteOneUser(Integer id) throws Exception;

    //新增角色
    public Map<String,Object> addRole(String roleName) throws Exception;

    //获取用户分页列表
    public Page<Role> getRolePageList(int currentPage, int pageSize) throws Exception;

    //删除角色
    public Map<String,Object> deleteOneRole(Integer id) throws Exception;

}
