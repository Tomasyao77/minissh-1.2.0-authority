package com.whut.work.user.service.impl;

import com.whut.work.user.dao.impl.RoleDaoImpl;
import com.whut.work.user.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.whut.work.base.model.Page;
import com.whut.work.user.dao.impl.UserDaoImpl;
import com.whut.work.user.model.User;
import com.whut.work.user.service.IUserService;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component
public class UserServiceImpl implements IUserService {
	
	@Autowired
	private UserDaoImpl userDao;
    @Autowired
    private RoleDaoImpl roleDao;

	@Override
	public Page<User> getUserPageList(int currentPage, int pageSize) throws Exception {
		String queryHql = "from User u where u.id!=0 and u.isDelete=0";
		String countHql = "select count(*) from User u where u.id!=0 and u.isDelete=0";
		Page<User> returnPage = userDao.findPage(currentPage, pageSize, queryHql, countHql);
		
		return returnPage;                                 
	}

    @Override
    public Map<String, Object> deleteOneUser(Integer id) throws Exception {
        Map<String,Object> returnMap = new HashMap<String,Object>();

        //String hql = "from User u where u.id='"+id+"'";
        User user = new User();
        try {
            user = userDao.getOne(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(user != null){
            user.setIsDelete(true);
            userDao.update(user);
            returnMap.put("message", "删除成功");
            returnMap.put("success", true);
            return returnMap;
        }else{
            returnMap.put("message", "删除失败");
            returnMap.put("success", false);
            return returnMap;
        }
    }

    @Override
    public Map<String,Object> addRole(String roleName) throws Exception {
        Map<String,Object> returnMap = new HashMap<String,Object>();

        String hql = "from Role r where r.name='"+roleName+"'";
        Role role = new Role();
        if(roleDao.findOne(hql) != null){
            returnMap.put("message", "该角色已存在");
            returnMap.put("success", false);
            return returnMap;
        }else{
            role.setName(roleName);
            role.setCreateTime(new Date());
            roleDao.save(role);
            returnMap.put("value", role);
            returnMap.put("message", "新增角色成功");
            returnMap.put("success", true);
            return returnMap;
        }
    }

    @Override
    public Page<Role> getRolePageList(int currentPage, int pageSize) throws Exception {
        String queryHql = "from Role r where r.id!=0";
        String countHql = "select count(*) from Role r where r.id!=0";
        Page<Role> returnPage = roleDao.findPage(currentPage, pageSize, queryHql, countHql);

        return returnPage;
    }

    @Override
    public Page<Role> getRolePageListForSearch(int currentPage, int pageSize,String blurRoleName) throws Exception {
        String queryHql = "from Role r where r.id!=0 and r.name like '%"+blurRoleName+"%'";
        String countHql = "select count(*) from Role r where r.id!=0 and r.name like '%"+blurRoleName+"%'";
        Page<Role> returnPage = roleDao.findPage(currentPage, pageSize, queryHql, countHql);

        return returnPage;
    }

    @Override
    public Map<String, Object> deleteOneRole(Integer id) throws Exception {
        Map<String,Object> returnMap = new HashMap<String,Object>();

        //String hql = "from User u where u.id='"+id+"'";
        Role role = new Role();
        try {
            role = roleDao.getOne(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(role != null){
            roleDao.delete(role);
            returnMap.put("message", "删除成功");
            returnMap.put("success", true);
            return returnMap;
        }else{
            returnMap.put("message", "删除失败");
            returnMap.put("success", false);
            return returnMap;
        }
    }

    @Override
    public Map<String, Object> editOneRole(Integer id, String roleName) throws Exception {
        Map<String,Object> returnMap = new HashMap<String,Object>();

        String hqlfirst = "from Role r where r.name='"+roleName+"'";
        String hql = "from Role r where r.id='"+id+"'";
        Role role = new Role();

        try {
            role = roleDao.findOne(hql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(role != null){
            if(roleDao.findOne(hqlfirst) != null){
                returnMap.put("message", "该角色已存在");
                returnMap.put("success", false);
                return returnMap;
            }
            role.setName(roleName);
            role.setCreateTime(new Date());
            roleDao.update(role);
            returnMap.put("value", role);
            returnMap.put("message", "修改角色成功");
            returnMap.put("success", true);
        }else{
            returnMap.put("message", "异常:编辑失败");
            returnMap.put("success", false);
        }
        return returnMap;
    }

}
