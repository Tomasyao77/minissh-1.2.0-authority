package com.whut.work.user.service;

import com.whut.work.base.model.Page;
import com.whut.work.user.model.Role;
import com.whut.work.user.model.User;

import java.util.List;
import java.util.Map;

public interface IUserService {

    //获取用户分页列表
	public Page<User> getUserPageList(int currentPage, int pageSize) throws Exception;

    //获取角色分页列表ForSearch
    public Page<User> getUserPageListForSearch(int currentPage, int pageSize,String blurUserName) throws Exception;

    //删除用户
    public Map<String,Object> deleteOneUser(Integer id) throws Exception;

    //为用户分配角色
    public Map<String,Object> roleForOneUser(Integer id,String roleList) throws Exception;

    //新增角色
    public Map<String,Object> addRole(String roleName) throws Exception;

    //获取角色分页列表
    public Page<Role> getRolePageList(int currentPage, int pageSize) throws Exception;

    //获取只含简明信息的角色列表(全部角色)
    public List<Role> getSimpleRolePageList() throws Exception;

    //获取角色分页列表ForSearch
    public Page<Role> getRolePageListForSearch(int currentPage, int pageSize,String blurRoleName) throws Exception;

    //删除角色
    public Map<String,Object> deleteOneRole(Integer id) throws Exception;

    //编辑角色
    public Map<String,Object> editOneRole(Integer id,String roleName) throws Exception;

}
