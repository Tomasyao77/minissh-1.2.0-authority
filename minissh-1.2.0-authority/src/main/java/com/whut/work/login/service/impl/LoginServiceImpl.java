package com.whut.work.login.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.whut.work.login.service.ILoginService;
import com.whut.work.user.dao.IUserDao;
import com.whut.work.user.model.User;

@Component
public class LoginServiceImpl implements ILoginService  {

	@Autowired
	private IUserDao userDao;
	
	@Override
	public Map<String, Object> login(String username, String password) throws Exception {
		Map<String,Object> returnMap = new HashMap<String,Object>();
		
		String hql = "from User u where u.username='"+username+"'";
		User user = new User();
		try {
			user = userDao.findOne(hql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(user != null){
			if(user.getPassword().equals(password)){
				returnMap.put("value", user);
				returnMap.put("message", "登录成功");
				returnMap.put("success", true);
			}else{
				returnMap.put("message", "密码错误");
				returnMap.put("success", false);
			}
		}else{
			returnMap.put("message", "该用户不存在!");
			returnMap.put("success", false);
		}
		return returnMap;
	}

	@Override
	public Map<String, Object> register(String username, String password,String tel,String email) throws Exception {
		Map<String,Object> returnMap = new HashMap<String,Object>();
		
		String hql = "from User u where u.username='"+username+"'";
		User user = new User();
		if(userDao.findOne(hql) != null){
			returnMap.put("message", "该用户名已存在...");
			returnMap.put("success", false);
			return returnMap;
		}else{
			user.setUsername(username);
			user.setPassword(password);
            user.setTel(tel);
            user.setEmail(email);
			user.setCreateTime(new Date());
			user.setIsDelete(false);
			userDao.save(user);
			returnMap.put("value", user);
			returnMap.put("message", "注册成功");
			returnMap.put("success", true);
			return returnMap;
		}
	}

    @Override
    public Map<String, Object> editLoger(Integer id,String username, String tel, String email) throws Exception {
        Map<String,Object> returnMap = new HashMap<String,Object>();

        String hql = " from User u where u.id='"+id+"' ";
        if(userDao.findOne(hql) == null){
            returnMap.put("message", "错误:编辑失败");
            returnMap.put("success", false);
            return returnMap;
        }else{
            User user = userDao.findOne(hql);
            if(username != null && !username.equals("")){
                user.setUsername(username);
            }
            if(tel != null && !tel.equals("")){
                user.setTel(tel);
            }
            if(email != null && !email.equals("")){
                user.setEmail(email);
            }
            user.setCreateTime(new Date());
            //user.setIsDelete(false);
            userDao.update(user);
            returnMap.put("value", user);
            returnMap.put("message", "编辑成功");
            returnMap.put("success", true);
            return returnMap;
        }
    }

    @Override
    public Map<String, Object> getLoger(Integer id) throws Exception {
        Map<String,Object> returnMap = new HashMap<String,Object>();

        String hql = " select new com.whut.work.user.vo.UserVo(u.id,u.username,u.tel,u.email) from User u where u.id='"+id+"' ";
        List<User> user = userDao.findList(hql);
        if(user != null){
            returnMap.put("value", user);
            returnMap.put("message", "获取成功");
            returnMap.put("success", true);

        }else{
            returnMap.put("message", "该用户不存在!");
            returnMap.put("success", false);
        }
        return returnMap;
    }


}
